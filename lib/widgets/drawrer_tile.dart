import 'package:flutter/material.dart';
import 'package:noteful/utils/fontstyles.dart';

class DrawrerTile extends StatelessWidget {
  final String title;
  final Widget leading;
  final void Function()? ontap;
  const DrawrerTile(
      {super.key, required this.title, required this.leading, this.ontap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: Fontstyles.RegularTextStyle(context),),
      leading: leading,
      onTap: ontap,
    );
  }
}
