import 'package:flutter/material.dart';
import 'package:noteful/methods/note_database_methods.dart';
import 'package:noteful/provider/theme_provider.dart';
import 'package:noteful/screens/splash.dart';
import 'package:provider/provider.dart';

void main() async {
// Initializing Notes Isar Database
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.initialize();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => NoteDatabase(),
      ),
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: SplashScreen(),
    );
  }
}
