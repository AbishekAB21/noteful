import 'package:flutter/material.dart';
import 'package:noteful/utils/fontstyles.dart';
import 'package:noteful/widgets/display_dialog.dart';

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
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  onPressed: onEditPressed,
                  icon: Icon(
                    Icons.edit,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  )),
              IconButton(
                  onPressed: onDeletePressed,
                  icon: Icon(
                    Icons.delete,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
