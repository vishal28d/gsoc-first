import 'package:first/ssh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dartssh2/dartssh2.dart';

// Controller for managing connection state
class ConnectionController extends GetxController {
  var isConnected = false.obs;
  var ip = ''.obs;
  var username = ''.obs;
  var password = ''.obs;
  var port = '22'.obs; // default SSH port
  var rigs = '0'.obs;

  // SSH client instance
  SSHController ssh = SSHController();


  void updateConnectionSettings() {
    // Update connection settings based on user inputs
    ssh.ip = ip.value as RxString;
    ssh.username = username.value as RxString;
    ssh.password = password.value as RxString;
    ssh.port = port.value as RxInt;
    ssh.rigs = rigs.value as RxInt;
  }

  Future<void> connectToLG() async {
    bool? result = await ssh.connectToLG(Get.context!);
    isConnected.value = result!;
  }

 
  Future<void> executeCommand() async {
    SSHSession? session = await ssh.executeCommand('echo "search=MANIT" >/tmp/query.txt');
    if (session != null) {
      print(session.stdout);
    }
  }

}



class ConnectionFlag extends StatelessWidget {
  const ConnectionFlag({super.key, required this.status});
  final bool status;

  @override
  Widget build(BuildContext context) {
    Color color = status ? Colors.green : Colors.red;
    String label = status ? 'CONNECTED' : 'DISCONNECTED';
    return Row(
      children: [
        Icon(
          Icons.circle,
          color: color,
        ),
        const SizedBox(
          width: 5.0,
        ),
        Text(
          label,
          style: TextStyle(color: color, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
