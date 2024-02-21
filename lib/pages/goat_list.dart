// //
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:mbudzi/pages/add.livestock.dart';

// class Search extends StatefulWidget {
//   const Search({Key? key}) : super(key: key);

//   @override
//   State<Search> createState() => _SearchState();
// }

// class _SearchState extends State<Search> {
//   String name = "";

// List<Map<String, dynamic>> goatdata = [
//   {
//     'ID': "A1000",
//     'DOB': '12/13/23',
//     "sex": 'female',
//     "colour": 'white',
//   },
//   {
//     'ID': "A11000",
//     'DOB': '12/14/23',
//     "sex": 'male',
//     "colour": 'black and white',
//   },
//   {
//     'ID': "A13000",
//     'DOB': '09/11/23',
//     "sex": 'female',
//     "colour": 'white',
//   },
//   {
//     'ID': "A12000",
//     'DOB': '08/10/23',
//     "sex": 'male',
//     "colour": 'black',
//   }
// ];
//   List<Map<String, dynamic>> data = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Container(
//           margin: const EdgeInsets.all(12),
//           height: 45,
//           decoration: BoxDecoration(
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.2),
//                 spreadRadius: 5,
//                 blurRadius: 7.0,
//               )
//             ],
//             color: Colors.white,
//             borderRadius: const BorderRadius.all(Radius.circular(8)),
//           ),
//           child: TextFormField(
//             onChanged: (val) {
//               setState(() {
//                 name = val;
//               });
//             },
//             cursorColor: Colors.black,
//             decoration: const InputDecoration(
//               suffixIcon: Icon(
//                 Icons.search,
//                 color: Colors.grey,
//               ),
//               border: InputBorder.none,
//               hintText: ' PhoneNumber...',
//             ),
//           ),
//         ),
//       ),
//       body: ScrollConfiguration(
//         behavior: const ScrollBehavior(),
//         child: ListView(padding: const EdgeInsets.only(top: 20), children: [
//           GestureDetector(
//             onTap: () {
//               Get.to(const Search());
//             },
//             child: ListView.builder(
//                 shrinkWrap: true,
//                 physics: const BouncingScrollPhysics(),
//                 itemCount: goatdata.length,
//                 itemBuilder: (context, index) {
//                   if (name.isEmpty) {
//                     return GestureDetector(
//                       onTap: () {},
//                       child: ListTile(
//                         leading:
//                             const Image(image: AssetImage("assets/mbudzi.jpg")),
//                         title: Text(
//                           goatdata[index]['ID'],
//                           maxLines: 1,
//                           softWrap: true,
//                           style: const TextStyle(
//                               color: Colors.black54,
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         subtitle: Text(
//                           goatdata[index]['DOB'],
//                           maxLines: 1,
//                           softWrap: true,
//                           style: const TextStyle(
//                               color: Colors.black54,
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         trailing: GestureDetector(
//                             onTap: () {
//                               Get.defaultDialog(
//                                 title: "Alert",
//                                 content: Text(
//                                     "Are you sure you want to delete livestock with ID:"),
//                                 actions: [
//                                   TextButton(
//                                     child: const Text("No"),
//                                     onPressed: () => Get.back(),
//                                   ),
//                                   TextButton(
//                                       child: const Text("Yes"),
//                                       onPressed: () {
//                                         Get.snackbar(
//                                           'check to your Animal list',
//                                           'Livestock with id  is Successfully Deleted',
//                                         );
//                                       }),
//                                 ],
//                               );
//                             },
//                             child: const Icon(Icons.delete)),
//                       ),
//                     );
//                   }
//                   if (goatdata[index]['ID']
//                       .toString()
//                       .toLowerCase()
//                       .startsWith(name.toLowerCase())) {
//                     return GestureDetector(
//                       onTap: () {},
//                       child: ListTile(
//                         leading:
//                             const Image(image: AssetImage("assets/mbudzi.jpg")),
//                         title: Text(
//                           goatdata[index]['ID'],
//                           maxLines: 1,
//                           softWrap: true,
//                           style: const TextStyle(
//                               color: Colors.black54,
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         subtitle: Text(
//                           goatdata[index]['DOB'],
//                           maxLines: 1,
//                           softWrap: true,
//                           style: const TextStyle(
//                               color: Colors.black54,
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         trailing: GestureDetector(
//                             onTap: () {
//                               Get.defaultDialog(
//                                 title: "Alert",
//                                 content: Text(
//                                     "Are you sure you want to delete livestock with ID:}"),
//                                 actions: [
//                                   TextButton(
//                                     child: const Text("No"),
//                                     onPressed: () => Get.back(),
//                                   ),
//                                   TextButton(
//                                       child: const Text("Yes"),
//                                       onPressed: () {}),
//                                 ],
//                               );
//                             },
//                             child: const Icon(Icons.delete)),
//                       ),
//                     );
//                   }
//                   return Container();
//                 }),
//           ),
//         ]),
//       ),
//       persistentFooterButtons: [
//         FloatingActionButton.extended(
//             backgroundColor: Colors.amber.shade100,
//             onPressed: () {
//               Get.to(const AddLiveStock());
//             },
//             label: const Text("Add livestock"))
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';

class GoatList extends StatefulWidget {
  @override
  State<GoatList> createState() => _GoatListState();
}

class _GoatListState extends State<GoatList> {
  String name = '';
  List<Map<String, dynamic>> goatData = [
    {
      'ID': "A1000",
      'DOB': '12/13/23',
      "sex": 'female',
      "colour": 'white',
    },
    {
      'ID': "A11000",
      'DOB': '12/14/23',
      "sex": 'male',
      "colour": 'black and white',
    },
    {
      'ID': "A13000",
      'DOB': '09/11/23',
      "sex": 'female',
      "colour": 'white',
    },
    {
      'ID': "A12000",
      'DOB': '08/10/23',
      "sex": 'male',
      "colour": 'black',
    }
  ];

  List<Map<String, dynamic>> filteredGoatData = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('All Goats'),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              TextFormField(
                onChanged: (val) {
                  setState(() {
                    name = val;
                    _filterGoats();
                  });
                },
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  hintText: 'PhoneNumber...',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
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

  void _filterGoats() {
    filteredGoatData = goatData
        .where((goat) =>
            goat['ID'].toLowerCase().contains(name.toLowerCase()) ||
            goat['ID'].toLowerCase().contains(name.toLowerCase()))
        .toList();
  }

  Widget _goatsList(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: ListView.builder(
        itemCount: filteredGoatData.length,
        itemBuilder: (BuildContext context, index) {
          dynamic goat = filteredGoatData[index];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: BeautifulCard(
              title: 'ID: ${goat['ID']}',
              description: 'SEX: ${goat['sex']}',
            ),
          );
        },
      ),
    );
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
                CircleAvatar(
                  backgroundImage: AssetImage("assets/mbudzi.jpg"),
                  radius: 40,
                ),
                Column(
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      description,
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                Icon(
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
