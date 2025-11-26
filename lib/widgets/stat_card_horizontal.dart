import 'package:flutter/material.dart';

class StatCardHorizontal extends StatelessWidget {
  final String title;
  final int count;
  final IconData icon;
  final Color iconColor;
  final double? width;

  const StatCardHorizontal({
    super.key,
    required this.title,
    required this.count,
    required this.icon,
    required this.iconColor,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width, // responsive width provided by parent
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16), // same as your screenshot
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.02),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ICON
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 18, color: iconColor), // exact same style
          ),

          const SizedBox(width: 10),

          // TITLE + COUNT
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15, // same text size
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                "$count",
                style: const TextStyle(
                  fontSize: 26, // same count size
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
