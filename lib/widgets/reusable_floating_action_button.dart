import 'package:flutter/material.dart';

class ReusableFloatingActionButton extends StatelessWidget {
  final VoidCallback onpressed;
  final String imagePath;
  ReusableFloatingActionButton(
      {super.key, required this.onpressed, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      splashColor: Colors.white70,
      enableFeedback: false,
      highlightElevation: 0,
      onPressed: onpressed,
      child: Image.asset(
        imagePath,
        height: 50,
        width: 50,
      ),
    );
  }
}
