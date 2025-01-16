import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

class MyMacosApp extends StatelessWidget {
  const MyMacosApp({super.key});

  @override
  Widget build(BuildContext context) => MacosApp(
        title: 'Tray App',
        debugShowCheckedModeBanner: false,
        // This is a workaround for this issue:
        // https://github.com/flutter/flutter/issues/105738
        builder: (_, c) => Navigator(
            initialRoute: "/",
            onGenerateRoute: (s) =>
                MaterialPageRoute(builder: (_) => _Demo(), settings: s)),
      );
}

class _Demo extends StatefulWidget {
  @override
  createState() => __DemoState();
}

class __DemoState extends State<_Demo> {
  final animals = [
    CupertinoIcons.tortoise,
    CupertinoIcons.ant,
    CupertinoIcons.hare
  ];
  int i = 0;

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(child: Center(child: Icon(animals[i], size: 100))),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PushButton(
                secondary: true,
                controlSize: ControlSize.large,
                child: const Text('quit'),
                onPressed: () => exit(0),
              ),
              PushButton(
                secondary: true,
                controlSize: ControlSize.large,
                child: const Text('next animal'),
                onPressed: () => setState(() => i = (i + 1) % animals.length),
              ),
            ],
          )
        ],
      ));
}
