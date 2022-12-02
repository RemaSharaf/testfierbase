import 'package:fire_base_test/screens/addEdit.dart/addEdit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:fire_base_test/screens/Login/loginScreen.dart';
import 'package:fire_base_test/screens/mainScreen/mainScreen.dart';
import 'package:fire_base_test/screens/signUp/signUpScreen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/MainScreen',
      getPages: [
        GetPage(name: '/SignUp', page: () => const SignUp()),
        GetPage(name: '/LogIn', page: () => const LogIn()),
        GetPage(name: '/MainScreen', page: () => const MainScreen()),
        GetPage(name: '/AddEdit', page: () => AddEdit()),
      ],
    );
  }
}
