import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbudzi/config/configuring.dart';
import 'package:mbudzi/pages/forget.password.dart';
import 'package:mbudzi/pages/signupscreen.dart';
import 'package:mbudzi/services/auth_services.dart';
import 'package:mbudzi/widgets/inputs.dart';

class LoginScreen extends StatelessWidget {
  final RegisterController _controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    TextEditingController username = TextEditingController();
    TextEditingController password = TextEditingController();
    return GestureDetector(
      onTap: () => keyboardUnFocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: greenColor,
          automaticallyImplyLeading: false,
          title: const Center(child: Text("Login")),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/jj.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.6,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white, // Set your desired background color
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Mufana",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.normal),
                        ),
                        Text(
                          "We",
                          style: TextStyle(
                              color: greenColor,
                              fontSize: 30,
                              fontWeight: FontWeight.normal),
                        ),
                        Text(
                          "Mbudzi",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  TextFormFilds(hintText: "Username", controller: username),
                  PasswordText(controller: password, hintText: 'Password'),
                  Container(
                    decoration: BoxDecoration(
                      color: greenColor, // Set your desired background color
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Obx(
                      () => TextButton(
                        onPressed: _controller.isLoading()
                            ? null
                            : () {
                                _controller.loginUser(
                                    username.text, password.text);
                              },
                        child: _controller.isLoading()
                            ? const Center(
                                child: CircularProgressIndicator(
                                color: Colors.white,
                              ))
                            : const Center(
                                child: Text(
                                  'Sign-Up',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 15.0, color: Colors.white),
                                ),
                              ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don/t have account? ",
                            style: TextStyle(color: Colors.black),
                          ),
                          GestureDetector(
                            onTap: () => Get.to(SignUpScreen()),
                            child: const Text(
                              "Sign up",
                              style: TextStyle(
                                color: greenColor,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      // ignore: prefer_const_constructors
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                          onTap: () {
                            Get.to(const ForgetPassword());
                          },
                          child: const Text(
                            'Reset password',
                            style: TextStyle(color: Colors.grey),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
