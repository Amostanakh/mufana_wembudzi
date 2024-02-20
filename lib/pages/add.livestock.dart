import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mbudzi/controller/authentication.dart';
import 'package:mbudzi/widgets/inputs.dart';

class AddLiveStock extends GetView<AuthController> {
  const AddLiveStock({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Livestock'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            Container(
                padding: const EdgeInsets.all(10),
                child: Image.asset('assets/mbudzi.jpg')),
            TextFormFilds(
                hintText: "Tag. No", controller: controller.tagNumber),
            DateTextFormFilds(
              controller: controller.dateOfBirth,
              hintText: "Date of Birth",
            ),
            DateTextFormFilds(
                hintText: "Date of entry on the Farm",
                controller: controller.dateofEntryonFarm),
            TextFormFilds(
                hintText: "Mothers Tag", controller: controller.mothersTag),
            TextFormFilds(
                hintText: "Fathers Tag", controller: controller.fathersTag),
            Obx(
              () => Btton(
                text: controller.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(
                        color: Colors.black,
                      ))
                    : const Center(
                        child: Text(
                          'Add',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15.0, color: Colors.white),
                        ),
                      ),
                onTap: () async {
                  controller.addLiveStockData();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
