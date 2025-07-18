import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nodejs_tut/home.dart';
import 'package:nodejs_tut/practice/controller.dart';
import 'package:nodejs_tut/practice/view.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
  Apihelper.fetchData();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: RegData(),
    );
  }
}
