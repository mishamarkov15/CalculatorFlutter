import 'package:calculator/Buttons.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        backgroundColor: Color.fromARGB(255, 23, 23, 23),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(),
            ),
            Expanded(
              flex: 2,
              child: Container(
                  child: GridView.builder(
                      itemCount: buttons.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4),
                      itemBuilder: (BuildContext context, int index) {
                        if (index >= 0 && index <= 2) {
                          return Button(
                              buttonText: buttons[index],
                              color: Color.fromARGB(255, 138, 138, 138),
                              textColor: Colors.white);
                        } else {
                          return Button(
                            buttonText: buttons[index],
                            color: isOperator(buttons[index])
                                ? Colors.orange
                                : Color.fromARGB(255, 83, 83, 83),
                            textColor: Colors.white,
                          );
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
}
