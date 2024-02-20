import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mbudzi/config/configuring.dart';
import 'package:mbudzi/controller/user.managemnt.dart';
import 'package:mbudzi/models/user.model.dart';
import 'package:mbudzi/pages/home.screen.dart';
import 'package:mbudzi/pages/goat_list.dart';
import 'package:mbudzi/pages/loginscreen.dart';

class AuthController extends GetxController {
  TextEditingController smsController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController tagNumber = TextEditingController();
  TextEditingController dateOfBirth = TextEditingController();
  TextEditingController dateofEntryonFarm = TextEditingController();
  TextEditingController mothersTag = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController userPhoneNumber = TextEditingController();
  TextEditingController livestockPhoneNumber = TextEditingController();
  TextEditingController homeAddress = TextEditingController();
  TextEditingController fathersTag = TextEditingController();
  GetStorage getStorage = GetStorage();
  RxBool isLoading = false.obs;
  late final FirebaseAuth auth;

  Map<String, dynamic> data = {};

  void signup(BuildContext context) {
    //isLoading.value = true;
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((signedInUser) async {
      data = {
        "email": signedInUser.user!.email,
        "uid": signedInUser.user!.uid,
        "username": userName.text,
        "Phonenumber": userPhoneNumber.text,
        "homeAddress": homeAddress.text,
      };
      await getStorage.write("user", data);
      kUser.value = UserModel.fromJson(data);
      // ignore: use_build_context_synchronously
      UserManagement().storeNewUser(signedInUser.user, context, userName.text,
          userPhoneNumber.text, homeAddress.text);
      //  isLoading.value = false;
    }).catchError((e) {
      Get.defaultDialog(
        title: "Alert!",
        content: const Text("Email or password error, try again"),
        actions: [
          TextButton(
            child: const Text("ok"),
            onPressed: () => Get.back(),
          ),
        ],
      );
    });
  }

  void login() {
    // isLoading.value = true;
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((signedInUser) async {
      data = {
        "email": signedInUser.user!.email,
        "uid": signedInUser.user!.uid,
      };
      await getStorage.write("user", data);
      kUser.value = UserModel.fromJson(data);
      Get.offAll(() => MyHomePage());
    }).catchError((e) {
      Get.defaultDialog(
        title: "Alert!",
        content: const Text("Email or password error, try again"),
        actions: [
          TextButton(
            child: const Text("ok"),
            onPressed: () => Get.back(),
          ),
        ],
      );
    });
    //  isLoading.value = false;
  }

  void forgetpassword() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      await auth.sendPasswordResetEmail(email: emailController.text);
      isLoading.value = false;
      Get.snackbar(
          'Email Successfully reseted', 'Open email to finish verication');
    } catch (e) {
      Get.snackbar('Try Again', 'Email does not exist');
    }
  }

  signOut() {
    // getStorage.erase();
    FirebaseAuth.instance
        .signOut()
        .then((value) => Get.to(() => const LoginScreen()));
  }

  delete() async {
    isLoading.value = true;
    User? currentFirebaseUser = FirebaseAuth.instance.currentUser;
    if (currentFirebaseUser != null) {
      currentFirebaseUser.delete().then((value) {
        FirebaseFirestore.instance
            .collection('users')
            .doc(currentFirebaseUser.uid)
            .delete();
        Get.defaultDialog(
            title: "Alert",
            content: const Text(
                "Are you sure you want to delete your account, you will not be able to recover it"),
            actions: [
              TextButton(
                  child: const Text("OK"),
                  onPressed: () => Get.offAll(const LoginScreen()))
            ]);
        // Get.snackbar('Account', 'Succesfully deleted');
        // getStorage.erase();
        // Get.offAll(() => const LoginScreen());
      }).catchError((e) {
        Get.defaultDialog(
          title: "Alert",
          content: const Text(
              "Delete account failure try to correct email or your paqssword"),
          actions: [
            TextButton(
              child: const Text("OK"),
              onPressed: () => Get.back(),
            ),
          ],
        );
        isLoading.value = false;
      });
    }
  }

  addLiveStockData() async {
    // isLoading.value = true;
    Map<String, dynamic> livestockData = {
      "LivestockPhoneNmuber": livestockPhoneNumber.text,
      "TagNo": tagNumber.text,
      "Date Of Birth": dateOfBirth.text,
      "Date of Entry on Farm": dateofEntryonFarm.text,
      "MothersTag": mothersTag.text,
      "FathersTag": fathersTag.text
    };
    FirebaseFirestore.instance
        .collection("users")
        .doc(kUser.value?.uid)
        .collection('myLivestocks')
        .add(livestockData)
        .then((value) => Get.snackbar('Alert', 'Livestock Successfully Added'));

    await Get.off(GoatList());
    // isLoading.value = false;
  }

  void checkStatus() async {
    isLoading.value = true;
    await (Connectivity().checkConnectivity());
    Get.snackbar('problem occured', 'No internet connection...');
    isLoading.value = false;
  }
}
