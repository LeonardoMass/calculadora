import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 173, 181, 1),
        title: Center(child: Text('App by Leonardo Massena')),
      ),
      backgroundColor: Color.fromRGBO(57, 62, 70, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Center(
              child: Text(
                'Dispositivos Móveis 2020/2',
                style: TextStyle(
                  color: Color.fromARGB(234, 241, 241, 243),
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Color.fromRGBO(250, 250, 250, 1),
                    primary: Color.fromRGBO(0, 173, 181, 1),
                    padding: const EdgeInsets.all(20.0)),
                child: Text(
                  'Calculadora',
                  style: TextStyle(fontSize: 25),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Calculator(),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Color.fromRGBO(250, 250, 250, 1),
                    primary: Color.fromRGBO(0, 173, 181, 1),
                    padding: const EdgeInsets.all(20.0)),
                child: Text(
                  'Média',
                  style: TextStyle(fontSize: 25),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Average(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = "0";
  String _output2 = "0";
  String _output3 = "0";
  String _output4 = "0";

  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "X") {
      num1 = double.parse(_output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        print("Already contains a decimal");
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(_output);
      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "X") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }

    setState(() {
      _output2 = double.parse(_output).toString();
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.all(24.0),
          foregroundColor: Color.fromRGBO(250, 250, 250, 1),
          backgroundColor: Color.fromRGBO(0, 173, 181, 1),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () => buttonPressed(buttonText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(57, 62, 70, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 173, 181, 1),
        title: Text("Calculadora"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
              alignment: Alignment.centerRight,
              child: Text(
                _output2,
                style: TextStyle(
                  color: Color.fromRGBO(250, 250, 250, 1),
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Divider(),
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    buildButton("7"),
                    buildButton("8"),
                    buildButton("9"),
                    buildButton("/"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("4"),
                    buildButton("5"),
                    buildButton("6"),
                    buildButton("X"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("1"),
                    buildButton("2"),
                    buildButton("3"),
                    buildButton("-"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("."),
                    buildButton("0"),
                    buildButton("00"),
                    buildButton("+"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("CLEAR"),
                    buildButton("="),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Average extends StatefulWidget {
  @override
  _AverageState createState() => _AverageState();
}

class _AverageState extends State<Average> {
  String _output = "0";
  String _output2 = "0";
  List<double> avgList = [];
  int i = 0;
  double num1 = 0.0;
  double num2 = 0.0;

  buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      avgList.add(double.parse(_output));
      _output2 = "0";
      _output = "0";
      i++;
    } else {
      _output = _output + buttonText;
    }

    setState(() {
      _output2 = double.parse(_output).toString();
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.all(24.0),
          foregroundColor: Color.fromRGBO(250, 250, 250, 1),
          backgroundColor: Color.fromRGBO(0, 173, 181, 1),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () => buttonPressed(buttonText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(57, 62, 70, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 173, 181, 1),
        title: Text("Média de 3 números"),
      ),
      body: i < 3
          ? Container(
              child: Column(
                children: <Widget>[
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
                    alignment: Alignment.centerRight,
                    child: Text(
                      _output2,
                      style: TextStyle(
                        color: Color.fromRGBO(250, 250, 250, 1),
                        fontSize: 48.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(),
                  ),
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          buildButton("7"),
                          buildButton("8"),
                          buildButton("9"),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          buildButton("4"),
                          buildButton("5"),
                          buildButton("6"),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          buildButton("1"),
                          buildButton("2"),
                          buildButton("3"),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          buildButton("."),
                          buildButton("0"),
                          buildButton("00"),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          buildButton("CLEAR"),
                          buildButton("="),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          : Result(avgList),
    );
  }
}

class Result extends StatelessWidget {
  List<double> numbers = [];

  Result(this.numbers);

  String get resultPhrase {
    String resultText;
    double maior, menor;
    double avg =
        (numbers.elementAt(0) + numbers.elementAt(1) + numbers.elementAt(2)) /
            3;
    String media = avg.toStringAsFixed(3);

    numbers.sort();
    maior = numbers.elementAt(2);
    menor = numbers.elementAt(0);

    resultText =
        'A média dos números \n$numbers é igual a $media\n\n Maior número: $maior\n\n Menor número: $menor';

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                foregroundColor: Color.fromRGBO(250, 250, 250, 1),
                primary: Color.fromRGBO(0, 173, 181, 1),
                padding: EdgeInsets.fromLTRB(60, 20, 60, 20)),
            child: Text(
              'Voltar para o início',
              style: TextStyle(fontSize: 25),
            ),
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              )
            },
          )
        ],
      ),
    );
  }
}
