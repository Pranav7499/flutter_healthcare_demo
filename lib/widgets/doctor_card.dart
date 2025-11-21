import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final String name;
  final String email;
  final String location;
  final double rating;
  final int consultations;
  final double fee;
  final List<String> specialties;
  final bool verified;
  final VoidCallback onViewDetails;

  const DoctorCard({
    super.key,
    required this.name,
    required this.email,
    required this.location,
    required this.rating,
    required this.consultations,
    required this.fee,
    required this.specialties,
    required this.verified,
    required this.onViewDetails,
  });

  // Get initials (max 3 characters)
  String _getInitials(String name) {
    final parts = name.trim().split(" ");
    String initials = "";
    for (var part in parts) {
      if (part.isNotEmpty) initials += part[0];
      if (initials.length == 3) break;
    }
    return initials.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),

      // MAIN LAYOUT (ROW)
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center, // center vertically
        children: [
          
          Container(
            width: 52,
            height: 52,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFEFF1F3),
            ),
            alignment: Alignment.center,
            child: Text(
              _getInitials(name), // e.g., DRK
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.black87,
                fontSize: 16,
              ),
            ),
          ),

          const SizedBox(width: 16),

          
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // NAME + VERIFIED BADGE
                Row(
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(width: 6),
                    if (verified)
                      Container(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xFFD1FAE5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.check_circle,
                                color: Colors.green, size: 14),
                            SizedBox(width: 3),
                            Text(
                              "Verified",
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),

                const SizedBox(height: 4),

                Text(
                  email,
                  style:
                      const TextStyle(color: Colors.black54, fontSize: 13),
                ),

                const SizedBox(height: 6),

                
                Row(
                  children: [
                    Icon(Icons.location_on_outlined,
                        color: Colors.grey.shade700, size: 16),
                    Text(
                      " $location",
                      style:
                          TextStyle(color: Colors.grey.shade700, fontSize: 13),
                    ),
                    const SizedBox(width: 12),

                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    Text(
                      " $rating ($consultations consultations)",
                      style:
                          TextStyle(color: Colors.grey.shade700, fontSize: 13),
                    ),

                    const SizedBox(width: 12),

                    Text(
                      "₹$fee",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                
                Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  children: specialties
                      .map(
                        (specialty) => Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey.shade300),
                            color: Colors.grey.shade100,
                          ),
                          child: Text(
                            specialty,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600, // BOLD TAGS
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),

          
          const SizedBox(width: 12),

          Align(
            alignment: Alignment.centerRight,
            child: OutlinedButton(
              onPressed: onViewDetails,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFF2563EB), width: 1.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: const Text(
                "View Details",
                style: TextStyle(
                  color: Color(0xFF2563EB),
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
