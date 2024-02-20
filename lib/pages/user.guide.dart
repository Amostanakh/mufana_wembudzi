// import 'package:flutter/material.dart';
// import 'package:flutter_sms/flutter_sms.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/get_instance.dart';
// import 'package:get/get_navigation/get_navigation.dart';
// import 'package:get/get_state_manager/src/simple/get_view.dart';
// import 'package:mbudzi/config/configuring.dart';
// import 'package:mbudzi/controller/authentication.dart';
// import 'package:mbudzi/pages/locate.animal.dart';


// class UserGuide extends GetView<AuthController> {
//   const UserGuide({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     Get.put(AuthController());
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             "",
//             maxLines: 1,
//             softWrap: true,
//             style: TextStyle(
//                 color: Colors.black54,
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold),
//           ),
//         ),
//         body: ListView(children: [
//           GestureDetector(
//             onTap: () {
//               Get.to(const HowToLocate());
//             },
//             child: Container(
//               height: 65,
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.2),
//                     spreadRadius: 5,
//                     blurRadius: 7.0,
//                   )
//                 ],
//                 color: Colors.white,
//                 borderRadius: const BorderRadius.all(Radius.circular(20)),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     'How to Locate my Animal',
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18),
//                   ),
//                   Icon(
//                     Icons.arrow_forward_ios_rounded,
//                     color: Colors.grey.shade600,
//                     size: 18,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(height: 5),
//           GestureDetector(
//             onTap: () {
//               List<String> recipents = ['0771894989'];
//               // ignore: no_leading_underscores_for_local_identifiers
//               void _sendSMS(String message, List<String> recipents) async {
//                 String result =
//                     await sendSMS(message: message, recipients: recipents)
//                         .catchError((onError) {});
//               }

//               _sendSMS(
//                   "Im user ${kUser.value?.email}We need your help we lost our animal",
//                   recipents);
//             },
//             child: Container(
//               height: 65,
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.2),
//                     spreadRadius: 5,
//                     blurRadius: 7.0,
//                   )
//                 ],
//                 color: Colors.white,
//                 borderRadius: const BorderRadius.all(Radius.circular(20)),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     'Emergency SMS To us',
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18),
//                   ),
//                   Icon(
//                     Icons.arrow_forward_ios_rounded,
//                     color: Colors.grey.shade600,
//                     size: 18,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(height: 5),
//           GestureDetector(
//             onTap: () {
//               Get.defaultDialog(
//                 title: "User Guide",
//                 content: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: const [
//                     Text('1. Helping in tracking you livestock'),
//                     Text('2. Monitoring Behavior of the animal'),
//                     Text(
//                         '3.Real time locating of the animal by sending text sms')
//                   ],
//                 ),
//                 actions: [
//                   TextButton(
//                     child: const Text("Cancel"),
//                     onPressed: () => Get.back(),
//                   ),
//                 ],
//               );
//             },
//             child: Container(
//               height: 65,
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.2),
//                     spreadRadius: 5,
//                     blurRadius: 7.0,
//                   )
//                 ],
//                 color: Colors.white,
//                 borderRadius: const BorderRadius.all(Radius.circular(20)),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     'User Guide',
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18),
//                   ),
//                   Icon(
//                     Icons.arrow_forward_ios_rounded,
//                     color: Colors.grey.shade600,
//                     size: 18,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ]));
//   }
// }
