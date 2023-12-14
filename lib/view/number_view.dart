import 'package:flutter/material.dart';
import 'package:fluttertodolist/controller/number_controller.dart';
import 'package:get/get.dart';

class NumberView extends StatelessWidget {
  NumberView({super.key});

  final controller = Get.put(NumberController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("counter")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GetBuilder<NumberController>(
                builder: (_) => Text('count: ${controller.number.num}')),
            ElevatedButton(
              onPressed: () => controller.increment(),
              child: const Text('+'),
            ),
            ElevatedButton(
              onPressed: () => controller.decrement(),
              child: const Text('-'),
            ),
          ],
        ),
      ),
    );
  }
}
