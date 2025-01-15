import 'package:first/services/lg_service.dart';
import 'package:first/widgets/customAppBar.dart';
import 'package:first/widgets/drawer.dart';
import 'package:flutter/material.dart';

class EarthPage extends StatelessWidget {
  EarthPage({super.key});

  TextEditingController placeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const CustomAppBar('Earth'),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: placeController,
              decoration: InputDecoration(
                hintText: 'Enter a place...',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              textInputAction: TextInputAction.done,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () async {
                // Fly-to logic triggered by button
                final place = placeController.text.trim();
                if (place.isNotEmpty) {
                  await ssh.executeCommand('echo "search=$place" > /tmp/query.txt');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Flying to $place')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter a place')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              child: const Text(
                'Fly To',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
