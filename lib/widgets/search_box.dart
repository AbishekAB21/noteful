import 'package:flutter/material.dart';
import 'package:noteful/utils/fontstyles.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        margin: EdgeInsets.symmetric(horizontal: 40),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(10)),
        child: TextField(
          decoration: InputDecoration(
            hintText: "Search your notes",
            hintStyle: Fontstyles.FadedTextStyle(context),
            icon: Icon(Icons.search),
            iconColor: Theme.of(context).colorScheme.inversePrimary,
            disabledBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            isDense: true,
            constraints: BoxConstraints(maxHeight: 50, maxWidth: 50)
          ),
        ));
  }
}
