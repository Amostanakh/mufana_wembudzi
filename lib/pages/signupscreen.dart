// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/get_instance.dart';
// import 'package:get/get_navigation/src/extension_navigation.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
// import 'package:get/get_state_manager/src/simple/get_view.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:mbudzi/config/configuring.dart';
// import 'package:mbudzi/controller/authentication.dart';
// import 'package:mbudzi/pages/loginscreen.dart';
// import 'package:mbudzi/widgets/inputs.dart';

// class SignUpScreen extends GetView<AuthController> {
//   const SignUpScreen({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     Get.put(AuthController());
//     return GestureDetector(
//       onTap: () => keyboardUnFocus(),
//       child: Scaffold(
//           appBar: AppBar(
//             automaticallyImplyLeading: false,
//             title: const Center(child: Text("Register")),
//           ),
//           body: ListView(
//             padding: const EdgeInsets.only(top: 70),
//             children: [
//               const Center(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [

//                      Text(
//                       "MUFANA WEMBUDZI",
//                       style: TextStyle(
//                           fontSize: 30, fontWeight: FontWeight.normal),
//                     ),
//                   ],
//                 ),
//               ),
//               const Divider(
//                 indent: 20,
//                 endIndent: 20,
//                 thickness: 1,
//                 color: Colors.black,
//               ),
//               const Center(
//                   child: Text(
//                 "Protecting Your Goats",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               )),
//               const SizedBox(
//                 height: 12,
//               ),
//               TextFormFilds(hintText: "Name", controller: controller.userName),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: IntlPhoneField(
//                   controller: controller.userPhoneNumber,
//                   decoration: InputDecoration(
//                     labelText: 'Phone',
//                     filled: true,
//                     fillColor: Colors.grey.withOpacity(0.25),
//                     border: const OutlineInputBorder(
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                   initialCountryCode: 'IN',
//                   onChanged: (phone) {

//                   },
//                 ),
//               ),
//               TextFormFilds(
//                   hintText: "Address", controller: controller.homeAddress),
//               EmailText(
//                   controller: controller.emailController, hintText: 'Email'),
//               PasswordText(
//                   controller: controller.passwordController,
//                   hintText: 'Password'),
//               Obx(
//                 () => Btton(
//                   text: controller.isLoading.value
//                       ? const Center(
//                           child: CircularProgressIndicator(
//                           color: Colors.black,
//                         ))
//                       : const Center(
//                           child: Text(
//                             'Sign-Up',
//                             textAlign: TextAlign.center,
//                             style:
//                                 TextStyle(fontSize: 15.0, color: Colors.white),
//                           ),
//                         ),
//                   onTap: () async {
//                     var connectivityResult =
//                         await (Connectivity().checkConnectivity());
//                     final hasInternet =
//                         connectivityResult != ConnectivityResult.none;
//                     if (hasInternet) {
//                       // ignore: use_build_context_synchronously
//                       controller.signup(context);
//                     } else if (!hasInternet) {
//                       controller.checkStatus();
//                     }
//                   },
//                 ),
//               ),
//               Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                 const Text(
//                   "Already have an account? ",
//                   style: TextStyle(color: Colors.black, fontSize: 20),
//                 ),
//                 GestureDetector(
//                   onTap: () => Get.to(const LoginScreen()),
//                   child: const Text(
//                     "Login",
//                     style: TextStyle(
//                       color: Colors.orange,
//                       fontSize: 20,
//                     ),
//                   ),
//                 )
//               ]),
//             ],
//           )),
//     );
//   }
// }

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
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mbudzi/config/configuring.dart';
import 'package:mbudzi/controller/authentication.dart';
import 'package:mbudzi/pages/forget.password.dart';
import 'package:mbudzi/pages/home.screen.dart';
import 'package:mbudzi/pages/loginscreen.dart';
import 'package:mbudzi/pages/signupscreen.dart';
import 'package:mbudzi/widgets/inputs.dart';

class SignUpScreen extends GetView<AuthController> {
  const SignUpScreen({
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
          title: const Center(child: Text("SignUp")),
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
              height: MediaQuery.of(context).size.height * 0.60,
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
                  TextFormFilds(
                      hintText: "Address", controller: controller.homeAddress),
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
                                'Sign-Up',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.white),
                              ),
                            ),
                      onTap: () async {
                        var connectivityResult =
                            await (Connectivity().checkConnectivity());
                        final hasInternet =
                            connectivityResult != ConnectivityResult.none;
                        if (hasInternet) {
                          // ignore: use_build_context_synchronously
                          controller.signup(context);
                        } else if (!hasInternet) {
                          controller.checkStatus();
                        }
                      },
                    ),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    const Text(
                      "Already have an account? ",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    GestureDetector(
                      onTap: () => Get.to(const LoginScreen()),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 20,
                        ),
                      ),
                    )
                  ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
