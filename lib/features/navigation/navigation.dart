import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import 'package:get/get.dart';
import 'package:mbudzi/config/configuring.dart';
import 'package:mbudzi/controller/navigation.controller.dart';
import 'package:mbudzi/models/user.model.dart';
import 'package:mbudzi/pages/home.screen.dart';
import 'package:mbudzi/pages/welcome.dart';

class Navigation extends GetView<NavigationController> {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NavigationController());
    return FutureBuilder(
      future: controller.getUser(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            kUser.value = UserModel.fromJson(snapshot.data);
            return MyHomePage();
          }
          return WelcomeScreen();
        }
        return const Scaffold();
      },
    );
  }
}
