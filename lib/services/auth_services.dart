import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mbudzi/APIs/authenitcation_api.dart';
import 'package:mbudzi/pages/home.screen.dart';

class RegisterController extends GetxController {
  UserRepository userRepository = UserRepository();
  final RxBool isLoading = false.obs;
  registerUser(String username, String email, String password) async {
    isLoading(true);
    var result = await userRepository.registerUser(username, email, password);
    isLoading(false);
    if (result == 'success') {
      Fluttertoast.showToast(
        msg: 'Successfull Registered',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
      );
      Get.to(MyHomePage());
    } else {
      Fluttertoast.showToast(
        msg: '$result',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
    }
    return result;
  }

  loginUser(String username, String password) async {
    // isLoading(true);
    var loginResult = await userRepository.loginUser(
      username,
      password,
    );

    if (loginResult == 'loginSuccess') {
      Fluttertoast.showToast(
        msg: 'Successfully Registered',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
      );
      Get.to(MyHomePage());
    } else {
      Fluttertoast.showToast(
        msg: loginResult,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
    // isLoading(false);
    return loginResult;
  }
}
