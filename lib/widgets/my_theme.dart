import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_marvel/utilities/all_colors.dart';
import 'package:flutter_app_marvel/utilities/all_texts.dart';


class MyTheme {
  static final myTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: AllColors.primaryColor),
      centerTitle: true,
      elevation: 0,
      color: Colors.black,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      titleTextStyle: TextStyle(
        fontFamily: AllTexts.boldFont,
        color: AllColors.primaryColor,
        fontSize: 35,
      ),
    ),
    textTheme: const TextTheme(
      displaySmall: TextStyle(
        fontFamily: AllTexts.regularFont,
        fontSize: 12,
        color: Colors.white,
      ),
      displayLarge: TextStyle(
        fontFamily: AllTexts.boldFont,
        fontSize: 45,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontFamily: AllTexts.boldFont,
        fontSize: 45,
        color: AllColors.primaryColor,
      ),
      bodyMedium: TextStyle(
        fontFamily: AllTexts.regularFont,
        fontSize: 30,
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontFamily: AllTexts.regularFont,
        fontSize: 15,
        color: Colors.white,
      ),
      titleSmall: TextStyle(
        fontFamily: AllTexts.regularFont,
        fontSize: 15,
        color: AllColors.primaryColor,
      ),
      titleMedium: TextStyle(
        fontFamily: AllTexts.boldFont,
        fontSize: 25,
        color: AllColors.primaryColor,
      ),
    ),
    expansionTileTheme: const ExpansionTileThemeData(
      iconColor: AllColors.primaryColor,
      collapsedIconColor: Colors.white,
      collapsedShape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.white,
        ),
      ),
      textColor: AllColors.primaryColor,
      collapsedTextColor: Colors.white,
      expandedAlignment: Alignment.centerLeft,
      childrenPadding: EdgeInsets.only(bottom: 15, left: 15, right: 15),
    ),
  );
}
