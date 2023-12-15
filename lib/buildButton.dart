import 'package:flutter/material.dart';

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

