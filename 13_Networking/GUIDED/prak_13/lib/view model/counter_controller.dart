import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  var counter = 0.obs;
  void incrementCounter() {
    counter++;
  }

  void decrementCounter() {
    counter--;
  }

  void getsnackbar() {
    Get.snackbar(
      "Hello", "World",
      //warna background snackbar
      backgroundColor: Colors.grey,
    );
  }

  void getdialog() {
    Get.defaultDialog(
      title: "Hello",
      middleText: "Isekai",
    );
  }

  void getbottomsheet() {
    Get.bottomSheet(
      Container(
        child: Center(child: Text("ini bottom sheet")),
        height: 200,
        width: double.infinity,
        color: Colors.brown,
      ),
    );
  }
}
