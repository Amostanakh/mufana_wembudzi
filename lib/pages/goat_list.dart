import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbudzi/config/configuring.dart';
import 'package:mbudzi/pages/goat_details.dart';
import 'package:mbudzi/services/goat.services.dart';

class GoatList extends StatefulWidget {
  @override
  State<GoatList> createState() => _GoatListState();
}

class _GoatListState extends State<GoatList> {
  GoatServices listOfGoats = GoatServices();

  List goats = [];
  String name = '';

  @override
  void initState() {
    super.initState();
    getAllGoatsData();
  }

  getAllGoatsData() async {
    var myallGoatsData = await listOfGoats.getAllGoats();
    setState(() {
      goats = myallGoatsData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('All Goats'),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              TextFormField(
                onChanged: (val) {
                  setState(() {
                    name = val;
                  });
                },
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  suffixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  hintText: 'PhoneNumber...',
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color:
                            Colors.black), // You can customize the color here
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              _goatsList(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _goatsList(BuildContext context) {
    List<dynamic> filteredGoats =
        goats.where((goat) => goat['id'].toString().contains(name)).toList();
    if (goats.isEmpty) {
      return const Padding(
          padding: EdgeInsets.only(top: 50),
          child: Center(
            child: CircularProgressIndicator(
              color: greenColor,
            ),
          ));
    } else {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
          children: [
            if (filteredGoats.isNotEmpty)
              ListView.builder(
                shrinkWrap: true,
                itemCount: filteredGoats.length,
                itemBuilder: (BuildContext context, index) {
                  dynamic goat = filteredGoats[index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(GoatDetailsScreen(
                        goatId: '${goat['id']}',
                        owner: '${goat['owner']}',
                      ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BeautifulCard(
                        title: 'ID: ${goat['id']}',
                        description: 'SEX: ${goat['owner']}',
                      ),
                    ),
                  );
                },
              )
            else
              Text('No goats found with ID: $name'),
          ],
        ),
      );
    }
  }
}

class BeautifulCard extends StatelessWidget {
  final String title;
  final String description;

  const BeautifulCard({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage("assets/mbudzi.jpg"),
                  radius: 40,
                ),
                Column(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                const Icon(
                  Icons.more_vert,
                  size: 35,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
