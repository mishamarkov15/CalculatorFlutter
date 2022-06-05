import 'package:calculator/Buttons.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userQuestion = '';
  var userAnswer = '';

  final outputTextStyle = const TextStyle(color: Colors.white, fontSize: 24);

  Map<int, Function> buttonFunctions = {};

  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '÷',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 23, 23, 23),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        userQuestion,
                        style: outputTextStyle,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        userAnswer,
                        style: outputTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                  child: GridView.builder(
                      itemCount: buttons.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4),
                      itemBuilder: (BuildContext context, int index) {
                        if (index >= 0 && index <= 2) {
                          return Button(
                              buttonText: buttons[index],
                              color: const Color.fromARGB(255, 138, 138, 138),
                              textColor: Colors.white,
                              buttonTapped: () {
                                if (index == 0) {
                                  setState(() {
                                    userQuestion = '';
                                  });
                                } else if (index == 1) {
                                  setState(() {
                                    userQuestion.isNotEmpty
                                        ? userQuestion = userQuestion.substring(
                                            0, userQuestion.length - 1)
                                        : '';
                                  });
                                }
                              });
                        } else {
                          return Button(
                              buttonText: buttons[index],
                              color: isOperator(buttons[index])
                                  ? Colors.orange
                                  : const Color.fromARGB(255, 83, 83, 83),
                              textColor: Colors.white,
                              buttonTapped: () {
                                if (index == buttons.length - 1) {
                                  setState(() {
                                    equalPressed();
                                  });
                                } else if (index == buttons.length - 2) {
                                  setState(() {
                                    ansPressed();
                                  });
                                } else {
                                  setState(() {
                                    userQuestion += buttons[index];
                                  });
                                }
                              });
                        }
                      })),
            ),
          ],
        ));
  }

  bool isOperator(String btnText) {
    return btnText == '÷' ||
        btnText == 'x' ||
        btnText == '-' ||
        btnText == '+' ||
        btnText == '=';
  }

  void ansPressed() {
    userQuestion += userAnswer;
  }

  void equalPressed() {
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAnswer = eval.toString();
  }
}
