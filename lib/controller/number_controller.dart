import 'package:fluttertodolist/model/number.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class NumberController extends GetxController {
  final number = Number();

  void increment() {
    number.increment();
    update();
  }

  void decrement() {
    number.decrement();
    update();
  }
}
