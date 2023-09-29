import 'dart:ui';

const String kDarkPurpleHexCode = "#121421";
const String kDarkPurpleLighterHexCode = "#262B3F";
const String kPurpleHexCode = "#8800FF";
const String kPinkAccent30OpacityHexCode = "#801C41";
const String kPinkAccentHexCode = "#FF0066";
const String kPurpleAccentHexCode = "#FF00FF";
const String kTurquoiseHexCode = "#00FFCB";
const String kOrangeHexCode = "#FF7700";
const String kGreyHexCode = "#CBCBCB";
const String lightGreyHexCode = "#54596C";

//usage: ColorExtension.fromHex(purpleHexCode);

extension ColorExtension on Color {
  static Color fromHex(String hexCode) {
    hexCode = hexCode.replaceAll("#", "");
    if (hexCode.length == 6) {
      hexCode = "ff$hexCode"; //8 character long -> ff = opacity %100
    }

    return Color(int.parse(hexCode, radix: 16));
  }
}
