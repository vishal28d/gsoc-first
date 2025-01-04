import 'package:flutter/material.dart';

class customElevatedButton extends StatelessWidget {
  String text;
  dynamic onPress;

 customElevatedButton( this.text, this.onPress, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 50,
      margin: const EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: () {
          () =>  onPress();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF62825D),
          animationDuration: const Duration(seconds: 1),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
