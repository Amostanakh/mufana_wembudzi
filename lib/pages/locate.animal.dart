import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:mbudzi/controller/authentication.dart';

class HowToLocate extends GetView<AuthController> {
  const HowToLocate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "",
            maxLines: 1,
            softWrap: true,
            style: TextStyle(
                color: Colors.black54,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: SafeArea(
            child: Card(
          //  shape: ,
          color: Colors.black12,
          child: Column(
            children: const [
              Text('1. Download the App in Phone '),
              Text('2. Register for the App'),
              Text('3.Add the Livestock You want to Track')
            ],
          ),
        )));
  }
}
