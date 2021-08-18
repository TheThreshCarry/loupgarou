import 'package:flutter/material.dart';
import 'package:loupgarou/constants.dart';

import '../GameController.dart';
import 'Role.dart';

class Game extends StatefulWidget {
  Game({Key? key}) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    if (GameController.allCount == 0) {
      //Navigator.pop(context);
    }
    return SafeArea(
        child: WillPopScope(
      onWillPop: () {
        print("Hello Im Back");

        return Future.delayed(Duration(microseconds: 10), () {
          setState(() {
            GameController.resetGame();
          });

          return true;
        });
      },
      child: GestureDetector(
        onPanEnd: (details) {
          if (GameController.allCount == 1) {
            Navigator.pop(context);
          }
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RolePage(
                        role: GameController.getRandomRole(),
                      )));
        },
        onDoubleTap: () {
          if (GameController.allCount == 1) {
            Navigator.pop(context);
          }
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RolePage(
                        role: GameController.getRoleRole(),
                      )));
        },
        child: Scaffold(
          backgroundColor: Constants.bgColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Swipe To Reveal Role !",
                style: TextStyle(color: Constants.textColor, fontSize: 40.0),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    ));
  }
}
