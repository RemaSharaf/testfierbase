import 'package:fire_base_test/Constants/colors.dart';
import 'package:fire_base_test/models/note.dart';
import 'package:fire_base_test/screens/addEdit.dart/addEditController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddEdit extends StatelessWidget {
  AddEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<AddEditController>(
      init: AddEditController(),
      global: true,
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(),
          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: controller.title,
                  obscureText: false,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    fillColor: colors.textField,
                    hintText: "title",
                    hintStyle: GoogleFonts.poppins(
                        color: colors.textInputColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.transparent, width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: TextField(
                    controller: controller.info,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      fillColor: colors.textField,
                      hintText: "info",
                      hintStyle: GoogleFonts.poppins(
                          color: colors.textInputColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1,
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.transparent, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      controller.check();
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        side: const BorderSide(
                            width: 3.0, color: colors.textColor),
                        primary: Colors.blue,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        minimumSize: Size(size.width, 52)),
                    child: colors().App_Text(
                        text: Get.arguments == null ? "Add" : "Edit",
                        size: 18)),
              ],
            ),
          ),
        );
      },
    );
  }
}
