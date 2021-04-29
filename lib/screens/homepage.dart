import 'package:flutter/material.dart';
import 'package:healthbit/screens/side_drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff02235b),
        centerTitle: true,
        title: Text(
          "HealthBit",
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawerEnableOpenDragGesture: true,
      drawer: SideDrawer(
        userName: "username",
      ),
      body: Container(),
    );
  }
}
