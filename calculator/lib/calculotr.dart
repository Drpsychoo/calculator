// ignore_for_file: camel_case_types, unused_local_variable

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

//Define a stateful widget for the calculator
class calculator extends StatefulWidget {
  const calculator({super.key});

  @override
  State<calculator> createState() => _calculatorState();
}

//Define the state for the calculator
class _calculatorState extends State<calculator> {
  //Declare variables to store the equation, result, and expression

  String equation = "0";
  String result = "0";
  String expression = " ";
//Declare font sizes for the equation and result display

  double equationFontSize = 38.0;
  double resultFontSize = 48.0;
//Method to handle button press

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "Ac") {
        equation = "0";
        result = "0";
        double equationFontSize = 38.0;
        double resultFontSize = 48.0;
      } else if (buttonText == "<") {
        double equationFontSize = 48.0;
        double resultFontSize = 38.0;
        if (equation == "") {
          equation = "0";
        }
        equation = equation.substring(0, equation.length - 1);
      } else if (buttonText == "=") {
        //https://pub.dev/packages/math_expressions/install and install dependencies into pubspec.yaml
//Evaluate the expression using the math_expressions library

        double equationFontSize = 38.0;
        double resultFontSize = 48.0;
        expression = equation;

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
      } else {
        double equationFontSize = 48.0;
        double resultFontSize = 38.0;
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
  }
//Method to build calculator buttons

  Widget buildButton(
      String buttonText, double buttonheight, Color buttonColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonheight,
      color: buttonColor,
      child: TextButton(
        onPressed: () => buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
//Build the calculator UI

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text(
          "Calculator",
          style: TextStyle(fontSize: 22, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
//Display the equation

          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              equation,
              style: TextStyle(fontSize: equationFontSize),
            ),
          ),
//Display the result

          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              result,
              style: TextStyle(fontSize: resultFontSize),
            ),
          ),
//Add a divider its divide your screen inot half

          const Expanded(child: Divider()),
//Create the calculator buttons

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * .73,
                child: Table(
                  children: [
                    TableRow(children: [
                      buildButton("Ac", 1, Colors.red.shade100),
                      buildButton("<", 1, Colors.blue.shade100),
                      buildButton("/", 1, Colors.blue.shade100),
                    ]),
                    TableRow(children: [
                      buildButton("7", 1, Colors.grey.shade300),
                      buildButton("8", 1, Colors.grey.shade300),
                      buildButton("9", 1, Colors.grey.shade300),
                    ]),
                    TableRow(children: [
                      buildButton("4", 1, Colors.grey.shade300),
                      buildButton("5", 1, Colors.grey.shade300),
                      buildButton("6", 1, Colors.grey.shade300),
                    ]),
                    TableRow(children: [
                      buildButton("1", 1, Colors.grey.shade300),
                      buildButton("2", 1, Colors.grey.shade300),
                      buildButton("3", 1, Colors.grey.shade300),
                    ]),
                    TableRow(children: [
                      buildButton(".", 1, Colors.grey.shade300),
                      buildButton("0", 1, Colors.grey.shade300),
                      buildButton("00", 1, Colors.grey.shade300),
                    ]),
                  ],
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .23,
                child: Table(
                  children: [
                    TableRow(children: [
                      buildButton("*", 1, Colors.blue.shade100),
                    ]),
                    TableRow(children: [
                      buildButton("-", 1, Colors.blue.shade100),
                    ]),
                    TableRow(children: [
                      buildButton("+", 1, Colors.blue.shade100),
                    ]),
                    TableRow(children: [
                      buildButton("=", 2, Colors.blue.shade300),
                    ]),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
