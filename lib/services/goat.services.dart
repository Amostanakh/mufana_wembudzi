import 'package:mbudzi/APIs/goat_api.dart';
import 'package:mbudzi/models/livestock.model.dart';

class GoatServices {
  getAllGoats() async {
    GoatsApi allgoastapi = GoatsApi();
    var allGoatsServices = await allgoastapi.fetchGoatData();
    return allGoatsServices;
  }

  // addGoats() async {
  //   GoatsApi postgoatapi = GoatsApi();
  //   var postGoatsServices = await postgoatapi.addGoat();
  //   return postGoatsServices;
  // }

  postGoats(GoatModel goat) async {
    GoatsApi postgoatapi = GoatsApi();
    var postGoatsServices = await postgoatapi.postGoatData(goat);
    return postGoatsServices;
  }
}










// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:mbudzi/APIs/authenitcation_api.dart';

// class RegisterController extends GetxController {
//   UserRepository _userRepository = UserRepository();
//   final RxBool isLoading = false.obs;

//   Future<void> registerUser(
//     String username,
//     String email,
//     String password,
//   ) async {
//     try {
//       isLoading(true);
//       await _userRepository.registerUser(
//         username,
//         email,
//         password,
//       );
//       // Handle successful registration
//       print('Processing');

//       // Show a success toast
//       String errorMessage = _extractErrorMessage('error 44');

//       print(errorMessage);
//       Fluttertoast.showToast(
//         msg: 'Error during registration: $errorMessage',
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//       );
//     } catch (e) {
//       // Handle registration failure
//       print('Error during registration: $e');

//       // Show an error toast with the API error message
//       String errorMessage = _extractErrorMessage(e);
//       Fluttertoast.showToast(
//         msg: 'Error during registration: $errorMessage',
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//       );
//     } finally {
//       isLoading(false);
//     }
//   }

//   String _extractErrorMessage(dynamic error) {
//     if (error is DioError && error.response != null) {
//       // If the error is a DioError and has a response, extract the error message
//       return error.response!.data['error'].toString();
//     } else {
//       // If it's not a DioError or doesn't have a response, return a generic error message
//       return 'Something went wrong. Please try again.';
//     }
//   }
// }





