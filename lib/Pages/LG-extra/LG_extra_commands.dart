import 'package:first/Constant/constant.dart';
import 'package:first/Pages/LG-extra/LG-extra-controller.dart';
import 'package:first/widgets/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LgExtraCommands extends StatefulWidget {
   const LgExtraCommands({super.key});

  @override
  State<LgExtraCommands> createState() => _LgExtraCommandsState();
}

class _LgExtraCommandsState extends State<LgExtraCommands> {

  Lg_extra_controller lg_extra_controller = Get.put(Lg_extra_controller());

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            const CustomAppBar("LG Extra Commands") ,
            const SizedBox(height: 20,) ,
            ElevatedButton(onPressed: lg_extra_controller.relaunchLG, child: const Text('Relaunch LG')) ,
            const SizedBox(height: 20,) ,
            ElevatedButton(onPressed: lg_extra_controller.rebootLG, child: const Text('Reboot LG')) ,
            const SizedBox(height: 20,) ,
            ElevatedButton(onPressed: lg_extra_controller.shutdownLG, child: const Text('Shutdown LG')) ,
            const SizedBox(height: 20,) ,
            ElevatedButton(onPressed: lg_extra_controller.cleanVisualization, child: const Text('Clean Visualization')) ,
            const SizedBox(height: 20,) ,
            ElevatedButton(onPressed: ()=> lg_extra_controller.logosLG(lgLogo , 0.5), child: const Text('Show Logo')) ,
            const SizedBox(height: 20,) ,
            ElevatedButton(onPressed: ()=> lg_extra_controller.cleanlogos() , child: const Text('Clean Logo')) ,
            const SizedBox(height: 20,) ,
            ElevatedButton(onPressed: ()=> lg_extra_controller.cleanBalloon() , child: const Text('Clean Balloon')) ,
        
            const SizedBox(height: 20,) ,
            ElevatedButton(onPressed: ()=> lg_extra_controller.kmlOnSlave2() , child: const Text('Clean Balloon')) ,
          

          ],
        ),

    );
  }
}

