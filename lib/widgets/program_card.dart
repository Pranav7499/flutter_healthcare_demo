import 'package:flutter/material.dart';

class ProgramCard extends StatelessWidget {
  final String title;
  final String category;
  final String status;
  final String description;

  final String instructor;
  final String duration;
  final String enrollment;

  final int enrollmentPercent;
  final int completionPercent;

  const ProgramCard({
    super.key,
    required this.title,
    required this.category,
    required this.status,
    required this.description,
    required this.instructor,
    required this.duration,
    required this.enrollment,
    required this.enrollmentPercent,
    required this.completionPercent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 14),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // TITLE + TAGS + BUTTONS
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // LEFT SIDE TITLE + TAGS
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        _buildTag(category, const Color(0xFFEDE9FE), const Color(0xFF7C3AED)),
                        const SizedBox(width: 10),
                        _buildTag(status, const Color(0xFFD1FAE5), const Color(0xFF059669)),
                      ],
                    ),
                  ],
                ),
              ),

              // RIGHT SIDE BUTTONS
              Row(
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    child: const Text("Duplicate"),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.visibility_outlined, size: 18),
                    label: const Text("View Details"),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      backgroundColor: const Color(0xFF1E88E5),
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 16),

          Text(
            description,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey.shade700,
            ),
          ),

          const SizedBox(height: 22),

          // INFO GRID
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _infoColumn("Instructor", instructor),
              _infoColumn("Duration", duration),
              _infoColumn("Enrollment", enrollment),
              _infoColumn("Cost", "₹5,000"),
            ],
          ),

          const SizedBox(height: 28),

          _progressSection("Enrollment Progress", enrollmentPercent),
          const SizedBox(height: 18),
          _progressSection("Completion Rate", completionPercent),
        ],
      ),
    );
  }

  // TAG UI
  Widget _buildTag(String text, Color bg, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // GRID INFO
  Widget _infoColumn(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }

  // PROGRESS BAR WITH %
  Widget _progressSection(String title, int percent) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: const TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 15)),
            Text(
              "$percent%",
              style: const TextStyle(
                  fontWeight: FontWeight.w600, fontSize: 15),
            ),
          ],
        ),
        const SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            minHeight: 8,
            value: percent / 100,
            backgroundColor: Colors.grey.shade300,
            valueColor: const AlwaysStoppedAnimation(Color(0xFF1E88E5)),
          ),
        ),
      ],
    );
  }
}
