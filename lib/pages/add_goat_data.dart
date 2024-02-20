import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:mbudzi/controller/authentication.dart';
import 'package:mbudzi/pages/home.screen.dart';

class LivestockDetails extends GetView<AuthController> {
  final DocumentSnapshot livestock;
  const LivestockDetails(
    this.livestock, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "LIVESTOCK DETAILS",
          maxLines: 1,
          softWrap: true,
          style: TextStyle(
              color: Colors.black54, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(children: [
        Container(
            // decoration:
            // BoxDecoration(borderRadius: BorderRadius.circular(60)),
            padding: const EdgeInsets.all(10),
            child: Image.asset('assets/bull.png')),
        ListTile(
            title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("PHONE NUMBER:"),
            Text(livestock['PhoneNmuber']),
          ],
        )),
        ListTile(
            title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [const Text("TAG NUMBER:"), Text(livestock['TagNo'])],
        )),
        ListTile(
            title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("DATE OF BIRTH:"),
            Text(livestock['Date Of Birth']),
          ],
        )),
        ListTile(
            title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("DATE ENTRY ON FARM:"),
            Text(livestock['Date of Entry on Farm'])
          ],
        )),
        ListTile(
            title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("MOTHRERS TAG:"),
            Text(livestock['MothersTag'])
          ],
        )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () {
                  List<String> recipents = [livestock['PhoneNmuber']];
                  // ignore: no_leading_underscores_for_local_identifiers
                  void _sendSMS(String message, List<String> recipents) async {
                    // String result =
                    //     await sendSMS(message: message, recipients: recipents)
                    //         .catchError((onError) {});
                  }

                  _sendSMS("Location", recipents);
                },
                child: const Text("SEND SMS")),
            TextButton(
                onPressed: () {
                  Get.to(MyHomePage());
                },
                child: const Text("LOCATE ME")),
            TextButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: "Alert",
                    content: Text(
                        "Are you sure you want to delete livestock with ID:${livestock['PhoneNmuber']}"),
                    actions: [
                      TextButton(
                        child: const Text("No"),
                        onPressed: () => Get.back(),
                      ),
                      TextButton(
                          child: const Text("Yes"),
                          onPressed: () {
                            FirebaseFirestore.instance.runTransaction(
                                (Transaction myTransaction) async {
                              myTransaction.delete(livestock.reference);
                            }).then((value) {
                              Get.back();
                              Get.snackbar(
                                'check to your Animal list',
                                'Livestock with id ${livestock['PhoneNmuber']} is Successfully Deleted',
                              );
                            });
                          }),
                    ],
                  );
                },
                child: const Text("DELETE")),
          ],
        )
      ]),
    );
  }
}
