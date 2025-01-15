String himalayaBoundary = '''<?xml version="1.0" encoding="UTF-8"?>
<KML xmlns="http://www.opengis.net/kml/2.2">
  <Document>
    <name>Himalaya Border</name>
    <Style id="whiteLineStyle">
      <LineStyle>
        <color>ffffffff</color> <!-- white color -->
        <width>3</width> <!-- border thickness -->
      </LineStyle>
    </Style>

    <Placemark>
      <name>Himalaya Border</name>
      <styleUrl>#whiteLineStyle</styleUrl>
      <LineString>
        <coordinates>
          <!-- Coordinates representing the border of the Himalayas (these are just sample coordinates) -->
          78.5,35.5,0
          79.0,35.0,0
          79.5,34.7,0
          80.0,34.4,0
          80.5,34.2,0
          81.0,34.0,0
          <!-- Add more coordinates as needed for the full border -->
        </coordinates>
      </LineString>
    </Placemark>
  </Document>
</KML>''';

String flyToHimalaya =
    '''flytoview=<LookAt><longitude>78</longitude><latitude>35</latitude><altitude>1000000</altitude><heading>0</heading><tilt>20</tilt><range>500000</range><gx:altitudeMode>relativeToGround</gx:altitudeMode></LookAt>''';

String MajorUraniumPowerPlant = '''<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2">
  <Document>
    <name>Chernobyl Radiation with Cloud</name>

    <!-- Style for Radiation Icon -->
    <Style id="radiationIconStyle">
      <IconStyle>
        <Icon>
          <href>https://pngimg.com/uploads/radiation/radiation_PNG99512.png</href>
        </Icon>
      </IconStyle>
    </Style>

    <!-- Style for Radiation Cloud -->
    <Style id="cloudStyle">
      <PolyStyle>
        <color>7dff0000</color> <!-- Semi-transparent red color for the cloud -->
        <fill>1</fill>
        <outline>0</outline>
      </PolyStyle>
    </Style>

    <!-- Chernobyl Location with Radiation Icon -->
     <Placemark>
      <name>Chernobyl</name>
      <styleUrl>#radiationIconStyle</styleUrl>
      <Point>
        <coordinates>30.0444,51.2760,0</coordinates> <!-- Latitude, Longitude of Chernobyl, Ukraine -->
      </Point>
    </Placemark>

    <!-- Radiation Cloud around Chernobyl -->
    <Placemark>
      <name>Radiation Cloud</name>
      <styleUrl>#cloudStyle</styleUrl>
      <Polygon>
        <outerBoundaryIs>
          <LinearRing>
            <coordinates>
              <!-- Coordinates for a circular region -->
              30.0444,51.2960,0
              30.0544,51.2920,0
              30.0634,51.2830,0
              30.0684,51.2760,0
              30.0634,51.2690,0
              30.0544,51.2600,0
              30.0444,51.2560,0
              30.0344,51.2600,0
              30.0254,51.2690,0
              30.0204,51.2760,0
              30.0254,51.2830,0
              30.0344,51.2920,0
              30.0444,51.2960,0 <!-- Closing the circle -->
            </coordinates>
          </LinearRing>
        </outerBoundaryIs>
      </Polygon>
    </Placemark>
  </Document>
</kml>''';

String GobiDesert_border = '''<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2">
  <Document>
    <name>Gobi Desert Border</name>

    <!-- Style for Border Line -->
    <Style id="whiteBorderLine">
      <LineStyle>
        <color>ffffffff</color> <!-- White color -->
        <width>3</width> <!-- Line width -->
      </LineStyle>
    </Style>

    <!-- Gobi Desert Border -->
    <Placemark>
      <name>Gobi Desert Border</name>
      <styleUrl>#whiteBorderLine</styleUrl>
      <LineString>
        <extrude>1</extrude>
        <tessellate>1</tessellate>
        <coordinates>
          103.8452,43.9961,0
          103.0336,43.5012,0
          102.1110,43.2436,0
          101.0831,42.8865,0
          100.2131,42.1507,0
          99.3820,41.8271,0
          98.9720,41.1507,0
          98.5000,40.7460,0
          97.8865,40.1343,0
          97.2510,39.6540,0
          96.5021,39.0495,0
          96.0000,38.3500,0
        </coordinates>
      </LineString>
    </Placemark>

  </Document>
</kml>''';


  
  String sevenWonders = '''<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2">
  <Document>
    <name>Seven Wonders of the World</name>

    <!-- Style for Star Pin -->
    <Style id="starPinStyle">
      <IconStyle>
        <scale>1.2</scale>
        <Icon>
          <href>http://maps.google.com/mapfiles/kml/shapes/star.png</href>
        </Icon>
      </IconStyle>
    </Style>

    <!-- Tour -->
    <gx:Tour>
      <name>Seven Wonders Tour</name>
      <gx:Playlist>
        <!-- Great Wall of China -->
        <gx:FlyTo>
          <gx:duration>5</gx:duration>
          <gx:flyToMode>smooth</gx:flyToMode>
          <LookAt>
            <longitude>116.5703749</longitude>
            <latitude>40.4319077</latitude>
            <altitude>10000</altitude>
            <heading>30</heading>
            <tilt>45</tilt>
            <range>5000</range>
            <altitudeMode>relativeToGround</altitudeMode>
          </LookAt>
        </gx:FlyTo>
        <gx:Wait>
          <gx:duration>6</gx:duration>
        </gx:Wait>

        <!-- Petra -->
        <gx:FlyTo>
          <gx:duration>5</gx:duration>
          <gx:flyToMode>smooth</gx:flyToMode>
          <LookAt>
            <longitude>35.4444</longitude>
            <latitude>30.3285</latitude>
            <altitude>10000</altitude>
            <heading>30</heading>
            <tilt>45</tilt>
            <range>5000</range>
            <altitudeMode>relativeToGround</altitudeMode>
          </LookAt>
        </gx:FlyTo>
        <gx:Wait>
          <gx:duration>6</gx:duration>
        </gx:Wait>

        <!-- Christ the Redeemer -->
        <gx:FlyTo>
          <gx:duration>5</gx:duration>
          <gx:flyToMode>smooth</gx:flyToMode>
          <LookAt>
            <longitude>-43.2105</longitude>
            <latitude>-22.9519</latitude>
            <altitude>10000</altitude>
            <heading>30</heading>
            <tilt>45</tilt>
            <range>5000</range>
            <altitudeMode>relativeToGround</altitudeMode>
          </LookAt>
        </gx:FlyTo>
        <gx:Wait>
          <gx:duration>6</gx:duration>
        </gx:Wait>

        <!-- Machu Picchu -->
        <gx:FlyTo>
          <gx:duration>5</gx:duration>
          <gx:flyToMode>smooth</gx:flyToMode>
          <LookAt>
            <longitude>-72.5450</longitude>
            <latitude>-13.1631</latitude>
            <altitude>10000</altitude>
            <heading>30</heading>
            <tilt>45</tilt>
            <range>5000</range>
            <altitudeMode>relativeToGround</altitudeMode>
          </LookAt>
        </gx:FlyTo>
        <gx:Wait>
          <gx:duration>6</gx:duration>
        </gx:Wait>

        <!-- Chichen Itza -->
        <gx:FlyTo>
          <gx:duration>5</gx:duration>
          <gx:flyToMode>smooth</gx:flyToMode>
          <LookAt>
            <longitude>-88.5678</longitude>
            <latitude>20.6843</latitude>
            <altitude>10000</altitude>
            <heading>30</heading>
            <tilt>45</tilt>
            <range>5000</range>
            <altitudeMode>relativeToGround</altitudeMode>
          </LookAt>
        </gx:FlyTo>
        <gx:Wait>
          <gx:duration>6</gx:duration>
        </gx:Wait>

        <!-- Colosseum -->
        <gx:FlyTo>
          <gx:duration>5</gx:duration>
          <gx:flyToMode>smooth</gx:flyToMode>
          <LookAt>
            <longitude>12.4924</longitude>
            <latitude>41.8902</latitude>
            <altitude>10000</altitude>
            <heading>30</heading>
            <tilt>45</tilt>
            <range>5000</range>
            <altitudeMode>relativeToGround</altitudeMode>
          </LookAt>
        </gx:FlyTo>
        <gx:Wait>
          <gx:duration>6</gx:duration>
        </gx:Wait>

        <!-- Taj Mahal -->
        <gx:FlyTo>
          <gx:duration>5</gx:duration>
          <gx:flyToMode>smooth</gx:flyToMode>
          <LookAt>
            <longitude>78.0421</longitude>
            <latitude>27.1751</latitude>
            <altitude>10000</altitude>
            <heading>30</heading>
            <tilt>45</tilt>
            <range>5000</range>
            <altitudeMode>relativeToGround</altitudeMode>
          </LookAt>
        </gx:FlyTo>
        <gx:Wait>
          <gx:duration>6</gx:duration>
        </gx:Wait>

      </gx:Playlist>
    </gx:Tour>

  </Document>
</kml>''';
