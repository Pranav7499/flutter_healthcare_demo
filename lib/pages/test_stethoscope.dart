import 'package:flutter/material.dart';
import 'package:flutter_healthcare_demo/widgets/advanced_stethoscope.dart';

class TestStethoscopePage extends StatelessWidget {
  const TestStethoscopePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // makes glow more beautiful
      body: Center(
        child: AdvancedStethoscopeAnimation(
          color: const Color(0xFF2563EB),
        ),
      ),
    );
  }
}
