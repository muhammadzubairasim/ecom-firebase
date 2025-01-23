import 'package:ecom/features/authentication/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:ecom/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'firebase_options.dart';
//
Future<void> main() async {
  //add widgets binding
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then(
    (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );
  // add widgets binding
  // final WidgetsBinding widgetsBinding =
  //     WidgetsFlutterBinding.ensureInitialized();
//GETX local Storage
  await GetStorage.init();

// await splash until other items load
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const App());
}
// void main() {
//   runApp(const App());
// }
