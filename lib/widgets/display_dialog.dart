import 'dart:io';
import 'package:flutter/material.dart';
import 'package:noteful/utils/fontstyles.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

class ShowNotesScreen extends StatelessWidget {
  final String text;
  const ShowNotesScreen({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Theme.of(context).colorScheme.background,
      icon: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () async{

              await downloadNote(text, context);
              Navigator.pop(context);
            },
            child: Icon(Icons.download,
                color: Theme.of(context).colorScheme.inversePrimary),
          ),
          SizedBox(
            width: 16,
          ),
          GestureDetector(
            onTap: () {
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
    );
  }

  Future<void> downloadNote(String text, BuildContext context) async {
    final pdf = pw.Document();

    pdf.addPage(pw.Page(
      build: (pw.Context context) {
        return pw.Text(text, style: pw.TextStyle(fontSize: 18));
      },
    ));

    try {
      // Get Directory for storing the pdf

      final outputDir = await getExternalStorageDirectory();
      final outputFile = File("${outputDir!.path}/note.pdf");

      // Save the PDF

      await outputFile.writeAsBytes(await pdf.save());

      print("Note saved as PDF in ${outputFile.path}");

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "Note saved as PDF in ${outputFile.path}",
          style: Fontstyles.RegularTextStyle(context),
        ),
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        duration: Duration(seconds: 3),
        showCloseIcon: true,
        closeIconColor: Theme.of(context).colorScheme.inversePrimary,
        
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "Failed to save PDF",
          style: Fontstyles.RegularTextStyle(context),
        ),
        backgroundColor: Theme.of(context).colorScheme.error,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        duration: Duration(seconds: 3),
        showCloseIcon: true,
        closeIconColor: Theme.of(context).colorScheme.inversePrimary,
      ));
    }
  }
}
