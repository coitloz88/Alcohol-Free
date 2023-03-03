import 'package:alcohol_free/app/data/providers/auth_provider.dart';
import 'package:alcohol_free/core/values/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

Future<void> initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

Future<void> initializeProviders() async {
  // Provider 생성 시 추가
  Get.put(AuthProvider());
}

Future<void> initializeServices() async {
  // Service 생성 시 추가
}
