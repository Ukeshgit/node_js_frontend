import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nodejs_tut/home.dart';
import 'package:nodejs_tut/riverpod_get_post/controller/controller.dart';
import 'package:nodejs_tut/riverpod_get_post/counter_app/view/counter_app.dart';
import 'package:nodejs_tut/riverpod_get_post/view/view.dart';

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
        useMaterial3: true,
        primarySwatch: Colors.deepPurple,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: CounterApp(),
    );
  }
}
