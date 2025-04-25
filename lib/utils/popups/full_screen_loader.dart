import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bhagwatiassociate/utils/constants/colors.dart';

class SFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    const dark = false;
    //  SHelperFunctions.isDarkMode(Get.context!);
    showDialog(
        context: Get.overlayContext!,
        barrierDismissible: false,
        builder: (_) => PopScope(
              canPop: false,
              child: Container(
                color: dark ? SColors.dark : SColors.white,
                width: double.infinity,
                height: double.infinity,
                child: const Column(
                  children: [
                    SizedBox(height: 100),
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        dark ? SColors.white : SColors.primary,
                      ),
                    ),
                    // SAnimationLoaderWidget(text: text, animation: animation),
                  ],
                ),
              ),
            ));
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
