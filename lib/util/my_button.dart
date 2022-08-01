import 'package:flutter/material.dart';

import '../const.dart';

class MyButton extends StatelessWidget {
  final String child;
  final VoidCallback onTap;
  var buttonColor = Colors.deepPurple[400];

  MyButton({
    Key? key,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (child == "C") {
      buttonColor = Colors.green;
    } else if (child == "DEL") {
      buttonColor = Colors.red;
    } else if (child == "=") {
      buttonColor = Colors.deepPurple;
    }
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: buttonColor,
          ),
          child: Center(
              child: Text(
            child,
            style: whiteTextStyle,
          )),
        ),
      ),
    );
  }
}
