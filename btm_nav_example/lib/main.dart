import 'package:btm_nav_example/btm_26032024/curved_labeled_bar_ex.dart';
import 'package:btm_nav_example/btm_26032024/curved_labeled_bar_ex_3.dart';
import 'package:btm_nav_example/btm_26032024/curved_labeled_ex_2.dart';
import 'package:btm_nav_example/btm_26032024/ex_first.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BottomCurvedNavBarExThird(),
    );
  }
}
