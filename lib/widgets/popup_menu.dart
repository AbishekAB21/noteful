import 'package:flutter/material.dart';
import 'package:noteful/utils/fontstyles.dart';

class PopUpMenu extends StatelessWidget {
  final void Function()? onEditPressed;
  final void Function()? onDeletePressed;
  const PopUpMenu(
      {super.key, required this.onEditPressed, required this.onDeletePressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: (){
            Navigator.pop(context);
            onEditPressed!();
          },
          child: Container(
            child: Text(
              "Edit",
              style: Fontstyles.buttontext(context),
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.pop(context);
            onDeletePressed!();
          },
          child: Container(
            child: Text(
              "Delete",
              style: Fontstyles.buttontext(context),
            ),
          ),
        ),
      ],
    );
  }

  void close_pop_up(BuildContext context) {
    Navigator.pop(context);
  }
}
