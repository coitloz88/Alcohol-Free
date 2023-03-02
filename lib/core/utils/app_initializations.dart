import 'package:alcohol_free/core/values/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

Future<void> initializeProviders() async {
  // Provider 생성 시 추가
}

Future<void> initializeServices() async {
  // Service 생성 시 추가
}
