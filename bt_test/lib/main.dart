import 'package:flutter/material.dart';
import 'dart:developer';
// import 'dart:developer' as developer;

import 'homescreen_widget.dart';

void main() {
  log('void main()', name: 'main');

  runApp(const MyApp());

  log('void main() exit', name: 'main');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    log('build()', name: 'MyApp');

    const appTitle = 'Flutter BLE demo';

    return const MaterialApp(
      title: appTitle,
      home: HomeScreen(
        appTitle: appTitle,
      ),
    );
  }
}
