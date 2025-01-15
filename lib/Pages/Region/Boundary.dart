import 'package:first/KML/kml.dart';
import 'package:first/Pages/Region/boundaryKML.dart';
import 'package:first/services/lg_service.dart';
import 'package:first/widgets/customAppBar.dart';
import 'package:flutter/material.dart';

class Boundary extends StatelessWidget {
  Boundary({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar('Geographical Region'),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () async {
              LGService()
                  .sendKML('kaziranga_boundary', kaziranga, flyToKaziranga);
            },
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
                child: Text(
                  'Kaziranga National Park',
                  style: TextStyle(
                    fontSize: 20,
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
            onTap: () async {
              LGService().sendKML(
                  'yellow_stone', yellowStoneBoundary, flyToyellowStone);
            },
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
                child: Text(
                  'YellowStone National Park',
                  style: TextStyle(
                    fontSize: 20,
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
            onTap: () async {
              LGService().sendKML('himalayas', himalayaBoundary, flyToHimalaya);
            },
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
                child: Text(
                  'Himalayas',
                  style: TextStyle(
                    fontSize: 20,
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
            onTap: () async {
              LGService()
                  .sendKML('Sahara Desert', SaharaDesert, flyToSahra);
            },
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
                child: Text(
                  'Sahara Desert',
                  style: TextStyle(
                    fontSize: 20,
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
    );
  }
}
