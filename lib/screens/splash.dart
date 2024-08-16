import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:noteful/screens/notes_screen.dart';
import 'package:noteful/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

@override
  void initState() {
    goHome(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  "noteful",
                  style: Fontstyles.boldTextStyle(),
                ),
                Transform.translate(
                  offset: Offset(0, 38),
                  child: LottieBuilder.asset(
                    "assets/Animation - 1723744927927.json",
                    height: 300,
                    width: 300,
                    repeat: true,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void goHome(BuildContext context) async {
    await Future.delayed(Duration(seconds: 4));

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => NotesScreen(),
        ));
  }
}
