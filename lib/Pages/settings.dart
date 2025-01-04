import 'package:first/Theme/ThemeController.dart';
import 'package:first/widgets/customElevatedButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ssh.dart'; // Import your SSH class.

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  @override
  Widget build(BuildContext context) {
    // GetX controller instance
    final SSHController controller = Get.put(SSHController(), permanent: true);
    final themeController = Get.find<ThemeController>();
    RxBool isDarkMode = themeController.isDarkMode;

    return SafeArea(
      child: Scaffold(
        backgroundColor:
            themeController.isDarkMode.value ? Colors.black : Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              Row(children: [
                Container(
                  padding: const EdgeInsets.only(right: 100),
                  child: GestureDetector(
                    child: Icon(Icons.arrow_back, color: themeController.isDarkMode.value? Colors.white: Colors.black),
                    onTap: () => Navigator.pop(context),
                  ),
                ),
                const SizedBox(
                  width: 150,
                ),
                Obx(() {
                  return IconButton(
                    iconSize: 35,
                    onPressed: themeController.toggleTheme,
                    icon: themeController.isDarkMode.value
                        ? const Icon(Icons.light_mode)
                        : const Icon(Icons.dark_mode),
                  );
                }),
              ]),
              // Display the connection status
              Obx(() {
                return ConnectionFlag(status: controller.isConnected.value);
              }),
              // Text fields for settings
              customInput(controller.ip, themeController , "IP Address"),
              customInput(controller.username, themeController, "Username"),
              customInput(controller.password, themeController, "Password"),
              customInput(controller.port, themeController, "Port"),
              customInput(controller.rigs, themeController, "Rigs"),

              // Button to connect
              customElevatedButton("Connect", controller.connectToLG(context)),

              // Button to execute SSH command
              customElevatedButton(
                  "Check",
                  controller.executeCommand(
                      'echo "search=Manit bhopal" >/tmp/query.txt')),
              const SizedBox(
                height: 5,
              ),
              customElevatedButton(
                    "Disconnect", 
                    controller.closeConnection()
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customInput(Rx<dynamic> controller, ThemeController themeController, String labelText) {
    return Padding(
      padding: const EdgeInsets.all(7),
      child: Obx(() {
        return TextFormField(
          style: TextStyle(color: themeController.isDarkMode.value? Colors.white : Colors.black87),
          controller: TextEditingController(
            text: controller.value is String
                ? controller.value
                : controller.value.toString(),
          ),
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: TextStyle(color: themeController.isDarkMode.value? Colors.white : Colors.black87),
          ),
          onChanged: (value) {
            controller.value = value;
          },
        );
      }),
    );
  }
}

class ConnectionFlag extends StatelessWidget {
  final bool status;
  const ConnectionFlag({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color color = status ? Colors.green : Colors.red;
    String label = status ? 'CONNECTED' : 'DISCONNECTED';
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(color: color, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
