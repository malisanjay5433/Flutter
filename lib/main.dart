import 'package:flutter/material.dart';
import 'package:flutter1/core/store.dart';
import 'package:flutter1/pages/cart_page.dart';
import 'package:flutter1/pages/home_page.dart';
import 'package:flutter1/pages/login_page.dart';
import 'package:flutter1/untils/routes.dart';
import 'package:flutter1/widgets/theam.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(store: MyStore(), child: MyApp()));
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
