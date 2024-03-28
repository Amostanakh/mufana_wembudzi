import 'package:flutter/material.dart';
import 'package:mbudzi/config/configuring.dart';

class GoatDetailsScreen extends StatelessWidget {
  final String goatId;
  final String owner;
  final String gender;
  final String birthData;
  final String father;
  final String mother;
  final String weight;

  GoatDetailsScreen(
      {required this.goatId,
      required this.owner,
      required this.gender,
      required this.birthData,
      required this.father,
      required this.mother,
      required this.weight});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greenColor,
        title: Text('Goat Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/mbudzi.jpg'), // Replace with your actual image asset
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            SizedBox(height: 16),

            Container(
              width: double.infinity,
              child: DataTable(
                columns: [
                  DataColumn(label: Text('Attribute')),
                  DataColumn(label: Text('Value')),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('Goat ID')),
                    DataCell(Text(goatId)),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('BirthDate')),
                    DataCell(Text(birthData)),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Weight')),
                    DataCell(Text(weight)),
                  ]),

                  DataRow(cells: [
                    DataCell(Text('Mother')),
                    DataCell(Text(mother)),
                  ]),

                  DataRow(cells: [
                    DataCell(Text('Father')),
                    DataCell(Text(father)),
                  ]),

                  // Add more rows for additional details
                ],
              ),
            ),

            // Text(
            //   'Goat ID: $goatId',
            //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            // ),
            // SizedBox(height: 8),
            // Text(
            //   'Owner: $birthData',
            //   style: TextStyle(fontSize: 18),
            // ),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}
