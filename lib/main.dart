import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_storage/get_storage.dart';
import 'package:bhagwatiassociate/app.dart';
import 'package:bhagwatiassociate/utils/services/offline_sync_service.dart';

/// -- Entry point of the app
Future<void> main() async {
  /// widget binding
  final WidgetsBinding widgetBinding =
      WidgetsFlutterBinding.ensureInitialized();

  /// -- Getx local storage
  await GetStorage.init();

  /// -- await splash until items loaded
  FlutterNativeSplash.preserve(widgetsBinding: widgetBinding);

  /// -- put auth repository
  // Get.put(AuthRepository());

  /// Initialize services
  Get.put(OfflineSyncService());

  /// -- run the app
  runApp(const MyApp());
}
