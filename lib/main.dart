import 'package:flutter/material.dart';

void main() {
  runApp(SamiApp());
}

class SamiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calcolator(),
    );
  }
}

class Calcolator extends StatefulWidget {
  @override
  State<Calcolator> createState() => _CalcolatorState();
}

class _CalcolatorState extends State<Calcolator> {
  String result = '0';
  String finalResult = '0';
  double num1 = 0.0;
  double num2 = 0.0;
  String opr = '';
  buttonPressed(String btnVal) {
    if (btnVal == 'AC') {
      finalResult = '0';
      num1 = 0.0;
      num2 = 0.0;
      opr = '';
    } else if (btnVal == '+' ||
        btnVal == '-' ||
        btnVal == '÷' ||
        btnVal == '×') {
      num1 = double.parse(result);
      opr = btnVal;
      finalResult = '0';
      result = result + btnVal;
    } else if (btnVal == '.') {
      if (finalResult.contains('.')) {
      } else {
        finalResult = finalResult = btnVal;
      }
    } else if (btnVal == '+/-') {
      if (result.toString().contains('-')) {
        result.toString().substring(1);
        finalResult = result;
      } else {
        result = '-' + result;
      }
    } else if (btnVal == '%') {
      num2 = double.parse(result);
      finalResult = (num2 / 100).toString();
    } else if (btnVal == '=') {
      num2 = double.parse(result);
      if (opr == '+') {
        finalResult = (num1 + num2).toString();
      }
      if (opr == '-') {
        finalResult = (num1 - num2).toString();
      }
      if (opr == '×') {
        finalResult = (num1 * num2).toString();
      }
      if (opr == '÷') {
        finalResult = (num1 / num2).toString();
      }
    } else {
      finalResult = finalResult + btnVal;
    }
    setState(() {
      result = double.parse(finalResult).toString();
    });
  }

  Widget bottonForm(String textButton, Color textColor, Color backGroundColor) {
    if (textButton != '0') {
      return Container(
        child: RawMaterialButton(
          onPressed: () {
            buttonPressed(textButton);
          },
          shape: CircleBorder(),
          fillColor: backGroundColor,
          padding: EdgeInsets.all(20),
          child: Text(
            textButton,
            style: TextStyle(
              fontSize: 35,
              color: textColor,
            ),
          ),
        ),
      );
    } else {
      return Container(
        child: RawMaterialButton(
          onPressed: () {
            buttonPressed(textButton);
          },
          shape: StadiumBorder(),
          fillColor: backGroundColor,
          padding: EdgeInsets.fromLTRB(34, 20, 128, 20),
          child: Text(
            textButton,
            style: TextStyle(
              fontSize: 35,
              color: textColor,
            ),
          ),
        ),
      );
    }
  }

  dynamic newMethod(String textButton) => textButton != '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Calcolator'),
          backgroundColor: const Color.fromARGB(255, 37, 118, 40),
        ),
        body: Padding(
          padding: EdgeInsets.all(7.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '$finalResult',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 100,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  bottonForm('AC', Color.fromARGB(255, 236, 225, 225),
                      Color.fromARGB(255, 100, 139, 20)),
                  bottonForm('+/-', Color.fromARGB(255, 236, 225, 225),
                      Color.fromARGB(255, 100, 139, 20)),
                  bottonForm('%', Color.fromARGB(255, 236, 225, 225),
                      Color.fromARGB(255, 100, 139, 20)),
                  bottonForm(
                    '÷',
                    Color.fromARGB(255, 100, 139, 20),
                    Color.fromARGB(255, 236, 225, 225),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  bottonForm('7', Color.fromARGB(255, 236, 225, 225),
                      Color.fromARGB(255, 100, 139, 20)),
                  bottonForm('8', Color.fromARGB(255, 236, 225, 225),
                      Color.fromARGB(255, 100, 139, 20)),
                  bottonForm('9', Color.fromARGB(255, 236, 225, 225),
                      Color.fromARGB(255, 100, 139, 20)),
                  bottonForm(
                    '×',
                    Color.fromARGB(255, 100, 139, 20),
                    Color.fromARGB(255, 236, 225, 225),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  bottonForm('4', Color.fromARGB(255, 236, 225, 225),
                      Color.fromARGB(255, 100, 139, 20)),
                  bottonForm('5', Color.fromARGB(255, 236, 225, 225),
                      Color.fromARGB(255, 100, 139, 20)),
                  bottonForm('6', Color.fromARGB(255, 236, 225, 225),
                      Color.fromARGB(255, 100, 139, 20)),
                  bottonForm(
                    '-',
                    Color.fromARGB(255, 100, 139, 20),
                    Color.fromARGB(255, 236, 225, 225),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    bottonForm('1', Color.fromARGB(255, 236, 225, 225),
                        Color.fromARGB(255, 100, 139, 20)),
                    bottonForm('2', Color.fromARGB(255, 236, 225, 225),
                        Color.fromARGB(255, 100, 139, 20)),
                    bottonForm('3', Color.fromARGB(255, 236, 225, 225),
                        Color.fromARGB(255, 100, 139, 20)),
                    bottonForm('+', Color.fromARGB(255, 100, 139, 20),
                        Color.fromARGB(255, 236, 225, 225)),
                  ]),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  bottonForm('0', Color.fromARGB(255, 236, 225, 225),
                      Color.fromARGB(255, 100, 139, 20)),
                  bottonForm('.', Color.fromARGB(255, 236, 225, 225),
                      Color.fromARGB(255, 100, 139, 20)),
                  bottonForm('=', Color.fromARGB(255, 100, 139, 20),
                      Color.fromARGB(255, 236, 225, 225)),
                ],
              ),
            ],
          ),
        ));
  }
}
