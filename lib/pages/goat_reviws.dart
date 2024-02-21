import 'package:flutter/material.dart';

class GoatOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Goat Overview'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, // Adjust the number of columns as needed
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          children: [
            _buildInfoCard('Total Goats', '150', Icons.group),
            _buildInfoCard('Average Age', '3 years', Icons.access_time),
            _buildInfoCard('Medical', '3 years', Icons.access_time),
            _buildInfoCard('Productivity', '3 years', Icons.access_time),
            _buildInfoCard('Critical Alerts', '3 years', Icons.access_time),
            // _buildSectionCard('Medical Records', _buildMedicalRecordsList(), Icons.local_hospital),
            // _buildSectionCard('Productivity Metrics', _buildProductivityMetricsList(), Icons.analytics),
            // _buildSectionCard('Upcoming Events', _buildUpcomingEventsList(), Icons.event),
            // _buildSectionCard('Critical Alerts', _buildCriticalAlertsList(), Icons.warning),
            // Add more cards as needed
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String value, IconData icon) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 40),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
