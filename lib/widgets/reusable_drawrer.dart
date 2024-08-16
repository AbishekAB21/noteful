import 'package:flutter/material.dart';
import 'package:noteful/screens/settings.dart';
import 'package:noteful/widgets/drawrer_tile.dart';

class Mydrawrer extends StatelessWidget {
  const Mydrawrer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          DrawerHeader(
              child: Icon(
            Icons.note,
            color: Theme.of(context).colorScheme.inversePrimary,
          )),
          DrawrerTile(
            title: "Notes",
            leading: Icon(Icons.home),
            ontap: () {
              Navigator.pop(context);
             
            },
          ),
          DrawrerTile(
            title: "Settings",
            leading: Icon(Icons.settings),
            ontap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsScreen(),
                  ));
              
            },
          )
        ],
      ),
    );
  }
}
