import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbudzi/controller/authentication.dart';
import 'package:mbudzi/pages/loginscreen.dart';
import 'package:mbudzi/pages/signupscreen.dart';

class WelcomeScreen extends GetView<AuthController> {
  const WelcomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    return Scaffold(
        body: ColorFiltered(
      colorFilter: const ColorFilter.srgbToLinearGamma(),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/back1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset(
            //   "assets/LATS4.png",
            //   width: 200,
            // ),
            const SizedBox(height: 100),
            const Center(
                child: Text(
              "Mufanha Wembudzi Systerm",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
            GestureDetector(
              onTap: () async {
                Get.to(SignUpScreen());
              },
              child: Container(
                margin: const EdgeInsets.all(12),
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Text(
                    'Register',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: Colors.orange),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                Get.to(LoginScreen());
              },
              child: Container(
                margin: const EdgeInsets.all(12),
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: Colors.orange),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
