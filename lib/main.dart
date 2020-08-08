import 'package:flutter/material.dart';
import 'package:party_man/Screens/FunctionList.dart';

import 'Screens/FuntionListView.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext build) {
    return MaterialApp(
      title: 'Party Man',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      debugShowCheckedModeBanner: false,
      home: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FunctionList(),

      ),
    );
  }
}
