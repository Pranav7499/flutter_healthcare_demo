import 'package:flutter/material.dart';

class AdvancedStethoscopeAnimation extends StatefulWidget {
  final Color color;
  const AdvancedStethoscopeAnimation({
    super.key,
    this.color = const Color(0xFF2563EB),
  });

  @override
  State<AdvancedStethoscopeAnimation> createState() =>
      _AdvancedStethoscopeAnimationState();
}

class _AdvancedStethoscopeAnimationState
    extends State<AdvancedStethoscopeAnimation>
    with TickerProviderStateMixin {
  late AnimationController bounceController;
  late AnimationController rotateController;
  late AnimationController pulseController;
  late AnimationController clickController;

  late Animation<double> bounce;
  late Animation<double> rotation;
  late Animation<double> pulse;
  late Animation<double> clickScale;

  @override
  void initState() {
    super.initState();

    bounceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);

    rotateController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2600),
    )..repeat();

    pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat();

    clickController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 180),
      lowerBound: 0.9,
      upperBound: 1.0,
    );

    bounce = Tween<double>(begin: 0, end: -12).animate(
      CurvedAnimation(parent: bounceController, curve: Curves.easeInOutQuad),
    );

    rotation = Tween<double>(begin: -0.04, end: 0.04).animate(
      CurvedAnimation(parent: rotateController, curve: Curves.easeInOut),
    );

    pulse = Tween<double>(begin: 0, end: 12).animate(
      CurvedAnimation(parent: pulseController, curve: Curves.easeOut),
    );

    clickScale = clickController;
  }

  @override
  void dispose() {
    bounceController.dispose();
    rotateController.dispose();
    pulseController.dispose();
    clickController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => clickController.reverse(),
      onTapUp: (_) => clickController.forward(),
      onTapCancel: () => clickController.forward(),

      child: AnimatedBuilder(
        animation: Listenable.merge([
          bounceController,
          rotateController,
          pulseController,
          clickController,
        ]),
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, bounce.value),
            child: Transform.rotate(
              angle: rotation.value,
              child: Transform.scale(
                scale: clickScale.value,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // 🌟 RADIAL RIPPLE PULSE EFFECT
                    Container(
                      width: 95 + pulse.value,
                      height: 95 + pulse.value,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: widget.color.withOpacity(0.18 * (1 - pulse.value / 12)),
                      ),
                    ),

                    // 🌟 GLOW SHADOW EFFECT
                    Container(
                      width: 95,
                      height: 95,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: widget.color.withOpacity(0.55),
                            blurRadius: 28,
                            spreadRadius: 4,
                          ),
                        ],
                      ),
                    ),

                    // 🌟 MAIN CIRCLE
                    Container(
                      width: 95,
                      height: 95,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            widget.color.withOpacity(0.75),
                            widget.color.withOpacity(0.45),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.medical_services_outlined,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
