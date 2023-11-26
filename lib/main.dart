import 'package:flutter/material.dart';

import 'my_home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomeScreen(),
      theme: ThemeData(primarySwatch: Colors.lime),
    );
  }
}

