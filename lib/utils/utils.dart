import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getxmvvm/resources/colors/app_colors.dart';

class Utils {
  static void fieldFoucsChnage(
    BuildContext context,
    FocusNode current,
    FocusNode nextfoucs,
  ) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextfoucs);
  }

  static snackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppColors.secconderyColor,
      colorText: AppColors.primaryColor,
      icon: const Icon(
        Icons.warning_amber_rounded,
        color: AppColors.primaryColor,
        size: 30,
      ),
    );
  }
}
