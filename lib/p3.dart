import 'package:flutter/material.dart';

class MyThirdPage extends StatelessWidget {
  MyThirdPage({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text(title),
    backgroundColor: Colors.teal,
    ));
    }
}