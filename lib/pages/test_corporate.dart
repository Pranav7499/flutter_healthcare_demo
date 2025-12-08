import 'package:flutter/material.dart';
import 'package:flutter_healthcare_demo/widgets/corporate_badge_card.dart';

class TestCorporatePage extends StatelessWidget {
  const TestCorporatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F9),
      body: Center(
        child: CorporateBadgeCard(
          size: 140,
          accentColor: const Color(0xFF3D5AFE), // enterprise blue
        ),
      ),
    );
  }
}
