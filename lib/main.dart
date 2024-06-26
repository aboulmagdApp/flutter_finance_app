import 'package:flutter/material.dart';

import 'screens/statistics.dart';
import 'widgets/menu_bottom.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(useMaterial3: false),
      home: const Scaffold(
        body: MenuBottom(),
      ),
    );
  }
}
