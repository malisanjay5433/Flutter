import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheam {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          textTheme: Theme.of(context).textTheme,
        ),
      );

  static ThemeData darkTheme(BuildContext context) =>
      ThemeData(brightness: Brightness.dark);
  static Color offWhite = Color(0xfff5f5f5);
  static Color darkBluishcolor = Color(0xff403b58);
  static Color deepPurple = Colors.deepPurple;

}
