import 'package:flutter/material.dart';
import 'package:flutter1/untils/routes.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/images/login_image.png',
                fit: BoxFit.cover,
                // height: 500,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Welcome to login",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Column(children: [
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Enter UserName", labelText: "UserName"),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Enter Password", labelText: "Password"),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  child: Text("Login"),
                  style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                  onPressed: () {
                    // print("Login Button");
                    Navigator.pushNamed(context, MyRoutes.homeRoute);
                  },
                )
              ])
            ],
          ),
        ),
      ),
    );
  }
}
