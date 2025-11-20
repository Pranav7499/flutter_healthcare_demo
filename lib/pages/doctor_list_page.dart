import 'package:flutter/material.dart';
import 'package:flutter_healthcare_demo/widgets/doctor_card.dart';

class DoctorListPage extends StatelessWidget {
  const DoctorListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        title: const Text("Doctors"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          DoctorCard(
            name: "Dr. Rajesh Kumar",
            email: "rajesh.kumar@healthcare.com",
            location: "Mumbai, Maharashtra",
            rating: 4.8,
            consultations: 1250,
            fee: 800,
            specialties: const [
              "Cardiology",
              "Internal Medicine",
            ],
            verified: true,
            onViewDetails: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("View Details clicked")),
              );
            },
          ),
        ],
      ),
    );
  }
}
