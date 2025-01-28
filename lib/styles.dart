import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle textBold =
    GoogleFonts.plusJakartaSans(color: Colors.white, fontWeight: bold);
TextStyle textMain = GoogleFonts.plusJakartaSans(fontWeight: regular);
TextStyle textTitle =
    GoogleFonts.plusJakartaSans(fontWeight: bold, fontSize: 28);
TextStyle textSubtitle =
    GoogleFonts.plusJakartaSans(fontWeight: regular, fontSize: 18);

TextStyle onlyText = GoogleFonts.plusJakartaSans();

TextStyle fancyText = GoogleFonts.plusJakartaSans();

Color blue1 = const Color(0xff0083e3);
Color blue2 = const Color(0xff23A2FF);
Color purple1 = const Color(0xff7203FF);
Color purple2 = const Color(0xff882AFF);
Color red1 = const Color(0xffF4043E);
Color red2 = const Color(0xffF57383);
Color red3 = const Color(0xffFF5267);
Color red4 = const Color(0xff8E0224);
Color pink = const Color(0xffFF527C);
Color green1 = const Color(0xff2CF27B);
Color black1 = Colors.black;
Color black2 = const Color(0xff444444);
Color black3 = const Color(0xff3c3c3c);
Color white1 = Colors.white;

Color cardBlue = const Color(0xff0083e3);
Color cardLeaf = const Color(0xff5F9F98);
Color cardPink = const Color(0xffFF527C);
Color cardDarkBlue = const Color(0xff013255);
Color cardGreen = const Color(0xff00BFA8);
Color cardNavy = const Color(0xff0A82A8);

LinearGradient blueGradient = LinearGradient(colors: [blue1, blue2]);
LinearGradient purpleGradient = LinearGradient(colors: [purple1, purple2]);
LinearGradient redGradient = LinearGradient(colors: [red1, red2]);
LinearGradient blackGradient = LinearGradient(colors: [black1, black2]);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight black = FontWeight.w900;
