import 'package:first/Pages/LG-extra/LG-extra-controller.dart';
import 'package:first/widgets/customAppBar.dart';
import 'package:first/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LgExtraCommands extends StatefulWidget {
   const LgExtraCommands({super.key});

  @override
  State<LgExtraCommands> createState() => _LgExtraCommandsState();
}

class _LgExtraCommandsState extends State<LgExtraCommands> {

  Lg_extra_controller lg_extra_controller = Get.put(Lg_extra_controller());

  logosLG(String imageUrl, double factor) async {
    String numberOfRigs =ssh.rigs.value.toString() ;
    int leftRig = (int.parse(numberOfRigs) / 2).floor() + 2;
    String kml = '''<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">
    <Document id ="logo">
         <name>Smart City Dashboard</name>
             <Folder>
                  <name>Splash Screen</name>
                  <ScreenOverlay>
                      <name>Logo</name>
                      <Icon><href>$imageUrl</href> </Icon>
                      <overlayXY x="0" y="1" xunits="fraction" yunits="fraction"/>
                      <screenXY x="0" y="1" xunits="fraction" yunits="fraction"/>
                      <rotationXY x="0" y="0" xunits="fraction" yunits="fraction"/>
                      <size x="900" y="${900 * factor}" xunits="pixels" yunits="pixels"/>
                  </ScreenOverlay>
             </Folder>
    </Document>
</kml>''';
    try {
      return await ssh
          .executeCommand("echo '$kml' > /var/www/html/kml/slave_$leftRig.kml");
    } catch (e) {
      return Future.error(e);
    }
  }

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

          ],
        ),

    );
  }
}

