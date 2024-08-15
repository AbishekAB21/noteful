import 'package:flutter/material.dart';
import 'package:noteful/models/note_database.dart';
import 'package:noteful/screens/splash.dart';
import 'package:provider/provider.dart';

void main() async {

// Initializing Notes Isar Database
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.initialize();

  runApp(ChangeNotifierProvider(
    create: (context) => NoteDatabase(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
