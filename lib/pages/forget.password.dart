import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:mbudzi/controller/authentication.dart';
import 'package:mbudzi/widgets/inputs.dart';


class ForgetPassword extends GetView<AuthController> {
  const ForgetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(child: Text("Reset Password")),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EmailText(controller: controller.emailController, hintText: 'Email'),
          Obx(
            () => Btton(
              text: controller.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: Colors.black,
                    ))
                  : const Center(
                      child: Text(
                        'Reset',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15.0, color: Colors.white),
                      ),
                    ),
              onTap: () async {
                controller.login();
              },
            ),
          ),
        ],
      ),
    );
  }
}
