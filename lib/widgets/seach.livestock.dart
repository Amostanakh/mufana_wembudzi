import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../config/configuring.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String name = "";
  List<Map<String, dynamic>> data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScrollConfiguration(
      behavior: const ScrollBehavior(),
      child: ListView(children: [
        Container(
          margin: const EdgeInsets.all(12),
          height: 45,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7.0,
              )
            ],
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: TextFormField(
            onChanged: (val) {
              setState(() {
                name = val;
              });
            },
            cursorColor: Colors.black,
            decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                border: InputBorder.none,
                hintText: 'Start typing...'),
          ),
        ),
        GestureDetector(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(kUser.value?.uid)
                .collection('myLivestocks')
                .snapshots(),
            builder: (context, snapshots) {
              return (snapshots.connectionState == ConnectionState.waiting)
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: snapshots.data!.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot livestock =
                            snapshots.data!.docs[index];

                        if (name.isEmpty) {
                          return GestureDetector(
                            child: ListTile(
                              leading: const Image(
                                  image: AssetImage("assets/cow3.png")),
                              title: Text(
                                livestock['PhoneNmuber'],
                                maxLines: 1,
                                softWrap: true,
                                style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              trailing: Text(
                                livestock['Date Of Birth'],
                                maxLines: 1,
                                softWrap: true,
                                style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          );
                        }
                        if (livestock['book']
                            .toString()
                            .toLowerCase()
                            .startsWith(name.toLowerCase())) {
                          return GestureDetector(
                            child: ListTile(
                              leading: const Image(
                                  image: AssetImage("assets/cow3.png")),
                              title: Text(
                                livestock['PhoneNmuber'],
                                maxLines: 1,
                                softWrap: true,
                                style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              trailing: Text(
                                livestock['Date Of Birth'],
                                maxLines: 1,
                                softWrap: true,
                                style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          );
                        }
                        return Container();
                      });
            },
          ),
        ),
      ]),
    ));
  }
}
