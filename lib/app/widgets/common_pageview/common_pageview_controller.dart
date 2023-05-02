import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonPageViewController extends GetxController {
  var cIndex = 0.obs;

  var pageController = PageController();

  void changePageIndex(int index) {
    cIndex.value = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();

    super.dispose();
  }
}
