import 'package:first/widgets/customElevatedButton.dart';
import 'package:first/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:first/ssh.dart';
import 'package:first/widgets/commandButton.dart';
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
        title: const Text('Lg App'),
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
            child: Column(
              children: [
          
                const CommandButtons(
                  'echo "search=Mount Everest" > /tmp/query.txt',
                  "Navigate to Mount Everest",
                ),
                const CommandButtons(
                  'echo "search=IIIT Bhopal" > /tmp/query.txt',
                  "Navigate to IIIT Bhopal",
                ),
                const CommandButtons(
                  'echo "search=Mumbai" > /tmp/query.txt',
                  "Navigate to Mumbai",
                ),
                const CommandButtons(
                  '''echo "flytoview=<LookAt><longitude>2.2945</longitude><latitude>48.8584</latitude><altitude>50</altitude><heading>0</heading><tilt>60</tilt><range>500</range><gx:altitudeMode>relativeToGround</gx:altitudeMode></LookAt>" > /tmp/query.txt''',
                  "Navigate to Eiffel Tower",
                ),

                const CommandButtons(
                  '''echo "flytoview=<LookAt><longitude>2.2945</longitude><latitude>48.8584</latitude><altitude>50</altitude><heading>360</heading><tilt>60</tilt><range>1200</range><gx:altitudeMode>relativeToGround</gx:altitudeMode></LookAt>" > /tmp/query.txt''',
                  "Revolve around Eiffel Tower",
                ),

                const CommandButtons(
                  '''echo 'flytoview=<LookAt><longitude>-133.8</longitude><latitude>18.65</latitude><altitude>0</altitude><heading>0</heading><tilt>60</tilt><range>1500000</range><altitudeMode>relativeToGround</altitudeMode></LookAt>' > /tmp/query.txt''',
                  "Olympus mons",
                ),

                ElevatedButton(
                  onPressed: () {
                    sshController.executeCommand(
                      '''
                                      echo "<?xml version='1.0' encoding='UTF-8'?>
                    <kml xmlns='http://www.opengis.net/kml/2.2' xmlns:gx='http://www.google.com/kml/ext/2.2'>
                      <Document>
                        <name>Top 3 Highest Peaks Orbit Animation</name>
                        <description>Beautiful orbit animations around the top 3 highest peaks in the world.</description>
                        <Folder>
                          <name>Mount Everest Orbit</name>
                          <Placemark>
                            <name>Mount Everest</name>
                            <description>The highest peak in the world, 8,848.86 meters.</description>
                            <LookAt>
                              <longitude>86.9250</longitude>
                              <latitude>27.9881</latitude>
                              <altitude>5000</altitude>
                              <heading>0</heading>
                              <tilt>70</tilt>
                              <range>10000</range>
                              <gx:altitudeMode>relativeToGround</gx:altitudeMode>
                            </LookAt>
                            <gx:Tour>
                              <name>Orbit Around Mount Everest</name>
                              <gx:Playlist>
                                <gx:FlyTo>
                                  <gx:duration>5.0</gx:duration>
                                  <LookAt>
                                    <longitude>86.9250</longitude>
                                    <latitude>27.9881</latitude>
                                    <altitude>5000</altitude>
                                    <heading>360</heading>
                                    <tilt>70</tilt>
                                    <range>10000</range>
                                    <gx:altitudeMode>relativeToGround</gx:altitudeMode>
                                  </LookAt>
                                </gx:FlyTo>
                              </gx:Playlist>
                            </gx:Tour>
                          </Placemark>
                        </Folder>
                      </Document>
                    </kml>" > /tmp/mountain_orbit.txt && cat /tmp/mountain_orbit.txt > /tmp/query.txt
                                      ''',
                    );
                    debugPrint("Mountain orbit animation command sent");
                  },
                  child: const Text("Orbit Animation for Mountains"),
                ),

                customElevatedButton(
                    "Disconnect LG", () => sshController.closeConnection()),
                customElevatedButton(
                    "shutdown LG", () => sshController.shutdownLG()),
                customElevatedButton(
                    "clear logo",
                    () => sshController.executeCommand(
                        'echo "<?xml version="1.0" encoding="UTF-8"?><kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom"><Document></Document></kml>" > /var/www/html/kml/slave_3.kml')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
