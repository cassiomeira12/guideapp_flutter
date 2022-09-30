import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const brightness = Brightness.light;

const backgroundMenu = Color(0xFFFFFFFF);
const barHeader = Color(0xFFFFFFFF);
const barListStroke = Color(0xFFCCCCCC);

const contentTextActive = Color(0xFF13161C);
const contentTextInactive = Color(0xFF808080);
const contentTextRelevant = Color(0xFF4171B8);

const contentPrimary = Color(0xFF180e37);
const contentSeconday = Color(0xFF64D8FF);
const contentTertiary = Color(0xFFAAAAAA);

const componentPrimaryFill = Color(0xFF64D8FF);
const componentPrimaryStroke = Color(0xFF4171B8);
const componentSecondaryFill = Color(0xFF1E3B5C);
const componentSecondaryStroke = Color(0xFF64D8FF);
const componentTertiaryFill = Color(0xFF4171B8);
const componentTertiaryStroke = Color(0xFFAAAAAA);

const componentInactivePrimaryFill = Color(0xFF808080);
const componentInactivePrimaryStroke = Color(0xFF808080);
const componentInactiveSecondaryFill = Color(0xFFCCCCCC);
const componentInactiveTertiaryFill = Color(0xFFFFFFFF);

const errorColor = Color(0xFFFF5252);

class LightTheme {
  static ThemeData theme() {
    return ThemeData(
      brightness: brightness,
      primaryColor: contentPrimary,
      disabledColor: componentInactiveSecondaryFill,
      errorColor: errorColor,
      scaffoldBackgroundColor: contentPrimary, //backgroundMenu,
      backgroundColor: barHeader,
      iconTheme: const IconThemeData(color: contentTertiary),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: contentPrimary, //barHeader,
        iconTheme: IconThemeData(
          color: contentTertiary,
          size: 24,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: brightness,
        ),
        titleTextStyle: TextStyle(
          fontSize: 16,
          color: contentTextActive,
        ),
      ),
      primaryTextTheme: const TextTheme(
        headline1: TextStyle(
          fontSize: 32,
          color: contentTextActive,
        ),
        headline2: TextStyle(
          fontSize: 28,
          color: contentTextActive,
        ),
        headline3: TextStyle(
          fontSize: 18,
          color: contentTextActive,
        ),
        headline5: TextStyle(
          fontSize: 16,
          color: contentTextActive,
        ),
        bodyText1: TextStyle(
          fontSize: 16,
          color: contentTextActive,
        ),
        bodyText2: TextStyle(
          fontSize: 14,
          color: contentTextActive,
        ),
        caption: TextStyle(
          fontSize: 12,
          color: contentTextActive,
        ),
        button: TextStyle(
          fontSize: 16,
          color: barHeader,
          backgroundColor: contentTextActive,
        ),
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontSize: 32,
          color: contentTextInactive,
          decorationColor: contentTextRelevant,
        ),
        headline2: TextStyle(
          fontSize: 28,
          color: contentTextInactive,
          decorationColor: contentTextRelevant,
        ),
        headline3: TextStyle(
          fontSize: 18,
          color: contentTextInactive,
          decorationColor: contentTextRelevant,
        ),
        headline5: TextStyle(
          fontSize: 16,
          color: contentTextInactive,
          decorationColor: contentTextRelevant,
        ),
        bodyText1: TextStyle(
          fontSize: 16,
          color: contentTextInactive,
          decorationColor: contentTextRelevant,
        ),
        bodyText2: TextStyle(
          fontSize: 14,
          color: contentTextInactive,
          decorationColor: contentTextRelevant,
        ),
        caption: TextStyle(
          fontSize: 12,
          color: contentTextInactive,
          decorationColor: contentTextRelevant,
        ),
        button: TextStyle(
          fontSize: 16,
          color: contentTextInactive,
          decorationColor: contentTextRelevant,
        ),
      ),
      bannerTheme: const MaterialBannerThemeData(
        backgroundColor: componentPrimaryStroke,
      ),
      cardColor: barHeader,
      indicatorColor: componentPrimaryFill,
      dividerColor: componentSecondaryFill,
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all(componentPrimaryFill),
        side: MaterialStateBorderSide.resolveWith(
          (states) => const BorderSide(width: 1, color: componentPrimaryFill),
        ),
        fillColor: MaterialStateProperty.resolveWith((states) {
          return states.contains(MaterialState.selected)
              ? componentTertiaryFill
              : componentPrimaryFill;
        }),
      ),
      cupertinoOverrideTheme: const NoDefaultCupertinoThemeData(
        brightness: brightness,
        primaryColor: componentInactivePrimaryFill,
        primaryContrastingColor: componentInactivePrimaryStroke,
        barBackgroundColor: componentInactiveSecondaryFill,
        scaffoldBackgroundColor: componentInactiveTertiaryFill,
        textTheme: CupertinoTextThemeData(
          dateTimePickerTextStyle: TextStyle(
            fontSize: 18,
            color: contentTextActive,
          ),
        ),
      ),
      hoverColor: componentTertiaryFill,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: barHeader,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: contentPrimary,
        unselectedItemColor: contentTertiary,
        backgroundColor: barHeader,
        selectedLabelStyle: TextStyle(
          fontSize: 12,
          color: contentTextActive,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 12,
          color: contentTertiary,
        ),
      ),
      dialogBackgroundColor: barHeader,
      dialogTheme: const DialogTheme(
        backgroundColor: barHeader,
      ),
      hintColor: contentTextInactive,
      unselectedWidgetColor: componentTertiaryStroke,
    );
  }
}
