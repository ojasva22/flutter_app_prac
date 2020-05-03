import 'package:flutter/material.dart';

import 'homePage.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'My Employee App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      debugShowCheckedModeBanner: false,
      home: homePage(),

    );

  }
}