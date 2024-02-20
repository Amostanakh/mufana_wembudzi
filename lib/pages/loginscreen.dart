// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:mbudzi/config/configuring.dart';
// import 'package:mbudzi/controller/authentication.dart';
// import 'package:mbudzi/pages/forget.password.dart';
// import 'package:mbudzi/pages/home.screen.dart';
// import 'package:mbudzi/pages/signupscreen.dart';
// import 'package:mbudzi/widgets/inputs.dart';

// class LoginScreen extends GetView<AuthController> {
//   const LoginScreen({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     Get.put(AuthController());
//     return GestureDetector(
//       onTap: () => keyboardUnFocus(),
//       child: Scaffold(
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           title: const Center(child: Text("Login")),
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Center(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Mufana",
//                     style:
//                         TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
//                   ),
//                   Text(
//                     "We",
//                     style: TextStyle(
//                         color: greenColor,
//                         fontSize: 30,
//                         fontWeight: FontWeight.normal),
//                   ),
//                   Text(
//                     "Mbudzi",
//                     style:
//                         TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
//                   ),
//                 ],
//               ),
//             ),
//             const Divider(
//               indent: 20,
//               endIndent: 20,
//               thickness: 1,
//               color: Colors.black,
//             ),
//             const Center(
//                 child: Text(
//               "Protecting Your Goats",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             )),
//             const SizedBox(
//               height: 12,
//             ),
//             EmailText(
//                 controller: controller.emailController, hintText: 'Email'),
//             PasswordText(
//                 controller: controller.passwordController,
//                 hintText: 'Password'),
//             Obx(
//               () => Btton(
//                 text: controller.isLoading.value
//                     ? const Center(
//                         child: CircularProgressIndicator(
//                         color: Colors.black,
//                       ))
//                     : const Center(
//                         child: Text(
//                           'Sign-In',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(fontSize: 15.0, color: Colors.white),
//                         ),
//                       ),
//                 onTap: () async {
//                   Get.to(MyHomePage());
//                   // var connectivityResult =
//                   //     await (Connectivity().checkConnectivity());
//                   // final hasInternet =
//                   //     connectivityResult != ConnectivityResult.none;
//                   // if (hasInternet) {
//                   //   controller.login();
//                   // } else if (!hasInternet) {
//                   //   controller.checkStatus();
//                   // }
//                 },
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Row(
//                   children: [
//                     const Text(
//                       "Don/t have account? ",
//                       style: TextStyle(color: Colors.black),
//                     ),
//                     GestureDetector(
//                       onTap: () => Get.to(const SignUpScreen()),
//                       child: const Text(
//                         "Sign up",
//                         style: TextStyle(
//                           color: Colors.orange,
//                           fontSize: 15,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 GestureDetector(
//                     onTap: () {
//                       Get.to(const ForgetPassword());
//                     },
//                     child: const Text(
//                       'Forgot password',
//                       style: TextStyle(color: Colors.black),
//                     ))
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbudzi/config/configuring.dart';
import 'package:mbudzi/controller/authentication.dart';
import 'package:mbudzi/pages/forget.password.dart';
import 'package:mbudzi/pages/home.screen.dart';
import 'package:mbudzi/pages/signupscreen.dart';
import 'package:mbudzi/widgets/inputs.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
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
                  const Divider(
                    indent: 20,
                    endIndent: 20,
                    thickness: 1,
                    color: Colors.black,
                  ),
                  const Center(
                    child: Text(
                      "Protecting Your Goats",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  EmailText(
                      controller: controller.emailController,
                      hintText: 'Email'),
                  PasswordText(
                      controller: controller.passwordController,
                      hintText: 'Password'),
                  Obx(
                    () => Btton(
                      text: controller.isLoading.value
                          ? const Center(
                              child: CircularProgressIndicator(
                              color: Colors.black,
                            ))
                          : const Center(
                              child: Text(
                                'Sign-In',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.white),
                              ),
                            ),
                      onTap: () async {
                        Get.to(MyHomePage());
                        // var connectivityResult =
                        //     await (Connectivity().checkConnectivity());
                        // final hasInternet =
                        //     connectivityResult != ConnectivityResult.none;
                        // if (hasInternet) {
                        //   controller.login();
                        // } else if (!hasInternet) {
                        //   controller.checkStatus();
                        // }
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Don/t have account? ",
                            style: TextStyle(color: Colors.black),
                          ),
                          GestureDetector(
                            onTap: () => Get.to(const SignUpScreen()),
                            child: const Text(
                              "Sign up",
                              style: TextStyle(
                                color: Colors.orange,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                          onTap: () {
                            Get.to(const ForgetPassword());
                          },
                          child: const Text(
                            'Forgot password',
                            style: TextStyle(color: Colors.black),
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
