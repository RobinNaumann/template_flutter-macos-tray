import 'package:flutter/material.dart';
import 'package:flutter_acrylic/window.dart';
import 'package:flutter_acrylic/window_effect.dart';
import 'package:flutter_macos_tray/demo/demo_app_macosui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Window.initialize();
  await Window.setEffect(effect: WindowEffect.transparent);
  runApp(const MyMacosApp() /* or use `MyMaterialApp()` */);
}
