import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mytheme {
  static ThemeData lighttheme(BuildContext context) => ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.lato().fontFamily,
        
        cardColor: Color.fromARGB(255, 250, 225, 227),
        canvasColor: Colors.white,
        primaryColor: Color.fromARGB(255, 65, 65, 52),
      secondaryHeaderColor : Colors.black,
        buttonTheme:
            ButtonThemeData(buttonColor: Color.fromARGB(255, 221, 48, 29)),
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      );

  static ThemeData darktheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.lato().fontFamily,
      cardColor: Colors.black,
      canvasColor: Colors.blueGrey[900],
      primaryColor: Colors.blue,
      appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.black,
          iconTheme: IconThemeData(color: Colors.white)));
}
