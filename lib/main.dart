// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:html' as html;
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? loginValue;
  String? passwordValue;
  String? isFirstLaunch;
  @override
  void initState() {
    // disable loader animation
    html.document.querySelector('.loader-wrapper')?.style.display = 'none';

    // disable element with id "app"
    html.document.getElementById('app')?.style.display = 'none';

    // download login and password from storage
    loginValue = html.window.localStorage['loginValue'];
    passwordValue = html.window.localStorage['passwordValue'];

    isFirstLaunch = html.window.localStorage['isFirstLaunch'];

    super.initState();
  }

  void _changeIsFirstLaunchValue() {
    if (isFirstLaunch == 'false') {
      html.window.localStorage['isFirstLaunch'] = 'true';
      isFirstLaunch = 'true';
    } else {
      html.window.localStorage['isFirstLaunch'] = 'false';
      isFirstLaunch = 'false';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('login: $loginValue', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 10),
            Text('password: $passwordValue',
                style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 30),
            Text('First Launch: $isFirstLaunch',
                style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changeIsFirstLaunchValue,
              child: const Text('Change First Launch',
                  style: TextStyle(fontSize: 24)),
            )
          ],
        ),
      ),
    );
  }
}
