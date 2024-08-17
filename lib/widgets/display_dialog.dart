import 'package:flutter/material.dart';
import 'package:noteful/utils/fontstyles.dart';

class ShowNotesScreen extends StatelessWidget {
  final String text;
  const ShowNotesScreen({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
              scrollable: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: Theme.of(context).colorScheme.background,
              icon: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: (){},
                    child: Icon(Icons.download,
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                    SizedBox(width: 16,),
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  )
                ],
              ),
              content: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: Fontstyles.notesText(context),
                    ),
                  ],
                ),
              ),
            );;
  }
}