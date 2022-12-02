import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fire_base_test/Constants/colors.dart';
import 'package:fire_base_test/screens/signUp/signUpcontroller.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpController controller2 = Get.put(SignUpController());
    Size size = MediaQuery.of(context).size;
    return GetBuilder<SignUpController>(
      init: SignUpController(),
      global: true,
      builder: (controller) {
        return Scaffold(
          backgroundColor: colors.background,
          body: Padding(
            padding: const EdgeInsets.all(30),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    colors().App_Text(text: "SignUp", size: 32),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        colors().App_Text(
                          text: "Email",
                          fontWeight: FontWeight.w500,
                          size: 14,
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        TextField(
                          controller: controller.email,
                          obscureText: false,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            fillColor: colors.textField,
                            hintText: "example@gmail.com",
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
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        colors().App_Text(
                          text: "Password",
                          fontWeight: FontWeight.w500,
                          size: 14,
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        TextField(
                          controller: controller.password,
                          obscureText: true,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            fillColor: colors.textField,
                            hintText: "Password",
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
                      ],
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          controller2.test3();
                        },
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            side: const BorderSide(
                                width: 3.0, color: colors.textColor),
                            primary: Colors.transparent,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            minimumSize: Size(size.width, 52)),
                        child: colors().App_Text(text: "SignUp", size: 18)),
                    TextButton(
                        onPressed: () {
                          Get.offNamed("/LogIn");
                        },
                        child: colors().App_Text(text: "Login", size: 18)),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
