import 'package:flutter/material.dart';

abstract class FontInterface {
  TextStyle fontHead1(
    BuildContext context, {
    double? fontSize, // = 32,
    bool bold = false,
    Color? color,
    TextOverflow? textOverflow,
    TextDecoration? textDecoration,
  });

  TextStyle fontHead2(
    BuildContext context, {
    double? fontSize, // = 28,
    bool bold = false,
    Color? color,
    TextOverflow? textOverflow,
    TextDecoration? textDecoration,
  });

  TextStyle fontHead3(
    BuildContext context, {
    double? fontSize, // = 18,
    bool bold = false,
    Color? color,
    TextOverflow? textOverflow,
    TextDecoration? textDecoration,
  });

  TextStyle fontHead4(
    BuildContext context, {
    double? fontSize, // = 17,
    bool bold = false,
    Color? color,
    TextOverflow? textOverflow,
    TextDecoration? textDecoration,
  });

  TextStyle fontHead5(
    BuildContext context, {
    double? fontSize, // = 16,
    bool bold = false,
    Color? color,
    TextOverflow? textOverflow,
    TextDecoration? textDecoration,
  });

  TextStyle fontBody1(
    BuildContext context, {
    double? fontSize, // = 16,
    bool bold = false,
    Color? color,
    TextOverflow? textOverflow,
    TextDecoration? textDecoration,
  });

  TextStyle fontBody2(
    BuildContext context, {
    double? fontSize, // = 14,
    bool bold = false,
    Color color,
    TextOverflow? textOverflow,
    TextDecoration? textDecoration,
  });

  TextStyle fontBodyLink(
    BuildContext context, {
    double? fontSize, // = 16,
    bool bold = false,
    Color color,
    TextOverflow? textOverflow,
    TextDecoration? textDecoration,
  });

  TextStyle fontCaption(
    BuildContext context, {
    double? fontSize, // = 12,
    bool bold = false,
    Color? color,
    TextOverflow? textOverflow,
    TextDecoration? textDecoration,
  });

  TextStyle fontButton(
    BuildContext context, {
    double? fontSize, //= 16,
    bool bold = false,
    Color? color,
    TextOverflow? textOverflow,
    TextDecoration? textDecoration,
  });
}
