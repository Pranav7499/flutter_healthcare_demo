import 'package:flutter/material.dart';
import 'package:flutter_healthcare_demo/widgets/heartbeat_banner.dart';

void main() => runApp(const TestApp());

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: const Center(
          child: HeartbeatBanner(),
        ),
      ),
    );
  }
}
