import 'package:get/get.dart';
import 'package:bhagwatiassociate/data/repositories/authentication_repo/authentication_repository.dart';
import 'package:bhagwatiassociate/utils/network_manager/network_manager.dart';

import '../features/main_app/controllers/home_controller.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(AuthRepository());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
