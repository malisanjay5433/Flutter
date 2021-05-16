import 'package:flutter/material.dart';
import 'package:flutter1/pages/cart_page.dart';
import 'package:flutter1/pages/home_page.dart';
import 'package:flutter1/pages/login_page.dart';
import 'package:flutter1/untils/routes.dart';
import 'package:flutter1/widgets/theam.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyTheam.lightTheme(context),
      darkTheme: MyTheam.darkTheme(context),
      // home:HomePage()
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeRoute,
      routes: {
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
