import 'package:flutter/material.dart';
import 'package:top_drive_app/constants/colors.dart';

Widget normalText(String text) => Text(text, style: smallBlack);

TextStyle getLargestTS(Color color) {
  return TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold ,
    color: color,
  );
}

TextStyle getLargeTS(Color color) {
  return TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold ,
    color: color,
  );
}

TextStyle getMediumTS(Color color) {
  return TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500 ,
    color: color,
  );
}

TextStyle getMediumBoldTS(Color color) {
  return TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold ,
    color: color,
  );
}

TextStyle getSmallTS(Color color) {
  return TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500 ,
    color: color,
  );
}

TextStyle getSmallBoldTS(Color color) {
  return TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold ,
    color: color,
  );
}

TextStyle getSmallestTS(Color color) {
  return TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500 ,
    color: color,
  );
}

TextStyle getSmallestBoldTS(Color color) {
  return TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold ,
    color: color,
  );
}

TextStyle getPageTitle(Color color) {
  return TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    fontFamily: 'Archivo Black',
    color: color,
  );
}

const TextStyle orangePageTitle = TextStyle(fontSize: 32, fontWeight: FontWeight.bold, fontFamily: 'Inter', color: secondaryColor);

TextStyle blackPageTitle = getPageTitle(blackColor);
TextStyle whitePageTitle = getPageTitle(whiteColor);

TextStyle largestBlack = getLargestTS(blackColor);
TextStyle largestWhite = getLargestTS(whiteColor);
TextStyle largestYellow = getLargestTS(primaryColor);
TextStyle largestOrange = getLargestTS(secondaryColor);

TextStyle largeBlack = getLargeTS(blackColor);
TextStyle largeWhite = getLargeTS(whiteColor);

TextStyle mediumBlack = getMediumTS(blackColor);
TextStyle mediumWhite = getMediumTS(whiteColor);

TextStyle mediumBlackBold= getMediumBoldTS(blackColor);
TextStyle mediumWhiteBold= getMediumBoldTS(whiteColor);

TextStyle smallBlack = getSmallTS(blackColor);
TextStyle smallWhite = getSmallTS(whiteColor);

TextStyle smallBlackBold = getSmallBoldTS(blackColor);
TextStyle smallWhiteBold = getSmallBoldTS(whiteColor);

TextStyle smallestBlack = getSmallTS(blackColor);
TextStyle smallestWhite = getSmallTS(whiteColor);

const TextStyle smallHint = TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: blackColorLight);
const TextStyle linkText = TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: secondaryColor, decoration: TextDecoration.underline);

ButtonStyle getButtonStyle(Color backgroundColor, Color foregroundColor, TextStyle textStyle) {
  return ButtonStyle(
    backgroundColor: WidgetStateProperty.all<Color>(backgroundColor),
    foregroundColor: WidgetStateProperty.all<Color>(foregroundColor),
    textStyle: WidgetStateProperty.all<TextStyle>(textStyle),
    shape: WidgetStateProperty.all<OutlinedBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}

ButtonStyle blackButton = getButtonStyle(blackColor, whiteColor, smallWhite);
ButtonStyle greyButton = getButtonStyle(blackColorLight, whiteColor, smallWhite);
ButtonStyle orangeButton = getButtonStyle(secondaryColor, whiteColor, smallWhite);