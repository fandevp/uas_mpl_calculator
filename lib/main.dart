import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_calculator/flutter_simple_calculator.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: PopupMenuButton<int>(
            onSelected: (value) {
              // Handle menu item selection here
              if (kDebugMode) {
                print('Selected: $value');
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<int>(
                  enabled: false,
                  child: Text('Preference',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                PopupMenuItem<int>(value: 1, child: Text('Vibration on touch')),
                PopupMenuItem<int>(value: 2, child: Text('Memory butttons')),
                PopupMenuItem<int>(value: 3, child: Text('keypad layout')),
                PopupMenuItem<int>(value: 4, child: Text('Theme')),
                PopupMenuItem<int>(value: 5, child: Text('Displasy format')),
                const PopupMenuDivider(),
                const PopupMenuItem<int>(
                  enabled: false,
                  child: Text('Other',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                PopupMenuItem<int>(value: 6, child: Text('Share this app')),
                PopupMenuItem<int>(value: 7, child: Text('Send feedback')),
                PopupMenuItem<int>(value: 8, child: Text('Rate this app')),
                PopupMenuItem<int>(
                    value: 9, child: Text('Upgrade (Ad-Free version)')),
                PopupMenuItem<int>(value: 10, child: Text('Other App')),
                PopupMenuItem<int>(value: 11, child: Text('About')),
              ];
            },
            icon: const Icon(Icons.more_vert),
          ),
        ),
        body: const CalculatorScreen(),
      ),
    );
  }
}

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
