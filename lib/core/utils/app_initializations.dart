import 'package:alcohol_free/app/data/providers/firebase_auth_provider.dart';
import 'package:alcohol_free/app/data/providers/firestore_provider.dart';
import 'package:alcohol_free/app/data/services/notification_service/notification_service.dart';
import 'package:alcohol_free/app/data/services/auth_service/auth_service.dart';
import 'package:alcohol_free/app/data/services/promise_service/promise_service.dart';
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
  Get.put(FirebaseAuthProvider());
  Get.put(FirestoreProvider());
}

Future<void> initializeServices() async {
  // Service 생성 시 추가
  Get.putAsync(() async => await NotificationService().init());
  Get.put(AuthService());
  Get.putAsync(() async => await PromiseService().init());
}
