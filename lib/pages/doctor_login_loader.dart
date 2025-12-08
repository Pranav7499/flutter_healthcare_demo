// doctor_login_loader.dart
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DoctorLoginLoader extends StatefulWidget {
  const DoctorLoginLoader({super.key});

  @override
  State<DoctorLoginLoader> createState() => _DoctorLoginLoaderState();
}

class _DoctorLoginLoaderState extends State<DoctorLoginLoader> {
  final String lottieAssetPath = 'assets/lottie/stethoscope_loading.json';

  @override
  void initState() {
    super.initState();
    _startLoadingAndNavigate();
  }

  void _startLoadingAndNavigate() async {
    // Wait for 4 seconds (customize this duration)
    await Future.delayed(const Duration(seconds: 4)); 

    if (mounted) {
      // Navigate to the Dashboard after the delay
      Navigator.of(context).pushReplacementNamed('/dashboard'); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              lottieAssetPath,
              width: 250,      
              height: 250,
              repeat: true,    
              animate: true,   
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 32),
            const Text(
              'Doctor Login: Verifying Credentials...',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.teal, 
              ),
            ),
          ],
        ),
      ),
    );
  }
}