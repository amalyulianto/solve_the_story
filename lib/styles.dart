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

TextStyle fancyText = GoogleFonts.cinzel(); // More detective-like/classic font

// Mysterious Lounge Palette
Color primaryDark = const Color(0xff1A1A1A); // Deep Charcoal
Color primaryLight = const Color(0xffF5F5DC); // Cream
Color accentGold = const Color(0xffD4AF37); // Gold
Color accentOrange = const Color(0xffCC5500); // Burnt Orange
Color espresso = const Color(0xff3D2B1F); // Dark Espresso
Color charcoal = const Color(0xff2F2F2F); // Medium Charcoal

// Transitional Colors (maintaining for gradient compatibility)
Color blue1 = const Color(0xff1A3A5A);
Color purple1 = const Color(0xff3A1A5A);
Color red1 = const Color(0xff5A1A1A);

LinearGradient mysteriousGradient = LinearGradient(
  colors: [primaryDark, charcoal],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

LinearGradient midnightTealGradient = LinearGradient(
  colors: [const Color(0xff004D40), primaryDark],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

LinearGradient terracottaGradient = LinearGradient(
  colors: [accentOrange, const Color(0xff8B4513)],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

LinearGradient crimsonGradient = LinearGradient(
  colors: [red1, espresso],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight black = FontWeight.w900;
