import 'package:flutter/material.dart';

class BouncingStethoscopeCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final Color accentColor;
  final double height;

  const BouncingStethoscopeCard({
    super.key,
    this.title = "Doctor Login",
    this.subtitle = "Access your daily schedule & patients",
    this.accentColor = const Color(0xFF2563EB), // blue
    this.height = 120,
  });

  @override
  State<BouncingStethoscopeCard> createState() =>
      _BouncingStethoscopeCardState();
}

class _BouncingStethoscopeCardState extends State<BouncingStethoscopeCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);

    _bounceAnimation = Tween<double>(
      begin: 0.0,
      end: -10.0, // how high it bounces
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutQuad,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      border: Border.all(color: Colors.grey.shade200),
      boxShadow: [
        BoxShadow(
          color: Colors.black12.withOpacity(0.04),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: _cardDecoration(),
      child: Row(
        children: [
          // LEFT: Texts
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF111827),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  widget.subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          // RIGHT: bouncing stethoscope
          AnimatedBuilder(
            animation: _bounceAnimation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _bounceAnimation.value),
                child: child,
              );
            },
            child: _buildStethoscopeCircle(),
          ),
        ],
      ),
    );
  }

  Widget _buildStethoscopeCircle() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: widget.accentColor.withOpacity(0.12),
      ),
      child: Center(
        child: Icon(
          Icons.medical_services_outlined, // acts as stethoscope-like icon
          size: 30,
          color: widget.accentColor,
        ),
      ),
    );
  }
}
