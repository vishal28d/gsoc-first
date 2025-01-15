import 'package:first/KML/kml.dart';
import 'package:first/Pages/Region/boundaryKML.dart';
import 'package:first/services/lg_service.dart';
import 'package:first/widgets/customAppBar.dart';
import 'package:flutter/material.dart';

class Chernobyl extends StatelessWidget {
   const Chernobyl({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar('Radiation Cloud'),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: ()=> LGService().sendKML(
              'Chernobyl', chernobyl , '' ,
            ),
            child: Container(
              height: 100,
              width: 300,
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
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Chernobyl radiation Cloud',
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
          ),
        ],
      ),
    );
  }
}
