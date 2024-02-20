import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

class NavigationController extends GetxController {
  GetStorage getStorage = GetStorage();

  Future<dynamic> getUser() async => await getStorage.read('user');
}
