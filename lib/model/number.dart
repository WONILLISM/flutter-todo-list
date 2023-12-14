import 'package:get/get.dart';

class Number {
  final num = 0.obs;

  increment() => num.value++;
  decrement() => num.value--;
}
