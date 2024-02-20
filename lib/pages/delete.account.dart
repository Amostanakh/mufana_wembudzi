import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbudzi/controller/authentication.dart';
import 'package:mbudzi/widgets/inputs.dart';

class DeleteAccount extends GetView<AuthController> {
  const DeleteAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(child: Text("Delete Account")),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EmailText(controller: controller.emailController, hintText: 'Email'),
          PasswordText(
              controller: controller.passwordController, hintText: 'Password'),
          Obx(
            () => Btton(
              text: controller.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: Colors.black,
                    ))
                  : const Center(
                      child: Text(
                        'Delete',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15.0, color: Colors.white),
                      ),
                    ),
              onTap: () async {
                controller.delete();
              },
            ),
          ),
        ],
      ),
    );
  }
}
