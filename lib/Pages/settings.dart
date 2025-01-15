import 'package:first/Theme/ThemeController.dart';
import 'package:first/ssh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
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
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 100),
                    child: GestureDetector(
                      child: Icon(Icons.arrow_back,
                          color: themeController.isDarkMode.value
                              ? Colors.white
                              : Colors.black),
                      onTap: () => Navigator.pop(context),
                    ),
                  ),
                  const SizedBox(
                    width: 150,
                  ),
                  Obx(() {
                    return IconButton(
                      iconSize: 35,
                      onPressed: () async{
                       themeController.toggleTheme();
                      },
                      icon: themeController.isDarkMode.value
                          ? const Icon(Icons.light_mode)
                          : const Icon(Icons.dark_mode),
                    );
                  }),
                ],
              ),
              // Display the connection status
              Obx(() {
                return ConnectionFlag(status: controller.isConnected.value);
              }),
              // Text fields for settings
              customInput(controller.ip, themeController, "IP Address"),
              customInput(controller.username, themeController, "Username"),
              customInput(controller.password, themeController, "Password"),
              customInput(controller.port, themeController, "Port"),
              customInput(controller.rigs, themeController, "Rigs"),
              // Button to connect
              ElevatedButton(
                 style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF62825D),  
                animationDuration: const Duration(seconds: 1), 
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),  
                fixedSize: const Size(150, 40),  
              ),
                onPressed: () async {
                  bool? result = await controller.connectToLG();
                  if (result == true) {
                    controller.showSnackBar(
                      context: context,
                      message: 'Connected Successfully',
                    );
                  } else {
                    controller.showSnackBar(
                      context: context,
                      message: 'Connection Failed',
                      color: Colors.red,
                    );
                  }
                },
                child: const Text("Connect",  style: TextStyle(color: Colors.white, fontSize: 16),),
              ),
              // Button to execute SSH command
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF62825D),  
                animationDuration: const Duration(seconds: 1), 
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),  
                fixedSize: const Size(150, 40),  
              ),

                onPressed: () async {
                  await controller.executeCommand(
                      'echo "search=Lleida" >/tmp/query.txt');
                },
                child: const Text("Check" ,   style: const TextStyle(color: Colors.white, fontSize: 16),),
              ),
              const SizedBox(
                height: 5,
              ),
              ElevatedButton(
                 style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF62825D),  
                animationDuration: const Duration(seconds: 1), 
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),  
                fixedSize: const Size(150, 40),  
              ),
                onPressed: () async {
                  await controller.closeConnection();
                  controller.showSnackBar(
                    context: context,
                    message: 'Disconnected Successfully',
                    color: Colors.orange,
                  );
                },
                child: const Text("Disconnect" ,  style: const TextStyle(color: Colors.white, fontSize: 16),),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customInput(Rx<dynamic> controller, ThemeController themeController,
      String labelText) {
    return Padding(
      padding: const EdgeInsets.all(7),
      child: Obx(() {
        return TextFormField(
          style: TextStyle(
            color: themeController.isDarkMode.value
                ? Colors.white
                : Colors.black87,
          ),
          controller: TextEditingController(
            text: controller.value is String
                ? controller.value
                : controller.value.toString(),
          ),
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: TextStyle(
              color: themeController.isDarkMode.value
                  ? Colors.white
                  : Colors.black87,
            ),
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          status ? Icons.check_circle : Icons.cancel,
          color: color,
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(color: color, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
