import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_calculator/flutter_simple_calculator.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  double? _currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SimpleCalculator(
          value: _currentValue!,
          hideExpression: false,
          hideSurroundingBorder: true,
          autofocus: true,
          onChanged: (key, value, expression) {
            setState(() {
              _currentValue = value ?? 0;
            });
            if (kDebugMode) {
              print('$key\t$value\t$expression');
            }
          },
          onTappedDisplay: (value, details) {
            if (kDebugMode) {
              print('$value\t${details.globalPosition}');
            }
          },
          theme: const CalculatorThemeData(
            borderColor: Colors.black,
            borderWidth: 2,
            displayColor: Colors.white,
            displayStyle: TextStyle(fontSize: 80, color: Colors.black),
            expressionColor: Colors.white,
            expressionStyle: TextStyle(fontSize: 20, color: Colors.black),
            operatorColor: Colors.indigo,
            operatorStyle: TextStyle(fontSize: 30, color: Colors.white),
            commandColor: Colors.indigo,
            commandStyle: TextStyle(fontSize: 30, color: Colors.white),
            numColor: Colors.grey,
            numStyle: TextStyle(fontSize: 50, color: Colors.white),
          ),
        );
      },
    );
  }
}
