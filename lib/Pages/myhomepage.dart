import 'package:first/Pages/Region/Boundary.dart';
import 'package:first/Pages/Explore%20Tour/RadiationCloud.dart';
import 'package:first/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:first/ssh.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Myhomepage extends StatefulWidget {
  const Myhomepage({super.key});

  @override
  State<Myhomepage> createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> {
  SSHController sshController = SSHController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liquid Galaxy'),
        centerTitle: true,
        backgroundColor: const Color(0xff324860),
        toolbarTextStyle: const TextStyle(color: Colors.white),
        titleTextStyle: GoogleFonts.raleway(color: Colors.white, fontSize: 30),
      ),
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(30),
            child: Center(
              child: Column(
                children: [

                  GestureDetector(
                    onTap: ()=> Get.to(Chernobyl()) ,
                    child: Container(
                      height: 100,
                      width: 280,
                      decoration: BoxDecoration(
                        color: const Color(0xFF4DA1A9),
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: const Offset(0, 4),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          'Radiation Cloud',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1.5,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () => Get.to(Boundary()),
                    child: Container(
                      height: 100,
                      width: 280,
                      decoration: BoxDecoration(
                        color: const Color(0xFF4DA1A9),
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: const Offset(0, 4),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          'Region Map',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1.5,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
