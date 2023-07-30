import 'package:flutter/material.dart';

class ItemMenu extends StatelessWidget {
  //declaring variables

  final color;
  final textColor;
  final String menuText;
  final menutapped;

  //constructor
  const ItemMenu({this.color, this.textColor, required this.menuText, this.menutapped});

  @override
    Widget build(BuildContext context) {
    return GestureDetector(
      onTap: menutapped,
        child: Padding(
          padding: const EdgeInsets.all(0.2),
          child: ClipRRect(
            child: Container(
              color: color,
              child: Center(
                child: Text(
                  menuText,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
    );
  }
}