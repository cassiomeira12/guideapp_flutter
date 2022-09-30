import 'package:flutter/material.dart';

import 'local_font_style.dart';

final style = LocalFontStyle();

TextStyle fontTitle(
  BuildContext context, {
  double? fontSize, // = 32,
  bool bold = false,
  Color? color,
  TextOverflow? textOverflow,
}) {
  return TextStyle(
    fontFamily: 'Roboto',
    letterSpacing: 2,
    fontSize: fontSize ?? 32,
    fontWeight: bold ? FontWeight.bold : FontWeight.normal,
    overflow: textOverflow,
    foreground: Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = color ?? Theme.of(context).primaryTextTheme.headline1!.color!,
  );
}

TextStyle fontHead1(
  BuildContext context, {
  double? fontSize, //= 32,
  bool bold = false,
  Color? color,
  TextOverflow? textOverflow,
  TextDecoration? textDecoration,
}) {
  return style.fontHead1(
    context,
    fontSize: fontSize,
    color: color,
    bold: bold,
    textOverflow: textOverflow,
    textDecoration: textDecoration,
  );
}

TextStyle fontHead2(
  BuildContext context, {
  double? fontSize, // = 28,
  bool bold = false,
  Color? color,
  TextOverflow? textOverflow,
  TextDecoration? textDecoration,
}) {
  return style.fontHead2(
    context,
    fontSize: fontSize,
    color: color,
    bold: bold,
    textOverflow: textOverflow,
    textDecoration: textDecoration,
  );
}

TextStyle fontHead3(
  BuildContext context, {
  double? fontSize, // = 18,
  bool bold = false,
  Color? color,
  TextOverflow? textOverflow,
  TextDecoration? textDecoration,
}) {
  return style.fontHead3(
    context,
    fontSize: fontSize,
    color: color,
    bold: bold,
    textOverflow: textOverflow,
    textDecoration: textDecoration,
  );
}

TextStyle fontHead4(
  BuildContext context, {
  double? fontSize, // = 18,
  bool bold = false,
  Color? color,
  TextOverflow? textOverflow,
  TextDecoration? textDecoration,
}) {
  return style.fontHead4(
    context,
    fontSize: fontSize,
    color: color,
    bold: bold,
    textOverflow: textOverflow,
    textDecoration: textDecoration,
  );
}

TextStyle fontHead5(
  BuildContext context, {
  double? fontSize, // = 16,
  bool bold = false,
  Color? color,
  TextOverflow? textOverflow,
  TextDecoration? textDecoration,
}) {
  return style.fontHead5(
    context,
    fontSize: fontSize,
    color: color,
    bold: bold,
    textOverflow: textOverflow,
    textDecoration: textDecoration,
  );
}

TextStyle fontBody1(
  BuildContext context, {
  double? fontSize, // = 16,
  bool bold = false,
  Color? color,
  TextOverflow? textOverflow,
  TextDecoration? textDecoration,
}) {
  return style.fontBody1(
    context,
    fontSize: fontSize,
    color: color,
    bold: bold,
    textOverflow: textOverflow,
    textDecoration: textDecoration,
  );
}

TextStyle fontBody2(
  BuildContext context, {
  double? fontSize, // = 14,
  bool bold = false,
  Color? color,
  TextOverflow? textOverflow,
  TextDecoration? textDecoration,
}) {
  return style.fontBody2(
    context,
    fontSize: fontSize,
    color: color,
    bold: bold,
    textOverflow: textOverflow,
    textDecoration: textDecoration,
  );
}

TextStyle fontBodyLink(
  BuildContext context, {
  double? fontSize, // = 16,
  bool bold = false,
  Color? color,
  TextOverflow? textOverflow,
  TextDecoration? textDecoration,
}) {
  return style.fontBody2(
    context,
    fontSize: fontSize,
    color: color,
    bold: bold,
    textOverflow: textOverflow,
    textDecoration: textDecoration,
  );
}

TextStyle fontCaption(
  BuildContext context, {
  double? fontSize, // = 12,
  bool bold = false,
  Color? color,
  TextOverflow? textOverflow,
  TextDecoration? textDecoration,
}) {
  return style.fontCaption(
    context,
    fontSize: fontSize,
    color: color,
    bold: bold,
    textOverflow: textOverflow,
    textDecoration: textDecoration,
  );
}

TextStyle fontButton(
  BuildContext context, {
  double? fontSize, //= 16,
  bool bold = false,
  Color? color,
  TextOverflow? textOverflow,
  TextDecoration? textDecoration,
}) {
  return style.fontButton(
    context,
    fontSize: fontSize,
    color: color,
    bold: bold,
    textOverflow: textOverflow,
    textDecoration: textDecoration,
  );
}
