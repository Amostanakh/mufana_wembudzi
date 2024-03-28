import 'package:flutter/material.dart';
import 'package:mbudzi/config/configuring.dart';

class Vaccines extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Goats Vaccinations',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: greenColor,
          actions: [
            IconButton(
              icon: Icon(Icons.add, color: Colors.white),
              onPressed: () {
                // Handle "Add Dose" button press (navigation, dialog, etc.)
              },
            ),
          ],
        ),
        body: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Next vaccination',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF212121),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Injectable vaccine',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Color(0xFF212121),
                        ),
                      ),
                      Text(
                        '4 Apr 2023',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Color(0xFF212121),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Set reminder'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: greenColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('View details'),
                        style: TextButton.styleFrom(
                          foregroundColor: greenColor,
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Upcoming vaccinations',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF212121),
              ),
            ),
            SizedBox(height: 8.0),
            ListTile(
              title: Text(
                'OPV (Oral Polio Vaccine) Second Dose',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Color(0xFF212121),
                ),
              ),
              subtitle: Text(
                'Due 10 Apr 2021',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Color(0xFF9E9E9E),
                ),
              ),
            ),
            ListTile(
              title: Text(
                'OPV (Oral Polio Vaccine) Second Dose',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Color(0xFF212121),
                ),
              ),
              subtitle: Text(
                'Due 10 Apr 2021',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Color(0xFF9E9E9E),
                ),
              ),
            ),
            ListTile(
              title: Text(
                'OPV (Oral Polio Vaccine) Second Dose',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Color(0xFF212121),
                ),
              ),
              subtitle: Text(
                'Due 10 Apr 2021',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Color(0xFF9E9E9E),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // "Vaccine History" section
                Text(
                  'Vaccine History',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF212121), // Dark gray color from text
                  ),
                ),
                SizedBox(height: 16.0), // Spacing from the image

                // Vaccination list items
                ListTile(
                  title: Text(
                    'OPV (Oral Polio Vaccine) First Dose',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color(0xFF212121), // Dark gray color from text
                    ),
                  ),
                  subtitle: Text(
                    '12 March 2021',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Color(0xFF9E9E9E), // Light gray color from text
                    ),
                  ),
                  trailing: Icon(
                    Icons.check,
                    color: greenColor, // Light gray color from arrow
                    size: 16.0,
                  ),
                ),
                ListTile(
                  title: Text(
                    'PCV (Pneumococcal Conjugate Vaccine)',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color(0xFF212121), // Dark gray color from text
                    ),
                  ),
                  subtitle: Text(
                    '12 March 2021',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Color(0xFF9E9E9E), // Light gray color from text
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF9E9E9E), // Light gray color from arrow
                    size: 16.0,
                  ),
                ),
                ListTile(
                  title: Text(
                    '[Missed] Rotavirus vaccine',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color(0xFF212121), // Dark gray color from text
                    ),
                  ),
                  subtitle: Text(
                    'Due 8 February 2023',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Color(0xFF9E9E9E), // Light gray color from text
                    ),
                  ),
                  trailing: Icon(
                    Icons.close,
                    color: Colors.red, // Light gray color from arrow
                    size: 16.0,
                  ),
                ),
                SizedBox(height: 16.0), // Spacing from the image

                // "View all" button
                TextButton(
                  onPressed: () {}, // Handle "View all" button press
                  child: Text(
                    'View all',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey, // Blue color from button
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
