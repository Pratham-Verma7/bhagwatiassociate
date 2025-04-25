import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxString userName = 'John Doe'.obs;
  final RxInt totalAppointments = 24.obs;
  final RxDouble totalEarnings = 1234.0.obs;
  final RxBool emergencyMode = false.obs;

  void toggleEmergencyMode() {
    emergencyMode.value = !emergencyMode.value;
  }
}