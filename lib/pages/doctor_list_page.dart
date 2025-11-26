import 'package:flutter/material.dart';
import 'package:flutter_healthcare_demo/widgets/doctor_card.dart';

class DoctorListPage extends StatelessWidget {
  const DoctorListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFF7F9FC), // same background as before
      child: Column(
        children: [
          // ---------------- APPBAR REPLACEMENT ----------------
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: kToolbarHeight,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            alignment: Alignment.centerLeft,
            child: const Text(
              "Doctors",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),

          // ---------------- LIST AREA ----------------
          Expanded(
            child: ListView(
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
          ),
        ],
      ),
    );
  }
}
