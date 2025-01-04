import 'package:first/Pages/LG-extra/LG_extra_commands.dart';
import 'package:first/Planets/Earth.dart';
import 'package:first/myhomepage.dart';
import 'package:first/Pages/settings.dart';
import 'package:first/ssh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Icon(FontAwesomeIcons.facebook);

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

SSHController ssh = SSHController();

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Image.asset('assets/lg_logo.webp') ,
          ),
          ListTile(
            leading:  Image.asset('assets/home.png' , height: 30, width: 30,),
            title: const Text('Home'),
            onTap: () {
              Get.to(() => const Myhomepage());
            },
          ),
          ListTile(
            leading:  Image.asset('assets/settings.png' , height: 30, width: 30,),
            title: const Text('Settings'),
            onTap: () {
              Get.to(() => const Settings());
            },
          ),
          ListTile(
            leading:  Image.asset('assets/moon.png' , height: 30, width: 30,),
            title: const Text('Moon'),
            onTap: () {
              ssh.planetMoon();
            },
          ),
          ListTile(
            leading:  Image.asset('assets/mars.png' , height: 30, width: 30,),
            title: const Text('Mars'),
            onTap: () {
              ssh.planetMars();
            },
          ),
          ListTile(
             leading:  Image.asset('assets/earth.png' , height: 30, width: 30,),
            title: const Text('Earth'),
            onTap: () {
            Get.to(const EarthPage());
            },
          ),
          ListTile(
            leading:  Image.asset('assets/earth.png' , height: 30, width: 30,),
            title: const Text('Extra Commands'),
            onTap: () {
            Get.to( LgExtraCommands());
            },
          ),


        ],
      ),
    );
  }
}
