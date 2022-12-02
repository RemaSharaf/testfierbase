import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fire_base_test/firebase/AuthController.dart';
import 'package:fire_base_test/models/process_response.dart';

class SignUpController extends GetxController {
  late TextEditingController email;
  late TextEditingController password;

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  void test3() async {
    ProcessResponse response = await FbAuthController()
        .signUp(email: email.text, password: password.text);

    if (response.success) {
      Get.offNamed("/MainScreen");
    }

    update();
  }
}
