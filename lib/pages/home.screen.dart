import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbudzi/config/configuring.dart';
import 'package:mbudzi/pages/add.livestock.dart';
import 'package:mbudzi/pages/add_goat_data.dart';
import 'package:mbudzi/pages/goat_list.dart';
import 'package:mbudzi/pages/goat_reviws.dart';
import 'package:mbudzi/pages/goats_report.dart';
import 'package:mbudzi/widgets/inputs.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greenColor,
        title: const Text('Goat Management System'),
      ),
      drawer: const AdminDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/jj.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 70),
            SlidingCardsWidget(),
            const SizedBox(height: 30),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  _buildSection(
                    context,
                    'Goat Overview',
                    'View summary information about your goats.',
                    Icons.dashboard,
                    () {
                      Get.to(MyApp());
                      // Navigate to the Goat Overview screen
                    },
                  ),
                  _buildSection(
                    context,
                    'Goat List',
                    'Browse and manage your list of goats.',
                    Icons.list,
                    () {
                      Get.to(GoatList());
                      // Navigate to the Goat List screen
                    },
                  ),
                  _buildSection(
                    context,
                    'Add Goat',
                    'Add a new goat to your inventory.',
                    Icons.add,
                    () {
                      Get.to(AddLiveStock());
                      // Navigate to the Add Goat screen
                    },
                  ),
                  _buildSection(
                    context,
                    'Reports',
                    'Generate reports and analytics.',
                    Icons.analytics,
                    () {
                      Get.to(GoatReportPage());
                      // Navigate to the Reports screen
                    },
                  ),

                  // Add more sections as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    Function onTap,
  ) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Card(
        margin: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40),
            const SizedBox(height: 8.0),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4.0),
            Text(
              description,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class SlidingCardsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200, // Set the height as needed
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildSlidingCard(context, 'Card 1'),
          _buildSlidingCard(context, 'Card 2'),
          _buildSlidingCard(context, 'Card 3'),
          // Add more sliding cards as needed
        ],
      ),
    );
  }

  Widget _buildSlidingCard(BuildContext context, String cardTitle) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8, // Set the width as needed
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Center(
        child: Text(
          cardTitle,
          style: TextStyle(color: Colors.black, fontSize: 20.0),
        ),
      ),
    );
  }
}
