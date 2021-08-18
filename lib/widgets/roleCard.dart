import 'package:flutter/material.dart';
import 'package:loupgarou/GameController.dart';
import 'package:loupgarou/constants.dart';
import 'package:loupgarou/data/Roles.dart';
import 'package:loupgarou/main.dart';

class RoleCard extends StatefulWidget {
  RoleCard(
      {Key? key,
      required this.role,
      required this.onTap,
      this.isEditable = true,
      this.height = 100,
      this.width = 100,
      this.showName = true})
      : super(key: key);
  final Role role;
  final bool isEditable;
  final double height;
  final double width;
  final Function onTap;
  final bool showName;
  @override
  _RoleCardState createState() => _RoleCardState();
}

class _RoleCardState extends State<RoleCard> {
  @override
  Widget build(BuildContext context) {
    bool isSelected = GameController.checkSelected(widget.role);
    Color borderColor =
        isSelected ? Constants.accentColor1 : Constants.bgColorLight;
    return GestureDetector(
      onTap: () {
        setState(() {
          if (widget.isEditable) {
            GameController.changeRoleState(widget.role);
            widget.onTap();
          }
        });
      },
      child: Column(children: [
        Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
              border: Border.all(color: borderColor, width: 8.0)),
          child: Center(
            child: widget.isEditable
                ? ColorFiltered(
                    colorFilter: !isSelected
                        ? ColorFilter.matrix(<double>[
                            0.2126,
                            0.7152,
                            0.0722,
                            0,
                            0,
                            0.2126,
                            0.7152,
                            0.0722,
                            0,
                            0,
                            0.2126,
                            0.7152,
                            0.0722,
                            0,
                            0,
                            0,
                            0,
                            0,
                            1,
                            0,
                          ])
                        : ColorFilter.mode(
                            Colors.transparent, BlendMode.multiply),
                    child: Image(
                      height: 120.0,
                      width: 120.0,
                      image: AssetImage(widget.role.imgPath),
                    ),
                  )
                : Image(
                    height: 120.0,
                    width: 120.0,
                    image: AssetImage(widget.role.imgPath),
                  ),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        widget.showName
            ? Text(
                widget.role.name,
                style: TextStyle(
                    color: borderColor,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              )
            : SizedBox(),
      ]),
    );
  }
}
/*ColorFiltered(
        colorFilter: isSelected
            ? ColorFilter.matrix(<double>[
                0.2126,
                0.7152,
                0.0722,
                0,
                0,
                0.2126,
                0.7152,
                0.0722,
                0,
                0,
                0.2126,
                0.7152,
                0.0722,
                0,
                0,
                0,
                0,
                0,
                1,
                0,
              ])
            : ColorFilter.mode(Colors.transparent, BlendMode.multiply),*/
