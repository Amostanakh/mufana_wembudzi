import 'package:dio/dio.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mbudzi/config/configuring.dart';

class UserRepository extends GetxController {
  GetStorage getStorage = GetStorage();
  final Dio dio = Dio();
  RxString authToken = ''.obs;
  registerUser(String username, String email, String password) async {
    try {
      final Dio dio = Dio();
      final response = await dio.post(
        '$baseUrl/register/',
        data: {
          'username': username,
          'email': email,
          'password': password,
        },
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
      );
      if (response.statusCode == 201) {
        return "success";
      } else {
        return "Server Error,try Again";
      }
    } catch (e) {
      return "Error occoured, try again later";
    }
  }

  loginUser(
    String username,
    String password,
  ) async {
    try {
      final response = await dio.post(
        '$baseUrl/login/',
        data: {'username': username, 'password': password},
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );
      if (response.statusCode == 200) {
        authToken.value = response.data['access'] as String;
        getStorage.write('authToken', authToken.value);
        return 'loginSuccess';
      } else {
        return ('Failed to login. Server response:');
      }
    } catch (e) {
      return ('Email or password error');
    }
  }

  @override
  void onInit() {
    // Initialize the authToken from GetStorage on app startup
    authToken.value = getStorage.read('authToken') ?? '';
    super.onInit();
  }
}
