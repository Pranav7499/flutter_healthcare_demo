
import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoaderDemoScreen(),
    );
  }
}

class LoaderDemoScreen extends StatelessWidget {
  const LoaderDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,   // 👈 ONLY 2 Tabs Now
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Premium Healthcare Loaders'),
          backgroundColor: Colors.grey.shade900,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Doctor'),
              Tab(text: 'Patient'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: DoctorPremiumLoader()),
            Center(child: PatientShieldHeartAnimation()),
          ],
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////////
/// 1️⃣ PATIENT — YOUR ORIGINAL CODE
////////////////////////////////////////////////////////////

class PatientShieldHeartAnimation extends StatefulWidget {
  const PatientShieldHeartAnimation({super.key});

  @override
  State<PatientShieldHeartAnimation> createState() =>
      _PatientShieldHeartAnimationState();
}

class _PatientShieldHeartAnimationState
    extends State<PatientShieldHeartAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final scale = 1.0 + (_controller.value * 0.15);
            final fill = Curves.easeOutCubic.transform(_controller.value);

            return Transform.scale(
              scale: scale,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    Icons.health_and_safety,
                    size: 100,
                    color: Colors.pinkAccent.shade100,
                  ),
                  ClipPath(
                    clipper: _HeartRateClipper(fill: fill),
                    child: Icon(
                      Icons.favorite,
                      size: 70,
                      color: Colors.pinkAccent.shade400,
                    ),
                  ),
                  const Icon(Icons.favorite_border,
                      size: 70, color: Colors.white),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _HeartRateClipper extends CustomClipper<Path> {
  final double fill;
  _HeartRateClipper({required this.fill});

  @override
  Path getClip(Size size) {
    return Path()
      ..addRect(
        Rect.fromLTRB(
          0,
          size.height * (1.0 - fill),
          size.width,
          size.height,
        ),
      );
  }

  @override
  bool shouldReclip(_HeartRateClipper oldClipper) =>
      oldClipper.fill != fill;
}

////////////////////////////////////////////////////////////
/// 2️⃣ DOCTOR — ROTATING + GLOWING RING
////////////////////////////////////////////////////////////

class DoctorPremiumLoader extends StatefulWidget {
  const DoctorPremiumLoader({super.key});

  @override
  State<DoctorPremiumLoader> createState() => _DoctorPremiumLoaderState();
}

class _DoctorPremiumLoaderState extends State<DoctorPremiumLoader>
    with TickerProviderStateMixin {
  late AnimationController _rotate;
  late AnimationController _glow;

  @override
  void initState() {
    super.initState();

    _rotate = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    _glow = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _rotate.dispose();
    _glow.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final glowScale = 1 + (_glow.value * 0.08);

    return AnimatedBuilder(
      animation: _rotate,
      builder: (_, __) {
        return Transform.rotate(
          angle: _rotate.value * 2 * math.pi,
          child: Transform.scale(
            scale: glowScale,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.lightBlue.shade100.withOpacity(0.15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.lightBlue.shade300.withOpacity(0.5),
                        blurRadius: 24,
                        spreadRadius: 4,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.lightBlue.shade500,
                      width: 10,
                    ),
                  ),
                ),
                Icon(
                  Icons.local_hospital,
                  size: 52,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.lightBlue.shade600,
                      blurRadius: 16,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

