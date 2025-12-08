import 'package:flutter/material.dart';
import '../widgets/healthcare_loaders.dart';

class LoaderPreviewPage extends StatelessWidget {
  const LoaderPreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Premium Healthcare Loaders'),
          backgroundColor: Colors.grey.shade900,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Doctor'),
              Tab(text: 'Patient'),
              //Tab(text: 'Corporate'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: DoctorPremiumLoader()),
            Center(child: PatientShieldHeartAnimation()),
            //Center(child: CorporatePremiumLoader()),
          ],
        ),
      ),
    );
  }
}
