import 'package:flutter/material.dart';
import 'package:flutter1/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Catalog App'),
      ),
      body: Center(
        child: Container(
          child: Text('Welcome to 30 days of Flutter'),
        ),
      ),
      drawer:MyDrawer(),
    );
  }
}
