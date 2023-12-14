import 'package:flutter/material.dart';
import 'package:fluttertodolist/view/number_view.dart';
import 'package:get/get.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "number counter",
      home: NumberView(),
    );
  }
}
