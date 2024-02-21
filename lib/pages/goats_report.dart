import 'package:flutter/material.dart';

class GoatReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Goat Report'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildWeeklySummary('2024-02-10', '2024-02-16', '3 goats reported'),
            SizedBox(height: 16),
            _buildNotificationCard('2024-02-14', 'Goat 1 is injured'),
            _buildNotificationCard('2024-02-15', 'Goat 3 is pregnant'),
            // Add more notification cards as needed with different dates
          ],
        ),
      ),
    );
  }

  Widget _buildWeeklySummary(String startDate, String endDate, String summary) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Weekly Summary',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Date Range: $startDate to $endDate'),
            Text(summary),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationCard(String date, String notification) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Date: $date',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(notification),
          ],
        ),
      ),
    );
  }
}
