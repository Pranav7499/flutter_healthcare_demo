import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final String title;
  final double percent;

  const ProgressBar({
    super.key,
    required this.title,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title + percent right aligned
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "${(percent * 100).round()}%",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
          ],
        ),

        const SizedBox(height: 8),

        // Progress Bar
        LinearProgressIndicator(
          value: percent,
          minHeight: 8,
          borderRadius: BorderRadius.circular(10),
          backgroundColor: Colors.grey.shade300,
          color: Colors.blue,
        ),
      ],
    );
  }
}
