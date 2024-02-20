import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class NavigationController extends GetxController {
  GetStorage getStorage = GetStorage();
  Future<dynamic> getUser() async => await getStorage.read("user");
}
