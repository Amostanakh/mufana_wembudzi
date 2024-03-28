import 'package:flutter/material.dart';
import 'package:mbudzi/config/configuring.dart';

class TopicDetailScreen extends StatelessWidget {
  final String topic;

  TopicDetailScreen({required this.topic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greenColor,
        title: Text(topic),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Overview of $topic',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Detailed information about $topic will be displayed here. '
              'You can provide a comprehensive overview with bullet points:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            // Example list of points
            PointListItem(text: 'Point 1: ...'),
            PointListItem(text: 'Point 2: ...'),
            PointListItem(text: 'Point 3: ...'),
            // Add more points as needed
          ],
        ),
      ),
    );
  }
}

class PointListItem extends StatelessWidget {
  final String text;

  PointListItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.arrow_forward,
            size: 20,
            color: Colors.green,
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(text, style: TextStyle(fontSize: 18)),
          ),
        ],
      ),
    );
  }
}
