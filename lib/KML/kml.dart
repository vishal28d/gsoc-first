import 'dart:io';

class Kml {
  // String mountains

  String newYorkKML = '''<?xml version="1.0" encoding="UTF-8"?>
      <kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2">
        <Document>
          <Placemark>
            <name>Fly to New York</name>
            <LookAt>
              <longitude>-74.006</longitude> <!-- Longitude of New York -->
              <latitude>40.7128</latitude>   <!-- Latitude of New York -->
              <altitude>0</altitude>
              <range>10000</range>          <!-- Distance from the ground -->
              <tilt>45</tilt>               <!-- Viewing angle -->
              <heading>0</heading>          <!-- Direction -->
              <gx:altitudeMode>relativeToGround</gx:altitudeMode>
            </LookAt>
          </Placemark>
        </Document>
      </kml>
      ''';

  String goaKML = '''<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2">
  <Document>
    <name>Square Around Goa</name>
    <!-- Square polygon around Goa -->
    <Placemark>
      <name>Square Around Goa</name>
      <description>A square polygon around Goa, India.</description>
      <styleUrl>#squareStyle</styleUrl>
      <Polygon>
        <outerBoundaryIs>
          <LinearRing>
            <coordinates>
              73.5000,15.8000,0 <!-- Top-left corner -->
              74.1000,15.8000,0 <!-- Top-right corner -->
              74.1000,14.8000,0 <!-- Bottom-right corner -->
              73.5000,14.8000,0 <!-- Bottom-left corner -->
              73.5000,15.8000,0 <!-- Closing the square -->
            </coordinates>
          </LinearRing>
        </outerBoundaryIs>
      </Polygon>
    </Placemark>

    <!-- Style for the square polygon -->
    <Style id="squareStyle">
      <LineStyle>
        <color>ff0000ff</color> <!-- Blue border -->
        <width>2</width>
      </LineStyle>
      <PolyStyle>
        <color>7fff0000</color> <!-- Semi-transparent red fill -->
      </PolyStyle>
    </Style>

  </Document>
</kml>''';

  // String flyToGoa;

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
