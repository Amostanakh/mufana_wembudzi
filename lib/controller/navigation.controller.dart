import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

class NavigationController extends GetxController {
  GetStorage getStorage = GetStorage();
  var selectedValue = ''.obs;
  var dropdownValues = ['Option 1', 'Option 2', 'Option 3'];

  Future<dynamic> getUser() async => await getStorage.read('user');
}
