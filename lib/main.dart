import 'package:flutter/material.dart';
// import 'package:flutter_healthcare_demo/pages/auth_page.dart';
//import 'package:flutter_healthcare_demo/pages/doctor_list_page.dart';
import 'package:flutter_healthcare_demo/widgets/video_consultation_card.dart';
import 'package:flutter_healthcare_demo/utils/responsive.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Healthcare Platform',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const TestWidgetPage(),
 
      routes: {
        '/dashboard': (context) => const DashboardPage(),
      },
    );
  }
}


class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard")),
      body: const Center(child: Text("Welcome to the Dashboard!")),
    );
  }
}

class TestWidgetPage extends StatelessWidget {
  const TestWidgetPage({super.key});

  Widget _buildResponsiveCard(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 40, horizontal: 16),
                  child: MaxWidthContainer(
                    child: VideoConsultationCard(
                      onVideoCall: () {},
                      onAudioCall: () {},
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      body: _buildResponsiveCard(context),
    );
  }
}
