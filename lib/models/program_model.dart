class ProgramModel {
  final String title;
  final String category; // e.g., “Mental Health”
  final String status; // e.g., “Active”, “Draft”, “Archived”
  final int enrolled; // e.g., 45
  final int capacity; // e.g., 50
  final int completionRate; // percentage 0 - 100
  final String instructor;
  final String duration; // like “6 weeks”
  final String cost; // like “₹2999”

  ProgramModel({
    required this.title,
    required this.category,
    required this.status,
    required this.enrolled,
    required this.capacity,
    required this.completionRate,
    required this.instructor,
    required this.duration,
    required this.cost,
  });

  double get enrollmentProgress => enrolled / capacity; // 0.0–1.0
  double get completionProgress => completionRate / 100; // 0.0–1.0
}
