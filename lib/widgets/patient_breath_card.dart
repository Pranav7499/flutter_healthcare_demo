import 'package:flutter/material.dart';

class PatientBreathCard extends StatefulWidget {
  final double size;
  final Color accentColor;

  const PatientBreathCard({
    super.key,
    this.size = 120,
    this.accentColor = const Color(0xFF22B07D),
  });

  @override
  State<PatientBreathCard> createState() => _PatientBreathCardState();
}

class _PatientBreathCardState extends State<PatientBreathCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _breathAnimation;
  late Animation<double> _heartPulse;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    // body breathing expansion
    _breathAnimation = Tween(begin: 1.0, end: 1.12).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // heart dot pulse
    _heartPulse = Tween(begin: 0.4, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubic),
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
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _breathAnimation.value,
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              color: widget.accentColor,
              borderRadius: BorderRadius.circular(widget.size * 0.28),
              boxShadow: [
                BoxShadow(
                  color: widget.accentColor.withOpacity(0.35),
                  blurRadius: 20,
                  spreadRadius: 2,
                )
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // patient silhouette
                Icon(
                  Icons.person_rounded,
                  size: widget.size * 0.55,
                  color: Colors.white,
                ),

                // heart pulse dot on chest
                Positioned(
                  bottom: widget.size * 0.23,
                  child: Opacity(
                    opacity: _heartPulse.value,
                    child: Container(
                      width: widget.size * 0.11,
                      height: widget.size * 0.11,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.85),
                            blurRadius: 12,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
