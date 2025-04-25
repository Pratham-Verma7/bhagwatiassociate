import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ActionButtonController());
    return Row(
      children: [
        Expanded(
          child: Obx(() => Row(
                children: [
                  Switch(
                    value: controller.emergencyMode.value,
                    activeColor: Colors.lightGreen,
                    activeTrackColor: Colors.lightGreenAccent,
                    onChanged: (value) => controller.toggleEmergencyMode(),
                  ),
                  const Text('Emergency', overflow: TextOverflow.ellipsis),
                ],
              )),
        ),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 8),
          ),
          child: const Text('View Request'),
        ),
      ],
    );
  }
}

class ActionButtonController extends GetxController {
  var emergencyMode = false.obs;

  void toggleEmergencyMode() {
    emergencyMode.value = !emergencyMode.value;
  }
}
