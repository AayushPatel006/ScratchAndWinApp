import 'dart:math';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // TODO import image
  AssetImage circle = AssetImage('images/circle.png');
  AssetImage lucky = AssetImage('images/rupee.png');
  AssetImage unlucky = AssetImage('images/sadFace.png');

  // TODO get an array
  List<String> itemArray = List<String>.generate(25, (index) => "empty");
  int luckyNumber = 0;
  int counter = 0;

  // TODO init arrray with 23 elements
  @override
  void initState() {
    super.initState();
    itemArray = List<String>.generate(25, (index) => "empty");
    genetateRandomNumber();
    print(luckyNumber);
  }

  genetateRandomNumber() {
    setState(() {
      luckyNumber = Random().nextInt(25);
    });
  }

  // TODO define getImage method
  AssetImage getImage(int index) {
    String currentState = this.itemArray[index];
    switch (currentState) {
      case 'lucky':
        return lucky;
      case 'unlucky':
        return unlucky;
      default:
        return circle;
        break;
    }
    return circle;
  }

  // TODO play game method
  playGame(int index) {
    if (luckyNumber == index) {
      setState(() {
        itemArray[index] = 'lucky';
        showAll();
        Future.delayed(Duration(seconds: 2), () {
          resetGame();
        });
      });
    } else {
      setState(() {
        itemArray[index] = 'unlucky';
      });
    }
    counter += 1;
    if (counter > 4) {
      showAll();
      Future.delayed(Duration(seconds: 2), () {
        resetGame();
      });
    }
  }

  // TODO showall
  showAll() {
    setState(() {
      itemArray = List<String>.filled(25, "unlucky");
      itemArray[luckyNumber] = "lucky";
    });
  }

  // TODO reset all
  resetGame() {
    setState(() {
      itemArray = List<String>.filled(25, "empty");
      genetateRandomNumber();
      counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scratch and win"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              child: GridView.builder(
            padding: EdgeInsets.all(20.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0),
            itemCount: itemArray.length,
            itemBuilder: (context, index) => SizedBox(
                width: 50.0,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () => this.playGame(index),
                  child: Image(image: this.getImage(index)),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white, // Background color
                  ),
                )),
          )),
          Container(
            margin: EdgeInsets.all(15.0),
            child: ElevatedButton(
              child: Text("Show All"),
              onPressed: showAll,
            ),
          ),
          Container(
              margin: EdgeInsets.all(15.0),
              child: ElevatedButton(
                child: Text("Rest Game"),
                onPressed: resetGame,
              )),
          Container(
            child: Text("Game by Aayush Patel"),
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(10, 10, 10, 30),
          )
        ],
      ),
    );
  }
}
