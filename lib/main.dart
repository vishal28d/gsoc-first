 import 'package:first/Theme/ThemeController.dart';
import 'package:first/myhomepage.dart';
import 'package:first/ssh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(SSHController(), permanent: true);
  

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  final ThemeController themeController = Get.put(ThemeController());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Obx(()=>
       GetMaterialApp(
        title: 'LG APP',
        debugShowCheckedModeBanner: false ,
        // theme: ThemeData(
        //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //   useMaterial3: true,
        // ),
        theme: themeController.isDarkMode.value ? ThemeData.dark() : ThemeData.light(),
        home:  const Myhomepage(),
        
      ),
    );
  }
}
 

