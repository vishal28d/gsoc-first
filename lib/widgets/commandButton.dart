import 'package:first/ssh.dart';
import 'package:flutter/material.dart';

class CommandButtons extends StatelessWidget {
  final String command;
  final String commandName;

  const CommandButtons(this.command, this.commandName, {super.key});

  @override
  Widget build(BuildContext context) {
    SSHController ssh = SSHController();

    return Container(
      height: 50,
      width: 300,
      margin: const EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: () async {
          // Replace with your command execution logic
          debugPrint('Executing command: $command');
          await ssh.executeCommand(command);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF62825D),
          animationDuration: const Duration(seconds: 1),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        child: Text(
          commandName,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
