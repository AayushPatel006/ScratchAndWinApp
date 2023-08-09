import 'dart:math';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // TODO import image
  AssetImage circle = AssetImage('images/cirlce.png')
  AssetImage lucky = AssetImage('images/rupee.png')
  AssetImage unlucky = AssetImage('images/sadFace.png')

  // TODO get an array
  List<String> itemArray = List<String>.generate(25, (index) => "empty");
  int? luckyNumber;

  // TODO init arrray with 23 elements
  @override
  void initState() {
    super.initState();
    itemArray = List<String>.generate(25, (index) => "empty");
    genetateRandomNumber();
  }
  genetateRandomNumber() {
    setState(() {
      luckyNumber = Random().nextInt(25);
    });
  }
  

  // TODO define getImage method

  // TODO play game method

  // TODO showall

  // TODO reset all
  resetGame() {
    setState(() {
      itemArray = List<String>.filled(25, "empty");
      genetateRandomNumber();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scratch Application"),
      ),
    );
  }
}
