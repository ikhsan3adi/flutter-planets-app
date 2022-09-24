import 'package:flutter/material.dart';

Widget myHeading1Text({
  required String text,
  required TextAlign textAlign,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16),
    child: Text(
      text,
      textAlign: textAlign,
      style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    ),
  );
}

Widget myHeading2Text({
  required String text,
  required TextAlign textAlign,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16),
    child: Text(
      text,
      textAlign: textAlign,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
  );
}

Widget myBoldText({
  required String text,
  required TextAlign textAlign,
  bool withBackground = false,
}) {
  return Text(
    text,
    textAlign: textAlign,
    style: TextStyle(fontWeight: FontWeight.bold, backgroundColor: withBackground ? Colors.black38 : null),
  );
}

Widget myCardDetailText({
  required String text,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16),
    child: Text(
      text,
    ),
  );
}
