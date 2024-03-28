import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbudzi/config/configuring.dart';
import 'package:mbudzi/controller/authentication.dart';
import 'package:mbudzi/pages/topic_deatils.dart';
import 'package:mbudzi/widgets/inputs.dart';

class LearningObjectives extends GetView<AuthController> {
  const LearningObjectives({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> topics = [
      'Goat Breeds',
      'Goat Housing',
      'Feeding and Nutrition',
      'Healthcare',
      'Breeding and Reproduction',
      'Milking and Dairy Goats',
      'Goat Behavior and Handling',
      'Market and Selling',
    ];
    Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greenColor,
        title: const Center(child: Text("Learning About Goats")),
      ),
      body: ListView.builder(
        itemCount: topics.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Get.to(TopicDetailScreen(topic: topics[index])),
            child: Container(
              height: 65,
              margin: EdgeInsets.all(5),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7.0,
                  )
                ],
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${index + 1}. ${topics[index]}',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.grey.shade600,
                    size: 18,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
