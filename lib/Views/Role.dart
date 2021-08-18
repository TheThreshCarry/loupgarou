import 'package:flutter/material.dart';
import 'package:loupgarou/constants.dart';
import 'package:loupgarou/data/Roles.dart';
import 'package:loupgarou/widgets/roleCard.dart';

class RolePage extends StatefulWidget {
  const RolePage({Key? key, required this.role}) : super(key: key);
  final Role role;

  @override
  _RolePageState createState() => _RolePageState();
}

class _RolePageState extends State<RolePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: WillPopScope(
      onWillPop: () {
        return Future.delayed(Duration(microseconds: 10), () {
          setState(() {});
          return true;
        });
      },
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Scaffold(
            backgroundColor: Constants.bgColor,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RoleCard(
                    role: widget.role,
                    onTap: () {},
                    isEditable: false,
                    height: 200.0,
                    width: 200.0,
                  ),
                  Text(
                    widget.role.name,
                    style: TextStyle(
                        color: Constants.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0),
                  )
                ],
              ),
            )),
      ),
    ));
  }
}
