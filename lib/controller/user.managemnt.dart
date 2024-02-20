import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:mbudzi/config/configuring.dart';
import 'package:mbudzi/pages/home.screen.dart';

class UserManagement {
  storeNewUser(user, context, String username, String userPhoneNumber,
      String homeAddress) async {
    FirebaseFirestore.instance.collection('users').doc(kUser.value!.uid).set({
      'email': user.email,
      'uid': user.uid,
      'username': username,
      "userPhoneNumber": userPhoneNumber,
      "homeAddress": homeAddress
    }).then((value) => Get.offAll(() => MyHomePage()));
  }
}
