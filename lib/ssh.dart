
import 'package:dartssh2/dartssh2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

class SSHController {
  // Singleton instance
  static final SSHController _instance = SSHController._internal();

  // Factory constructor to return the singleton instance
  factory SSHController() {
    return _instance;
  }

  // Private constructor
  SSHController._internal();

  RxBool isConnected = false.obs;
  RxString ip = '192.168.56.101'.obs;
  RxString username = 'lg'.obs;
  RxString password = 'lg'.obs;
  RxInt port = 22.obs;
  RxInt rigs = 3.obs;
  SSHClient? client;

  // Snackbar utility
  void showSnackBar({
    required BuildContext context,
    required String message,
    int duration = 3,
    Color color = Colors.green,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(fontSize: 14, color: color),
        ),
        backgroundColor: Colors.black.withOpacity(0.9),
        duration: Duration(seconds: duration),
      ),
    );
  }

  // Connect to the SSH server
  Future<bool?> connectToLG() async {
    try {
      final socket = await SSHSocket.connect(
        ip.value,
        port.value,
        timeout: const Duration(seconds: 3),
      );
      client = SSHClient(
        socket,
        username: username.value,
        onPasswordRequest: () => password.value,
      );

     isConnected.value = true;

      return true;
    } catch (e) {
      isConnected.value = false;
      print('Failed to connect: $e');
      Get.rawSnackbar(message: e.toString(),);
      return false;
    }
  }

  // Close the connection
  Future<void> closeConnection() async {
    if (isConnected.value) {
      try {
        client?.close();
        isConnected.value = false;
        print("SSH connection closed.");
      } catch (e) {
        print("Error closing SSH connection: $e");
      }
    } else {
      print("No active SSH connection to close.");
    }
  }

  Future shutdownLG() async {
    try {
      for (var i = int.parse(rigs.value.toString()); i >= 1; i--) {
        await client!.execute(
            'sshpass -p $password ssh -t lg$i "echo $password | sudo -S poweroff"');
      }
    } catch (e) {
      print('Could not connect to host LG');
      return Future.error(e);
    }
  }

  // relaunch
  Future<void> relaunchLG() async {
    try {
      final result = await executeCommand('lg-relaunch');
      if (result != null) {
        print("Liquid Galaxy Relaunched Successfully: $result");
      } else {
        print("Failed to relaunch Liquid Galaxy.");
      }
    } catch (e) {
      print('An error occurred while relaunching Liquid Galaxy: $e');
    }
  }

  // Execute a command
  Future<SSHSession?> executeCommand(String command) async {
    try {
      if (client == null) {
        print('SSH client is not initialized.');
        return null;
      }
      print(command.toString());
      await client!.execute(command);
    } catch (e) {
      print('command executing222');
      print('An error occurred while executing the command: $e');
      return null;
    }
    return null;
  }

  // Specialized commands for Liquid Galaxy

  Future<SSHSession?> search(String place) async {
    return executeCommand('echo "search=$place" >/tmp/query.txt');
  }

  Future<SSHSession?> planetMoon() async {
    return executeCommand('echo "planet=moon" >/tmp/query.txt');
  }

  Future<SSHSession?> planetMars() async {
    return executeCommand('echo "planet=mars" >/tmp/query.txt');
  }

  Future<SSHSession?> planetEarth() async {
    return executeCommand('echo "planet=earth" >/tmp/query.txt');
  }
}
