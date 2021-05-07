import 'package:flutter/material.dart';
import 'package:flutter1/untils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changedButton = false;
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
                "Welcome $name",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Column(children: [
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Enter UserName", labelText: "UserName"),
                  onChanged: (value) {
                    name = value;
                    setState(() {});
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Enter Password", labelText: "Password"),
                ),
                SizedBox(
                  height: 40.0,
                ),
                InkWell(
                  onTap: () async {
                    setState(() {
                      changedButton = true;
                    });
                    await Future.delayed(Duration(seconds: 2));
                    Navigator.pushNamed(context, MyRoutes.homeRoute);
                  },
                  child: AnimatedContainer(
                    duration: Duration(seconds: 2),
                    width: changedButton ? 50 : 150,
                    height: 50,
                    alignment: Alignment.center,
                    child: changedButton
                        ? Icon(Icons.done, color: Colors.white)
                        : Text('Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                    decoration: BoxDecoration(
                      shape:
                          changedButton ? BoxShape.circle : BoxShape.rectangle,
                      color: Colors.deepPurple,
                      // borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
