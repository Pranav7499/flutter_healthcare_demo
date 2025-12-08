import 'package:flutter/material.dart';

class CorporateBadgeCard extends StatefulWidget {
  final double size;
  final Color accentColor;

  const CorporateBadgeCard({
    super.key,
    this.size = 120,
    this.accentColor = const Color(0xFF3D5AFE), // deep blue
  });

  @override
  State<CorporateBadgeCard> createState() => _CorporateBadgeCardState();
}

class _CorporateBadgeCardState extends State<CorporateBadgeCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _tilt;
  late Animation<double> _shine;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _tilt = Tween(begin: -0.04, end: 0.04).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutQuad),
    );

    _shine = Tween(begin: -1.0, end: 2.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutExpo),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double badgeSize = widget.size;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: _tilt.value,
          child: Container(
            width: badgeSize,
            height: badgeSize * 0.75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: LinearGradient(
                colors: [
                  widget.accentColor.withOpacity(0.95),
                  widget.accentColor.withOpacity(0.7),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: widget.accentColor.withOpacity(0.4),
                  blurRadius: 25,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Stack(
              children: [
                // BADGE ICON
                Center(
                  child: Icon(
                    Icons.badge_rounded,
                    color: Colors.white,
                    size: badgeSize * 0.38,
                  ),
                ),

                // SCAN LINE OVERLAY
                Positioned.fill(
                  child: CustomPaint(
                    painter: _ShinePainter(_shine.value),
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

// SHINE EFFECT PAINTER
class _ShinePainter extends CustomPainter {
  final double position;

  _ShinePainter(this.position);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment(-1 + position, 0),
        end: Alignment(position, 0),
        colors: [
          Colors.white.withOpacity(0.0),
          Colors.white.withOpacity(0.25),
          Colors.white.withOpacity(0.0),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant _ShinePainter oldDelegate) {
    return oldDelegate.position != position;
  }
}
