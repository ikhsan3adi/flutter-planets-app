import 'package:flutter/material.dart';

Widget mxBuildMenuItem({required IconData icon, required String titleText, String? subtitle, VoidCallback? onClicked, Widget? trailing}) {
  // const iconColor = Colors.blueAccent;
  // final textColor = Colors.blue[800];

  return ListTile(
    leading: Icon(icon),
    title: Text(titleText),
    subtitle: subtitle != null
        ? Text(
            subtitle,
            // style: TextStyle(color: textColor),
          )
        : null,
    trailing: trailing,
    // iconColor: iconColor,
    onTap: onClicked,
  );
}
