import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectText extends StatelessWidget {
  const ProjectText({
    super.key,
    required this.fontSize,
    required this.text,
    required this.style,
    this.color,
    this.fontWeight,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  final double fontSize;
  final String text;
  final Color? color;
  final TextStyle style;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.justify,
      style: style.copyWith(
        fontSize: fontSize,
        color: color ?? Colors.white,
        fontWeight: fontWeight,
      ),
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

class PlayFairDisplayText extends ProjectText {
  PlayFairDisplayText({
    super.key,
    required super.fontSize,
    required super.text,
    super.fontWeight,
    super.color,
    super.textAlign,
    super.maxLines,
  }) : super(
          style: GoogleFonts.playfairDisplay(),
          overflow: TextOverflow.ellipsis,
        );
}

class RobotoText extends ProjectText {
  RobotoText({
    super.key,
    required super.fontSize,
    required super.text,
    super.fontWeight,
    super.color,
    super.textAlign,
    super.maxLines,
  }) : super(
          style: GoogleFonts.roboto(),
          overflow: TextOverflow.ellipsis,
        );
}

class RobotoBoldText extends ProjectText {
  RobotoBoldText({
    super.key,
    required super.fontSize,
    required super.text,
    super.color,
    super.textAlign,
    super.maxLines,
  }) : super(
          style: GoogleFonts.roboto(),
          overflow: TextOverflow.ellipsis,
          fontWeight: FontWeight.bold,
        );
}

class OpenSansText extends ProjectText {
  OpenSansText({
    super.key,
    required super.fontSize,
    required super.text,
    super.fontWeight,
    super.color,
    super.textAlign,
    super.maxLines,
  }) : super(
          style: GoogleFonts.openSans(),
        );
}
