import 'package:flutter/material.dart';

import '../const.dart';

class ResultMessage extends StatelessWidget {
  final String message;
  final IconData icon;
  final VoidCallback onTap;
  const ResultMessage(
      {Key? key,
      required this.message,
      required this.icon,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple,
      content: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              message,
              style: whiteTextStyle,
            ),
            GestureDetector(
              onTap: onTap,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.deepPurple[300],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
