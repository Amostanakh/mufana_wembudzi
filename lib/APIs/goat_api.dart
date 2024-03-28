import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/instance_manager.dart';
import 'package:mbudzi/APIs/authenitcation_api.dart';
import 'package:mbudzi/config/configuring.dart';
import 'package:mbudzi/controller/authentication.dart';
import 'package:mbudzi/models/livestock.model.dart';

class GoatsApi {
  Dio _dio = Dio();
  final UserRepository authService = Get.put(UserRepository());
  Future<void> fetchGoatData() async {
    try {
      Response response = await _dio.get(
        '$baseUrl/goats/',
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> postGoatData(GoatModel goat) async {
    print("starting");
    try {
      print("starting response");

      print(goat.toJson());
      Response response = await _dio.post(
        '$baseUrl/goats/',
        data: goat.toJson(),
      );
      print("End response");

      if (response.statusCode == 201) {
        print('Data posted successfully');
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}
