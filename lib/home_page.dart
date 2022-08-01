import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_math_game/util/my_button.dart';
import 'package:flutter_math_game/util/result_message.dart';

import 'const.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int A = 1;
  int B = 2;
  String oprt = "+";

  List<String> numberPad = [
    "7",
    "8",
    "9",
    "C",
    "4",
    "5",
    "6",
    "DEL",
    "1",
    "2",
    "3",
    "=",
    "0",
  ];
  String userAnswer = "3";

  void buttonTapped(String button) {
    setState(() {
      if (button == "=") {
        checkAnswer();
      } else if (button == "C") {
        userAnswer = "";
      } else if (button == "DEL") {
        userAnswer = userAnswer.substring(0, userAnswer.length - 1);
      } else if (userAnswer.length < 3) {
        userAnswer += button;
      }
    });
  }

  void checkAnswer() {
    int ans = 0;

    switch (oprt) {
      case "x":
        ans = (A * B);
        break;
      case "-":
        ans = (A - B);
        break;
      case "+":
        ans = (A + B);
        break;
      case "/":
        ans = (A / B) as int;
        break;
    }

    if (ans == int.parse(userAnswer)) {
      showDialog(
          context: context,
          builder: (context) {
            return ResultMessage(
                message: "Correct!",
                icon: Icons.arrow_right_alt,
                onTap: goToNextQuestion);
          });
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return ResultMessage(
                message: "Try Again!",
                icon: Icons.close,
                onTap: goBackToQuestion);
          });
    }
  }

  var randomNumber = Random();
  List<String> opr = ["x", "-", "+", "/"];

  void goToNextQuestion() {
    Navigator.of(context).pop();

    setState(() {
      userAnswer = "";
    });
    A = randomNumber.nextInt(10);
    B = randomNumber.nextInt(10);
    oprt = opr[randomNumber.nextInt(4)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      body: Column(
        children: [
          //game level
          Container(
            height: 250,
            color: Colors.deepPurple,
          ),
          //question
          Expanded(
            child: Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$A $oprt $B = ",
                      style: whiteTextStyle,
                    ),
                    Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple[400],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Text(
                          userAnswer,
                          style: whiteTextStyle,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          //number pad
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: GridView.builder(
                itemCount: numberPad.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (context, index) {
                  return MyButton(
                    child: numberPad[index],
                    onTap: () => buttonTapped(numberPad[index].toString()),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  void goBackToQuestion() {
    Navigator.of(context).pop();
    setState(() {
      userAnswer = "";
    });
  }
}
