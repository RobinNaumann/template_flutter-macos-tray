import 'package:flutter/material.dart';
import 'package:flutter_acrylic/window.dart';
import 'package:flutter_acrylic/window_effect.dart';
import 'package:flutter_macos_tray/demo/demo_app_macosui.dart';
import 'package:macos_ui/macos_ui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // this will make sure, the popover is treated as the view in focus
  WindowMainStateListener.instance.overrideIsMainWindow(true);

  // we want the popover to be translucent
  await Window.initialize();
  await Window.setEffect(effect: WindowEffect.transparent);

  runApp(const MyMacosApp() /* or use `MyMaterialApp()` */);
}
