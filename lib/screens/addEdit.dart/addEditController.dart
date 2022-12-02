import 'package:fire_base_test/firebase/fireStoreController.dart';
import 'package:fire_base_test/models/note.dart';
import 'package:fire_base_test/models/process_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddEditController extends GetxController {
  late TextEditingController title;
  late TextEditingController info;

  @override
  void onInit() {
    title = Get.arguments == null
        ? TextEditingController()
        : TextEditingController(text: Get.arguments["title"]);

    info = Get.arguments == null
        ? TextEditingController()
        : TextEditingController(text: Get.arguments["info"]);
    // info = TextEditingController();
    // title = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    title.dispose();
    info.dispose();
    super.dispose();
  }

  void check() async {
    if (title.text.isNotEmpty && info.text.isNotEmpty) {
      Note note = Note();
      note.title = title.text;
      note.info = info.text;
      if (Get.arguments == null) {
        ProcessResponse response =
            await FirestoreController().create(note: note);
        update();
      } else {
        note.path = Get.arguments["path"];
        ProcessResponse response =
            await FirestoreController().update(note: note);

        update();
      }
      Get.back();
    }
  }
}
