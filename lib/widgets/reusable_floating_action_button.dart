import 'package:flutter/material.dart';

class ReusableFloatingActionButton extends StatelessWidget {
  final VoidCallback onpressed;
  final Icon icon;
  ReusableFloatingActionButton(
      {super.key, required this.onpressed, required this.icon});

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
      child: icon
    );
  }
}
