import 'package:first/widgets/commandButton.dart';
import 'package:first/widgets/customAppBar.dart';
import 'package:first/widgets/custom_card.dart';
import 'package:first/widgets/drawer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EarthPage extends StatelessWidget {
  const EarthPage({super.key});

  Future<void> generateOrbitCommands({
    required double longitude,
    required double latitude,
    double altitude = 50.0,
    double tilt = 60.0,
    double range = 1200.0,
    int steps =
        2, // Number of steps for the orbit (e.g., 36 for 10-degree increments)
  }) async {
    const commandPrefix = '''echo "flytoview=<LookAt>''';
    const commandSuffix = '''</LookAt>" > /tmp/query.txt''';

    for (int i = 0; i < steps; i++) {
      double heading = (360 / steps) * i; // Calculate heading for each step
      String command = '''
      $commandPrefix<longitude>$longitude</longitude><latitude>$latitude</latitude>
      <altitude>$altitude</altitude><heading>$heading</heading>
      <tilt>$tilt</tilt><range>$range</range><gx:altitudeMode>relativeToGround</gx:altitudeMode>
      $commandSuffix
      ''';

      await ssh.executeCommand(command);
      if (kDebugMode) {
        print(i);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar("Earth"),
          const SizedBox(
            height: 20,
          ),
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
            '''echo 'flytoview=<LookAt><longitude>-133.8</longitude><latitude>18.65</latitude><altitude>0</altitude><heading>0</heading><tilt>60</tilt><range>1500000</range><altitudeMode>relativeToGround</altitudeMode></LookAt>' > /tmp/query.txt
          ''',
            "Olympus mons",
          ),
          ElevatedButton(
              onPressed: () {
                generateOrbitCommands(longitude: 2.2945, latitude: 48.8584);
              },
              child: const Text('orbit around Eiffel Tower'))
        ],
      ),
    );
  }
}
