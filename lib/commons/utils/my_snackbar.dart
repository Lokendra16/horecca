import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MySnackBar {

  void errorSnackBar(String? error) {
    Get.snackbar(
      "Error Occurred!", // Snackbar title
      error ?? 'Unexpected error occurred', // Snackbar message
      backgroundColor: Colors.red,
      // Background color
      colorText: Colors.white,
      // Text color
      icon: const Icon(Icons.error),
      // Icon
      shouldIconPulse: true,
      // Icon pulse animation
      duration: const Duration(seconds: 3),
      // Duration
      borderRadius: 10,
      // Snackbar border radius
      snackPosition: SnackPosition.BOTTOM,
      // Snackbar position
      margin: const EdgeInsets.all(10),
      // Margin
      isDismissible: true,
      // Dismissible on tap
      dismissDirection: DismissDirection.down,
      // Dismiss direction
      forwardAnimationCurve: Curves.easeOut,
      // Forward animation curve
      reverseAnimationCurve: Curves.easeIn, // Reverse animation curve
    );
  }
}
