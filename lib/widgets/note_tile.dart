import 'package:flutter/material.dart';
import 'package:noteful/utils/fontstyles.dart';
import 'package:noteful/widgets/display_dialog.dart';
import 'package:noteful/widgets/popup_menu.dart';
import 'package:popover/popover.dart';

class NoteTile extends StatelessWidget {
  final String text;
  final void Function()? onEditPressed;
  final void Function()? onDeletePressed;
  const NoteTile(
      {super.key,
      required this.text,
      this.onEditPressed,
      this.onDeletePressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return ShowNotesScreen(text: text);
          },
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 10, left: 25, right: 25),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(8)),
        child: ListTile(
          title: Text(
            text,
            style: Fontstyles.notesText(context),
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Builder(builder: (context) {
           return IconButton(
              onPressed: () => showPopover(
                    context: context,
                    height: 130,
                    width: 130,
                    backgroundColor: Theme.of(context).colorScheme.background,
                    bodyBuilder: (context) => PopUpMenu(onDeletePressed: onDeletePressed, onEditPressed: onEditPressed,),
                  ),
              icon: Icon(
                Icons.more_vert_rounded,
                color: Theme.of(context).colorScheme.inversePrimary,
              ));
          },)
        ),
      ),
    );
  }
}
