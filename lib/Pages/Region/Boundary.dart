import 'package:first/Pages/Region/boundaryKML.dart';
import 'package:first/services/lg_service.dart';
import 'package:first/widgets/customAppBar.dart';
import 'package:flutter/material.dart';

class Boundary extends StatelessWidget {
  Boundary({super.key});

  String kaziranga = '''<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2">
  <Document>
    <name>Kaziranga National Park Boundary</name>

    <!-- Style for the Boundary -->
    <Style id="boundaryStyle">
      <LineStyle>
        <color>ff0000ff</color> <!-- Blue line -->
        <width>3</width>
      </LineStyle>
      <PolyStyle>
        <color>7d00ff00</color> <!-- Semi-transparent green -->
      </PolyStyle>
    </Style>

    <!-- Kaziranga Boundary -->
    <Placemark>
      <name>Kaziranga National Park</name>
      <styleUrl>#boundaryStyle</styleUrl>
      <Polygon>
        <outerBoundaryIs>
          <LinearRing>
            <coordinates>
              93.3127,26.5740,0  <!-- Point 1 -->
              93.4523,26.5774,0  <!-- Point 2 -->
              93.5758,26.5102,0  <!-- Point 3 -->
              93.6337,26.4602,0  <!-- Point 4 -->
              93.5725,26.4018,0  <!-- Point 5 -->
              93.4512,26.4089,0  <!-- Point 6 -->
              93.3127,26.4748,0  <!-- Point 7 -->
              93.3127,26.5740,0  <!-- Closing the loop -->
            </coordinates>
          </LinearRing>
        </outerBoundaryIs>
      </Polygon>
    </Placemark>
  </Document>
</kml>''';

  String flyToKaziranga =
      '''flytoview=<LookAt><longitude>93.2945</longitude><latitude>26</latitude><altitude>100000</altitude><heading>0</heading><tilt>30</tilt><range>50000</range><gx:altitudeMode>relativeToGround</gx:altitudeMode></LookAt>''';

  String yellowStoneBoundary = '''<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2">
  <Document>
    <name>Yellowstone National Park Boundary</name>

    <!-- Style for the Boundary -->
    <Style id="boundaryStyle">
      <LineStyle>
        <color>ff0000ff</color> <!-- Blue line -->
        <width>3</width>
      </LineStyle>
      <PolyStyle>
        <color>7d00ff00</color> <!-- Semi-transparent green -->
      </PolyStyle>
    </Style>

    <!-- Yellowstone Boundary -->
    <Placemark>
      <name>Yellowstone National Park</name>
      <styleUrl>#boundaryStyle</styleUrl>
      <Polygon>
        <outerBoundaryIs>
          <LinearRing>
            <coordinates>
              -110.5880,44.4265,0  <!-- Point 1 (Southwest) -->
              -110.4400,44.4265,0  <!-- Point 2 -->
              -110.4400,44.6000,0  <!-- Point 3 -->
              -110.5400,44.6850,0  <!-- Point 4 -->
              -110.6800,44.7300,0  <!-- Point 5 -->
              -110.8000,44.7250,0  <!-- Point 6 -->
              -110.9000,44.6700,0  <!-- Point 7 -->
              -110.9500,44.5700,0  <!-- Point 8 -->
              -111.1000,44.5000,0  <!-- Point 9 -->
              -111.0800,44.3750,0  <!-- Point 10 -->
              -110.9500,44.3000,0  <!-- Point 11 -->
              -110.7000,44.2750,0  <!-- Point 12 -->
              -110.5880,44.4265,0  <!-- Closing the loop -->
            </coordinates>
          </LinearRing>
        </outerBoundaryIs>
      </Polygon>
    </Placemark>
  </Document>
</kml>''';

  String flyToyellowStone =
      '''flytoview=<LookAt><longitude>-110.9000</longitude><latitude>44.5000</latitude><altitude>1000000</altitude><heading>0</heading><tilt>20</tilt><range>500000</range><gx:altitudeMode>relativeToGround</gx:altitudeMode></LookAt>''';

  String SaharaDesert = '''<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">
<Document>
	<name>Untitled project</name>
	<gx:CascadingStyle kml:id="__managed_style_2B5CF569D43598F79763">
		<Style>
			<IconStyle>
				<scale>1.2</scale>
				<Icon>
					<href>https://earth.google.com/earth/document/icon?color=1976d2&amp;id=2000&amp;scale=4</href>
				</Icon>
				<hotSpot x="64" y="128" xunits="pixels" yunits="insetPixels"/>
			</IconStyle>
			<LabelStyle>
			</LabelStyle>
			<LineStyle>
				<color>ff2dc0fb</color>
				<width>4.8</width>
			</LineStyle>
			<PolyStyle>
				<color>40ffffff</color>
			</PolyStyle>
			<BalloonStyle>
				<displayMode>hide</displayMode>
			</BalloonStyle>
		</Style>
	</gx:CascadingStyle>
	<gx:CascadingStyle kml:id="__managed_style_1E6C29E84C3598F79763">
		<Style>
			<IconStyle>
				<Icon>
					<href>https://earth.google.com/earth/document/icon?color=1976d2&amp;id=2000&amp;scale=4</href>
				</Icon>
				<hotSpot x="64" y="128" xunits="pixels" yunits="insetPixels"/>
			</IconStyle>
			<LabelStyle>
			</LabelStyle>
			<LineStyle>
				<color>ff2dc0fb</color>
				<width>3.2</width>
			</LineStyle>
			<PolyStyle>
				<color>40ffffff</color>
			</PolyStyle>
			<BalloonStyle>
				<displayMode>hide</displayMode>
			</BalloonStyle>
		</Style>
	</gx:CascadingStyle>
	<StyleMap id="__managed_style_025D71FC893598F79763">
		<Pair>
			<key>normal</key>
			<styleUrl>#__managed_style_1E6C29E84C3598F79763</styleUrl>
		</Pair>
		<Pair>
			<key>highlight</key>
			<styleUrl>#__managed_style_2B5CF569D43598F79763</styleUrl>
		</Pair>
	</StyleMap>
	<Placemark id="0E4AADD3433598F7975D">
		<name>sahara desert</name>
		<LookAt>
			<longitude>20.54542041253946</longitude>
			<latitude>22.69394063061998</latitude>
			<altitude>-1278.409369551326</altitude>
			<heading>358.0772152982352</heading>
			<tilt>0</tilt>
			<gx:fovy>35</gx:fovy>
			<range>12229392.88979531</range>
			<altitudeMode>absolute</altitudeMode>
		</LookAt>
		<styleUrl>#__managed_style_025D71FC893598F79763</styleUrl>
		<Polygon>
			<outerBoundaryIs>
				<LinearRing>
					<coordinates>
						-6.679706883348786,34.01713874197766,0 -16.24740160668077,22.25335532266232,0 -16.46956341878032,14.84967346206536,0 -8.365224657056293,11.96807647475129,0 4.864001777256033,11.44476978827717,0 13.80496276714861,9.909225115012338,0 23.69251785356547,10.4276887386512,0 30.6116098111905,11.91971754170578,0 34.6235050639816,13.90979732575673,0 36.56088081203173,16.27874638035161,0 35.42376691057126,20.43679879306234,0 34.00278742296528,25.56443707715228,0 33.26428079488964,28.31544770248128,0 31.84303913881605,30.51518334121607,0 26.8468122889226,31.44957830325483,0 20.13048066001403,32.63316044600839,0 20.30477578662852,30.76094998655151,0 19.16271183109174,30.29947986745727,0 17.28517614505569,31.22228877682983,0 14.24844958028635,32.14639009578026,0 12.19716945068945,33.38378116785753,0 10.01682983163647,35.8699995866202,0 8.861528216987386,36.72978263998233,0 2.758918029738691,36.30681541367673,0 -0.6722725415923902,35.55363021588571,0 -3.678004851354992,35.15159920889651,0 -6.042816552293645,35.31726013036167,0 -6.679706883348786,34.01713874197766,0 
					</coordinates>
				</LinearRing>
			</outerBoundaryIs>
		</Polygon>
	</Placemark>
</Document>
</kml>
''';

    String flyToSahra =
      '''flytoview=<LookAt><longitude>-6.9000</longitude><latitude>34.5000</latitude><altitude>1000000</altitude><heading>0</heading><tilt>20</tilt><range>500000</range><gx:altitudeMode>relativeToGround</gx:altitudeMode></LookAt>''';

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

          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () async {
              LGService()
                  .sendKML('uranium', MajorUraniumPowerPlant, flyToSahra);
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
                  'Major Uranium Plants',
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
