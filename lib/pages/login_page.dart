import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        child: Column(
          children: [
            Image.asset(
              'assets/images/login_image.png',
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Welcome to login Page",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Column(children: [
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Enter UserName", labelText: "UserName"),
              ),
              TextFormField(
                obscureText:true,
                decoration: InputDecoration(
                    hintText: "Enter Password", labelText: "Password"),
              ),
              SizedBox(height:20),
             ElevatedButton(
               child: Text("Login"),
                style:TextButton.styleFrom(),
               onPressed:(){
                 print("Login Button");
               },
             )
            ]
            )
          ],
        ),
      ),
    );
  }
}
