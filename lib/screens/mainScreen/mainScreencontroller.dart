import 'package:fire_base_test/firebase/fireStoreController.dart';
import 'package:get/get.dart';
import 'package:fire_base_test/firebase/AuthController.dart';
import 'package:fire_base_test/models/process_response.dart';

class MainController extends GetxController {
  void logOut() async {
    ProcessResponse response = await FbAuthController().signOut();

    if (response.success) {
      Get.offNamed("/LogIn");
    }
    update();
  }

  void delete(String path) async {
    ProcessResponse response = await FirestoreController().delete(path: path);

    update();
  }
}
