import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_voximplant/flutter_voximplant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: ElevatedButton(
                onPressed: _check, child: const Text("Press me"))));
  }

  void _check() async {
    final _client = Voximplant().getClient();
    await _client.connect();
    await _client.login("USERNAME", "PASSWORD");
    final _call = await _client.call("");

    _call.onCallConnected = _callConnected;
    _call.onMessageReceived = _onMessage;
    await Future.delayed(const Duration(seconds: 5));
    _call.hangup();
  }

  void _callConnected(VICall call, Map<String, String>? headers) {
    log("Call connected");
  }

  void _onMessage(VICall call, String message) {
    log(message);
  }
}
