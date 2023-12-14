// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var userQuestion = "", userAnswer = "";

  List buttons = [
    "c",
    "DEL",
    "%",
    "/",
    9,
    8,
    7,
    "x",
    6,
    5,
    4,
    "-",
    3,
    2,
    1,
    "+",
    0,
    ".",
    "ANS",
    "="
  ];

  bool isOperator(index) {
    if (index == "+") {
      return true;
    } else if (index == "x") {
      return true;
    } else if (index == "-") {
      return true;
    } else if (index == "+") {
      return true;
    } else if (index == "/") {
      return true;
    } else if (index == "=") {
      return true;
    } else if (index == "%") {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 181, 203, 229),
        body: Column(
          children: [
            Expanded(
                child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                        padding: EdgeInsets.all(20),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          userQuestion,
                          style: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.bold),
                        )),
                    Container(
                        padding: EdgeInsets.all(20),
                        alignment: Alignment.centerRight,
                        child: Text(
                          userAnswer,
                          style: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ),
            )),
            Expanded(
              flex: 2,
              child: Container(
                child: GridView.builder(
                    itemCount: buttons.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return MyButton(
                          buttonTapped: () {
                            setState(() {
                              userQuestion = "";
                              userAnswer = "";
                            });
                          },
                          operator: buttons[index].toString(),
                          ContentColor: Colors.white,
                          CoverColor: Colors.green,
                        );
                      } else if (index == 1) {
                        return MyButton(
                          buttonTapped: () {
                            setState(() {
                              userQuestion = userQuestion.substring(
                                  0, userQuestion.length - 1);
                            });
                          },
                          operator: buttons[index].toString(),
                          ContentColor: Colors.white,
                          CoverColor: Colors.red,
                        );
                      } else if (index == buttons.length - 1) {
                        return MyButton(
                          buttonTapped: () {
                            setState(() {
                              Calculate();
                            });
                          },
                          operator: buttons[index].toString(),
                          ContentColor: isOperator(buttons[index])
                              ? Colors.white
                              : Color.fromARGB(255, 51, 129, 223),
                          CoverColor: isOperator(buttons[index])
                              ? Color.fromARGB(255, 51, 129, 223)
                              : Colors.white,
                        );
                      } else if (index == buttons.length - 2) {
                        return MyButton(
                          buttonTapped: () {
                            setState(() {
                              Calculate();
                            });
                          },
                          operator: buttons[index].toString(),
                          ContentColor: isOperator(buttons[index])
                              ? Colors.white
                              : Color.fromARGB(255, 51, 129, 223),
                          CoverColor: isOperator(buttons[index])
                              ? Color.fromARGB(255, 51, 129, 223)
                              : Colors.white,
                        );
                      } else {
                        return MyButton(
                          buttonTapped: () {
                            setState(() {
                              userQuestion += buttons[index].toString();
                            });
                          },
                          operator: buttons[index].toString(),
                          ContentColor: isOperator(buttons[index])
                              ? Colors.white
                              : Color.fromARGB(255, 51, 129, 223),
                          CoverColor: isOperator(buttons[index])
                              ? Color.fromARGB(255, 51, 129, 223)
                              : Colors.white,
                        );
                      }
                    }),
              ),
            ),
          ],
        ));
  }

  void Calculate() {
    Parser p = Parser();
    userQuestion = userQuestion.replaceAll("x", "*");
    Expression exp = p.parse(userQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAnswer = eval.toString();
  }
}

class MyButton extends StatelessWidget {
  final String operator;
  final Color CoverColor;
  final Color ContentColor;
  final buttonTapped;
  const MyButton({
    super.key,
    required this.operator,
    required this.CoverColor,
    required this.ContentColor,
    required this.buttonTapped,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: 20,
              width: 20,
              color: CoverColor,
              child: Center(
                child: Text(
                  operator,
                  style: TextStyle(
                    fontSize: 45,
                    color: ContentColor,
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
