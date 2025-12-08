import 'package:flutter/material.dart';

class BouncingStethoscope extends StatefulWidget {
  final Color accentColor;
  const BouncingStethoscope({
    super.key,
    this.accentColor = const Color(0xFF2563EB),
  });

  @override
  State<BouncingStethoscope> createState() => _BouncingStethoscopeState();
}

class _BouncingStethoscopeState extends State<BouncingStethoscope>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _bounce;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);

    _bounce = Tween<double>(begin: 0, end: -12).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutQuad),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _bounce,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _bounce.value),
          child: child,
        );
      },
      child: Container(
        width: 95,
        height: 95,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widget.accentColor.withOpacity(0.15),
        ),
        child: Center(
          child: Icon(
            Icons.medical_services_outlined,
            color: widget.accentColor,
            size: 52,
          ),
        ),
      ),
    );
  }
}
