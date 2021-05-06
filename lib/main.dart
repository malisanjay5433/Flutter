import 'package:flutter/material.dart';
import 'package:flutter1/pages/home_page.dart';
import 'package:flutter1/pages/login_page.dart';
import 'package:flutter1/untils/routes.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode:ThemeMode.light,
      theme:ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily:GoogleFonts.lato().fontFamily,
        primaryTextTheme: GoogleFonts.latoTextTheme()),
      darkTheme:ThemeData(
        brightness:Brightness.dark,
      ),
      // home:HomePage()
      initialRoute: "/",
      routes:{
          MyRoutes.loginRoute : (context) => LoginPage(),
          MyRoutes.homeRoute:(context) => HomePage(),
      },
    );
  }
}
