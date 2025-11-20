import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Doctor Dashboard"),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(
            elevation: 4,
            child: ListTile(
              leading: Icon(Icons.person, color: Colors.teal),
              title: Text("Dr. Pranav Bodke"),
              subtitle: Text("MBBS | General Physician"),
            ),
          ),
          Card(
            elevation: 4,
            child: ListTile(
              leading: Icon(Icons.calendar_month, color: Colors.teal),
              title: Text("Appointments Today"),
              subtitle: Text("12 Patients"),
            ),
          ),
          Card(
            elevation: 4,
            child: ListTile(
              leading: Icon(Icons.bar_chart, color: Colors.teal),
              title: Text("Earnings"),
              subtitle: Text("₹4,500 this week"),
            ),
          ),
        ],
      ),
    );
  }
}
