import 'package:flutter/material.dart';

import 'font_interface.dart';

class LocalFontStyle implements FontInterface {
  @override
  TextStyle fontHead1(
    BuildContext context, {
    double? fontSize, // = 32,
    bool bold = false,
    Color? color,
    TextOverflow? textOverflow,
    TextDecoration? textDecoration,
  }) {
    return TextStyle(
      fontFamily: 'Roboto',
      overflow: textOverflow,
      fontSize: fontSize ?? 32,
      fontStyle: FontStyle.normal,
      fontWeight: bold ? FontWeight.bold : FontWeight.w900,
      color: color ?? Theme.of(context).primaryTextTheme.headline1?.color,
      decoration: textDecoration,
    );
  }

  @override
  TextStyle fontHead2(
    BuildContext context, {
    double? fontSize, // = 28,
    bool bold = false,
    Color? color,
    TextOverflow? textOverflow,
    TextDecoration? textDecoration,
  }) {
    return TextStyle(
      fontFamily: 'Roboto',
      overflow: textOverflow,
      fontSize: fontSize ?? 28,
      fontStyle: FontStyle.normal,
      fontWeight: bold ? FontWeight.bold : FontWeight.w600,
      color: color ?? Theme.of(context).primaryTextTheme.headline2?.color,
      decoration: textDecoration,
    );
  }

  @override
  TextStyle fontHead3(
    BuildContext context, {
    double? fontSize, // = 18,
    bool bold = false,
    Color? color,
    TextOverflow? textOverflow,
    TextDecoration? textDecoration,
  }) {
    return TextStyle(
      fontFamily: 'Roboto',
      overflow: textOverflow,
      fontSize: fontSize ?? 18,
      fontStyle: FontStyle.normal,
      fontWeight: bold ? FontWeight.bold : FontWeight.w600,
      color: color ?? Theme.of(context).primaryTextTheme.headline3?.color,
      decoration: textDecoration,
    );
  }

  @override
  TextStyle fontHead4(
    BuildContext context, {
    double? fontSize, // = 17,
    bool bold = false,
    Color? color,
    TextOverflow? textOverflow,
    TextDecoration? textDecoration,
  }) {
    return TextStyle(
      fontFamily: 'Roboto',
      overflow: textOverflow,
      fontSize: fontSize ?? 17,
      fontStyle: FontStyle.normal,
      fontWeight: bold ? FontWeight.bold : FontWeight.w600,
      color: color ?? Theme.of(context).primaryTextTheme.headline3?.color,
      decoration: textDecoration,
    );
  }

  @override
  TextStyle fontHead5(
    BuildContext context, {
    double? fontSize, // = 16,
    bool bold = false,
    Color? color,
    TextOverflow? textOverflow,
    TextDecoration? textDecoration,
  }) {
    return TextStyle(
      fontFamily: 'Roboto',
      overflow: textOverflow,
      fontSize: fontSize ?? 16,
      fontStyle: FontStyle.normal,
      fontWeight: bold ? FontWeight.bold : FontWeight.w600,
      color: color ?? Theme.of(context).primaryTextTheme.headline5?.color,
      decoration: textDecoration,
    );
  }

  @override
  TextStyle fontBody1(
    BuildContext context, {
    double? fontSize, // = 16,
    bool bold = false,
    Color? color,
    TextOverflow? textOverflow,
    TextDecoration? textDecoration,
  }) {
    return TextStyle(
      height: 1.5,
      fontFamily: 'Roboto',
      overflow: textOverflow,
      fontSize: fontSize ?? 16,
      fontStyle: FontStyle.normal,
      fontWeight: bold ? FontWeight.bold : FontWeight.w400,
      color: color ?? Theme.of(context).primaryTextTheme.bodyText1?.color,
      decoration: textDecoration,
    );
  }

  @override
  TextStyle fontBody2(
    BuildContext context, {
    double? fontSize, // = 14,
    bool bold = false,
    Color? color,
    TextOverflow? textOverflow,
    TextDecoration? textDecoration,
  }) {
    return TextStyle(
      height: 1.5,
      fontFamily: 'Roboto',
      overflow: textOverflow,
      fontSize: fontSize ?? 14,
      fontStyle: FontStyle.normal,
      fontWeight: bold ? FontWeight.bold : FontWeight.w400,
      color: color ?? Theme.of(context).primaryTextTheme.bodyText2?.color,
      decoration: textDecoration,
    );
  }

  @override
  TextStyle fontBodyLink(
    BuildContext context, {
    double? fontSize, // = 16,
    bool bold = false,
    Color? color,
    TextOverflow? textOverflow,
    TextDecoration? textDecoration,
  }) {
    return TextStyle(
      fontFamily: 'Roboto',
      overflow: textOverflow,
      fontSize: fontSize ?? 16,
      fontStyle: FontStyle.normal,
      fontWeight: bold ? FontWeight.bold : FontWeight.w400,
      color: color ?? Theme.of(context).primaryTextTheme.bodyText2?.color,
      decoration: textDecoration,
    );
  }

  @override
  TextStyle fontCaption(
    BuildContext context, {
    double? fontSize, // = 12,
    bool bold = false,
    Color? color,
    TextOverflow? textOverflow,
    TextDecoration? textDecoration,
  }) {
    return TextStyle(
      height: 1.5,
      fontFamily: 'Roboto',
      overflow: textOverflow,
      fontSize: fontSize ?? 12,
      fontStyle: FontStyle.normal,
      fontWeight: bold ? FontWeight.bold : FontWeight.w400,
      color: color ?? Theme.of(context).primaryTextTheme.caption?.color,
      decoration: textDecoration,
    );
  }

  @override
  TextStyle fontButton(
    BuildContext context, {
    double? fontSize, // = 16,
    bool bold = false,
    Color? color,
    TextOverflow? textOverflow,
    TextDecoration? textDecoration,
  }) {
    return TextStyle(
      fontFamily: 'Roboto',
      overflow: textOverflow,
      fontSize: fontSize ?? 16,
      fontStyle: FontStyle.normal,
      fontWeight: bold ? FontWeight.bold : FontWeight.w400,
      color: color ?? Theme.of(context).primaryTextTheme.button?.color,
      decoration: textDecoration,
    );
  }
}
