import 'dart:ffi';
import 'Home.dart';
import 'Read.dart';
import 'Solve.dart';
import 'Collection.dart';
import 'package:flutter/material.dart';

//画面遷移
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => MainPage(),
        '/solve_question': (BuildContext context) => solve_question(),
        '/collection': (BuildContext context) => collection(),
      },
    );
  }
}
