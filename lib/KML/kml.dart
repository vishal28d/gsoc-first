import 'dart:io';

class Kml {
    // String mountains

Future<void> createFlyToOrbitKML({
  required double longitude,
  required double latitude,
  double altitude = 1000.0,
  double tilt = 45.0,
  double flyToDuration = 5.0,
  double orbitDuration = 10.0,
  required String filePath,
}) async {
  final kmlContent = '''
<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2" 
     xmlns:gx="http://www.google.com/kml/ext/2.2">
  <Document>
    <name>Fly and Orbit Animation</name>
    <gx:Tour>
      <name>FlyTo and Orbit</name>
      <gx:Playlist>
        
        <!-- FlyTo the place -->
        <gx:FlyTo>
          <gx:duration>${flyToDuration.toStringAsFixed(1)}</gx:duration>
          <gx:flyToMode>smooth</gx:flyToMode>
          <Camera>
            <longitude>${longitude.toStringAsFixed(6)}</longitude>
            <latitude>${latitude.toStringAsFixed(6)}</latitude>
            <altitude>${altitude.toStringAsFixed(1)}</altitude>
            <heading>0</heading>
            <tilt>${tilt.toStringAsFixed(1)}</tilt>
            <roll>0</roll>
            <altitudeMode>relativeToGround</altitudeMode>
          </Camera>
        </gx:FlyTo>
        
        <!-- Orbit by changing heading -->
        <gx:FlyTo>
          <gx:duration>${orbitDuration.toStringAsFixed(1)}</gx:duration>
          <gx:flyToMode>smooth</gx:flyToMode>
          <Camera>
            <longitude>${longitude.toStringAsFixed(6)}</longitude>
            <latitude>${latitude.toStringAsFixed(6)}</latitude>
            <altitude>${altitude.toStringAsFixed(1)}</altitude>
            <heading>360</heading> <!-- Complete orbit -->
            <tilt>${tilt.toStringAsFixed(1)}</tilt>
            <roll>0</roll>
            <altitudeMode>relativeToGround</altitudeMode>
          </Camera>
        </gx:FlyTo>
        
      </gx:Playlist>
    </gx:Tour>
  </Document>
</kml>
''';

  // Write the KML content to the file
  final file = File(filePath);
  await file.writeAsString(kmlContent);

  print('KML file created at: $filePath');
}




}