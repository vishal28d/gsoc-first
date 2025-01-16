import 'dart:async';
import 'dart:io';

import 'package:dartssh2/dartssh2.dart';
import 'package:first/services/lg_service.dart';
import 'package:first/ssh.dart';
import 'package:first/widgets/drawer.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class Lg_extra_controller {
  SSHClient? _client;
  late String _host;
  late String _port;
  late String _username;
  late String _passwordOrKey;
  late String _numberOfRigs;

  Future<void> initConnectionDetails() async {
    SSHController sshController = Get.find<SSHController>();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _host = prefs.getString('ipAddress') ?? sshController.ip.value;
    _port = prefs.getString('sshPort') ?? ssh.port.value.toString();
    _username = prefs.getString('username') ?? ssh.username.value;
    _passwordOrKey = prefs.getString('password') ?? ssh.password.value;
    _numberOfRigs =
        prefs.getString('numberOfRigs') ?? ssh.rigs.value.toString();
  }

  Future<bool?> connectToLG() async {
    await initConnectionDetails();
    try {
      _client = SSHClient(await SSHSocket.connect(_host, int.parse(_port)),
          username: _username, onPasswordRequest: () => _passwordOrKey);
      return true;
    } on SocketException catch (e) {
      print('Failed to connect: $e');
      return false;
    }
  }

  rebootLG() async {
    try {
      connectToLG();

      for (int i = int.parse(_numberOfRigs); i > 0; i--) {
        await _client!.execute(
            'sshpass -p $_passwordOrKey ssh -t lg$i "echo $_passwordOrKey | sudo -S reboot"');
      }
      return null;
    } catch (e) {
      print("An error occurred while executing the command: $e");
      return null;
    }
  }

  relaunchLG() async {
    try {
      connectToLG();

      final execResult = await _client!.execute("""RELAUNCH_CMD="\\
          if [ -f /etc/init/lxdm.conf ]; then
            export SERVICE=lxdm
          elif [ -f /etc/init/lightdm.conf ]; then
            export SERVICE=lightdm
          else
            exit 1
          fi
          if  [[ \\\$(service \\\$SERVICE status) =~ 'stop' ]]; then
            echo $_passwordOrKey | sudo -S service \\\${SERVICE} start
          else
            echo $_passwordOrKey | sudo -S service \\\${SERVICE} restart
          fi
          " && sshpass -p $_passwordOrKey ssh -x -t lg@lg1 "\$RELAUNCH_CMD\"""");
      return execResult;
    } catch (e) {
      print("An error occurred while executing the command: $e");
      return null;
    }
  }

  Future shutdownLG() async {
    try {
      connectToLG();

      for (var i = int.parse(_numberOfRigs); i >= 1; i--) {
        await _client!.execute(
            'sshpass -p $_passwordOrKey ssh -t lg$i "echo $_passwordOrKey | sudo -S poweroff"');
      }
    } catch (e) {
      print('Could not connect to host LG');
      return Future.error(e);
    }
  }

  cleanVisualization() async {
    try {
      connectToLG();
      await LGService().sendKML('cleankml','''<?xml version="1.0" encoding="UTF-8"?>
      <kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">
        <Document>
        </Document>
      </kml>''' , '');
    } catch (e) {
      print('Could not connect to host LG');
      return Future.error(e);
    }
  }

  cleanBeforeOrbit() async {
    try {
      connectToLG();
      await _client!.execute(
          'echo "exittour=true" > /tmp/query.txt && > /var/www/html/kmls.txt');
    } catch (e) {
      print('Could not connect to host LG');
    }
  }

  flyTo(String command) async {
    try {
      print(command);
      connectToLG();
      await _client!.execute(command);
    } catch (e) {
      print("error in flyto");
    }
  }

  Future<void> setRefresh() async {
    const search = '<href>##LG_PHPIFACE##kml\\/slave_{{slave}}.kml<\\/href>';
    const replace =
        '<href>##LG_PHPIFACE##kml\\/slave_{{slave}}.kml<\\/href><refreshMode>onInterval<\\/refreshMode><refreshInterval>2<\\/refreshInterval>';
    final command =
        'echo $_passwordOrKey | sudo -S sed -i "s/$search/$replace/" ~/earth/kml/slave/myplaces.kml';

    final clear =
        'echo $_passwordOrKey | sudo -S sed -i "s/$replace/$search/" ~/earth/kml/slave/myplaces.kml';
    try {
      connectToLG();
      for (var i = int.parse(_numberOfRigs); i >= 1; i--) {
        final clearCmd = clear.replaceAll('{{slave}}', i.toString());
        final cmd = command.replaceAll('{{slave}}', i.toString());
        String query = 'sshpass -p $_passwordOrKey ssh -t lg$i \'{{cmd}}\'';
        await _client!.execute(query.replaceAll('{{cmd}}', clearCmd));
        await _client!.execute(query.replaceAll('{{cmd}}', cmd));
      }
      rebootLG();
    } catch (e) {
      print(e);
    }
  }

  searchPlace(String placeName) async {
    try {
      connectToLG();
      final execResult =
          await _client?.execute('echo "search=$placeName" >/tmp/query.txt');
      return execResult;
    } catch (e) {
      print('An error occurred while executing the command: $e');
      return null;
    }
  }

  Future cleanBalloon() async {
    String blank = '''
<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">
  <Document>
  </Document>
</kml>''';
    int rigs = (3 / 2).floor() + 1;
    int leftRig = (3 / 2).floor() + 2;
    try {
      connectToLG();
      await _client!
          .execute("echo '$blank' > /var/www/html/kml/slave_$rigs.kml");
       await ssh
          .executeCommand("echo '$blank' > /var/www/html/kml/slave_$leftRig.kml");
       await ssh
          .executeCommand("echo '$blank' > /var/www/html/kml/master_1.kml");

    } catch (e) {
      return Future.error(e);
    }
  }

  startOrbit() async {
    try {
      connectToLG();
      return await _client!.execute('echo "playtour=Orbit" > /tmp/query.txt');
    } catch (e) {
      print('Could not connect to host LG');
      return Future.error(e);
    }
  }

  playOrbit(String filename) async {
    try {
      connectToLG();
      print("playing orbit");
      print(filename);
      print('echo "playtour=$filename" > /tmp/query.txt');
      return await _client!
          .execute('echo "playtour=$filename" > /tmp/query.txt');
    } catch (e) {
      print('Could not connect to host LG');
      return Future.error(e);
    }
  }

  stopOrbit() async {
    try {
      connectToLG();
      return await _client!.execute('echo "exittour=true" > /tmp/query.txt');
    } catch (e) {
      print('Could not connect to host LG');
      return Future.error(e);
    }
  }

  cleanOrbit() async {
    try {
      connectToLG();
      return await _client!.execute('echo "" > /tmp/query.txt');
    } catch (e) {
      print('Could not connect to host LG');
      return Future.error(e);
    }
  }

  logosLG(String imageUrl, double factor) async {
    String numberOfRigs = ssh.rigs.value.toString();
    int leftRig = (int.parse(numberOfRigs) / 2).floor() + 2;
    String kml = '''<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">
    <Document id ="logo">
         <name>Lg logo</name>
             <Folder>
                  <name>logo</name>
                  <ScreenOverlay>
                      <name>Logo</name>
                      <Icon><href>$imageUrl</href> </Icon>
                      <overlayXY x="0" y="1" xunits="fraction" yunits="fraction"/>
                      <screenXY x="0.025" y="0.95" xunits="fraction" yunits="fraction"/>
                      <rotationXY x="0" y="0" xunits="fraction" yunits="fraction"/>
                      <size x="${1111*factor}" y="${822 * factor}" xunits="pixels" yunits="pixels"/>
                  </ScreenOverlay>
             </Folder>
    </Document>
</kml>''';
    try {
      return await ssh
          .executeCommand("echo '$kml' > /var/www/html/kml/slave_$leftRig.kml");
    } catch (e) {
      return Future.error(e);
    }
  }


  cleanlogos() async {
    String numberOfRigs = ssh.rigs.value.toString();
    int leftRig = (int.parse(numberOfRigs) / 2).floor() + 2;
    String blank = '''<?xml version="1.0" encoding="UTF-8"?>
      <kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">
        <Document>
        </Document>
      </kml>''';
    try {
      return await ssh.executeCommand(
          "echo '$blank' > /var/www/html/kml/slave_$leftRig.kml");
    } catch (e) {
      return Future.error(e);
    }
  }



}
