import 'package:flutter/material.dart';
import 'package:loupgarou/GameController.dart';
import 'package:loupgarou/Views/Game.dart';
import 'package:loupgarou/constants.dart';
import 'package:loupgarou/data/Roles.dart';
import 'package:loupgarou/widgets/roleCard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loup-Garou',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //primarySwatch: Colors.blue,
        fontFamily: "Roboto", // test
        primaryColor: Constants.accentColor1,
        textTheme: TextTheme(
            headline1: TextStyle(
                color: Constants.textColor,
                fontSize: 24.0,
                fontWeight: FontWeight.w800)),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void updateState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Constants.bgColor,
      body: Column(
        children: [
          Container(
            height: size.height * 0.1,
            width: double.infinity,
            color: Constants.bgColor,
            //color: Colors.red,
            child: Center(
              child: Text(
                "Choose Your Roles",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ),
          /*Container(
            height: size.height * 0.15,
            width: double.infinity,
            color: Colors.green,
          ),*/
          Container(
            height: size.height * 0.25,
            width: double.infinity,
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                /*border: Border(
                bottom: BorderSide(color: Constants.accentColor2, width: 1.0),
              ),*/
                color: Constants.bgColor,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withAlpha(50),
                      offset: Offset(0, 10),
                      blurRadius: 5.0,
                      spreadRadius: 5.0)
                ]),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    RoleCard(
                      role: privateRoles[0],
                      isEditable: false,
                      showName: false,
                      height: 80.0,
                      width: 80.0,
                      onTap: () {
                        updateState();
                      },
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "Wolfs : ${GameController.wolfCount}",
                      style: TextStyle(
                          color: Constants.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              //
                              GameController.wolfCount--;
                            });
                          },
                          child: Container(
                            height: 30.0,
                            width: 30.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                border: Border.all(color: Constants.textColor)),
                            child: Center(
                              child: Icon(
                                Icons.remove,
                                color: Constants.textColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              //
                              GameController.wolfCount++;
                            });
                          },
                          child: Container(
                            height: 30.0,
                            width: 30.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                border: Border.all(color: Constants.textColor)),
                            child: Center(
                              child: Icon(
                                Icons.add,
                                color: Constants.textColor,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    RoleCard(
                      role: privateRoles[1],
                      isEditable: false,
                      showName: false,
                      height: 80.0,
                      width: 80.0,
                      onTap: () {
                        updateState();
                      },
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "Villagers : ${GameController.villagersCount}",
                      style: TextStyle(
                          color: Constants.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              //
                              GameController.villagersCount--;
                            });
                          },
                          child: Container(
                            height: 30.0,
                            width: 30.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                border: Border.all(color: Constants.textColor)),
                            child: Center(
                              child: Icon(
                                Icons.remove,
                                color: Constants.textColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              //
                              GameController.villagersCount++;
                            });
                          },
                          child: Container(
                            height: 30.0,
                            width: 30.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                border: Border.all(color: Constants.textColor)),
                            child: Center(
                              child: Icon(
                                Icons.add,
                                color: Constants.textColor,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
              child: Container(
            width: double.infinity,
            //color: Colors.blue,
            child: GridView.builder(
                padding: EdgeInsets.all(20.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 20.0,
                  crossAxisCount: 2,
                  crossAxisSpacing: 20.0,
                ),
                itemCount: Roles.length,
                itemBuilder: (BuildContext context, int index) {
                  return RoleCard(
                    role: Roles[index],
                    isEditable: true,
                    onTap: () {
                      updateState();
                    },
                  );
                }),
          )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            width: double.infinity,
            height: size.height * 0.1,
            //color: Colors.red,
            decoration: BoxDecoration(
                /*border: Border(
                  top: BorderSide(color: Constants.accentColor2, width: 5.0),
                ),*/
                color: Constants.bgColor,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withAlpha(50),
                      offset: Offset(0, -5),
                      blurRadius: 10.0,
                      spreadRadius: 10.0)
                ]),
            child: Row(
              children: [
                Text(
                  "Total Players : ${GameController.allCount}",
                  style: TextStyle(
                      color: Constants.textColor,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: SizedBox(),
                ),
                TextButton(
                    onPressed: () async {
                      //Start Game
                      if (GameController.allCount > 4) {
                        GameController.started = true;
                        await Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Game()));
                        setState(() {});
                      }
                    },
                    child: Container(
                      width: 120.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                          color: Constants.accentColor2,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Center(
                        child: Text(
                          "Start Game",
                          style: TextStyle(
                              color: Constants.textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
