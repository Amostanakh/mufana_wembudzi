import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mbudzi/controller/authentication.dart';
import 'package:mbudzi/controller/gender.controller.dart';
import 'package:mbudzi/models/livestock.model.dart';
import 'package:mbudzi/services/goat.services.dart';
import 'package:mbudzi/widgets/inputs.dart';

class AddLiveStock extends GetView<AuthController> {
  AddLiveStock({
    super.key,
  });

  final DropdownController dropdownController = Get.put(DropdownController());

  @override
  Widget build(BuildContext context) {
    GoatServices registerGoats = GoatServices();

    const List<String> _list = [
      'Female',
      'Male',
    ];

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
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey, // Border color
                  width: 2.0, // Border width
                ),
              ),
              height: 60,
              child: CustomDropdown<String>(
                hintText: 'Gender',
                items: _list,
                initialItem: _list[0],
                onChanged: (value) {
                  print('changing value to: $value');
                },
              ),
            ),
            TextFormFilds(
                hintText: "Mothers Tag", controller: controller.mothersTag),
            TextFormFilds(
                hintText: "Fathers Tag", controller: controller.fathersTag),
            // Obx(
            //   () => Btton(
            //     text: controller.isLoading.value
            //         ? const Center(
            //             child: CircularProgressIndicator(
            //             color: Colors.black,
            //           ))
            //         : const Center(
            //             child: Text(
            //               'Add',
            //               textAlign: TextAlign.center,
            //               style: TextStyle(fontSize: 15.0, color: Colors.white),
            //             ),
            //           ),

            //     onTap: () async {
            //       await registerGoats.postGoats(GoatModel(
            //         tagNumber: controller.tagNumber.text,
            //         birthDate: "2024-01-12",
            //         weight: 11.00,
            //         gender: "Male",
            //         father: 1,
            //         mother: 1,
            //         owner: 1,
            //       ));
            //     },
            //     // onTap: () async {
            //     //   controller.addLiveStockData();
            //     // },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
