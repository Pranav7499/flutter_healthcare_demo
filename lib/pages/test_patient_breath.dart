import 'package:flutter/material.dart';
import 'package:flutter_healthcare_demo/widgets/patient_breath_card.dart';

class TestPatientBreathPage extends StatelessWidget {
  const TestPatientBreathPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F8F6),
      body: Center(
        child: PatientBreathCard(
          size: 145,
          accentColor: const Color.fromARGB(255, 87, 111, 219), // medical green
        ),
      ),
    );
  }
}
