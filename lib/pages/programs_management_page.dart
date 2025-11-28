// import 'package:flutter/material.dart';
// import 'package:flutter_healthcare_demo/utils/responsive.dart';
// import 'package:flutter_healthcare_demo/widgets/custom_header.dart';
// import 'package:flutter_healthcare_demo/widgets/custom_button.dart';
// import 'package:flutter_healthcare_demo/widgets/stat_card_horizontal.dart';
// import 'package:flutter_healthcare_demo/widgets/progress_bar.dart';

// class ProgramsManagementPage extends StatefulWidget {
//   const ProgramsManagementPage({super.key});

//   @override
//   State<ProgramsManagementPage> createState() => _ProgramsManagementPageState();
// }

// class _ProgramsManagementPageState extends State<ProgramsManagementPage> {
//   // Dropdown values
//   String selectedCategory = "All Categories";
//   String selectedStatus = "All Status";

//   @override
//   Widget build(BuildContext context) {
//     final bool isMobile = AppResponsive.isMobile(context);

//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F6FA),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(
//           horizontal: isMobile ? 16 : 28,
//           vertical: isMobile ? 16 : 26,
//         ),
//         child: MaxWidthContainer(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // PAGE HEADER
//               PageHeader(
//                 title: "Programs Management",
//                 button1Text: "Import Programs",
//                 button1OnPressed: () {},
//                 button2Text: "Create Program",
//                 button2Icon: Icons.add,
//                 button2OnPressed: () {},
//               ),

//               const SizedBox(height: 10),

//               _buildStatsRow(context),

//               const SizedBox(height: 25),

//               _buildFilters(context),

//               const SizedBox(height: 30),

//               _buildProgramCard(context),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // ============================================================
//   // TOP STATS ROW
//   // ============================================================
//   Widget _buildStatsRow(BuildContext context) {
//     final bool isMobile = AppResponsive.isMobile(context);

//     return Wrap(
//       spacing: 20,
//       runSpacing: 20,
//       children: [
//         StatCardHorizontal(
//           title: "Total Programs",
//           count: 5,
//           icon: Icons.blur_circular,
//           iconColor: Colors.blue,
//           width: isMobile ? double.infinity : 230,
//         ),
//         StatCardHorizontal(
//           title: "Active Programs",
//           count: 4,
//           icon: Icons.auto_graph,
//           iconColor: Colors.green,
//           width: isMobile ? double.infinity : 230,
//         ),
//         StatCardHorizontal(
//           title: "Total Enrollments",
//           count: 400,
//           icon: Icons.people_alt,
//           iconColor: Colors.purple,
//           width: isMobile ? double.infinity : 230,
//         ),
//         StatCardHorizontal(
//           title: "Avg Completion",
//           count: 54,
//           icon: Icons.trending_up,
//           iconColor: Colors.orange,
//           width: isMobile ? double.infinity : 230,
//         ),
//       ],
//     );
//   }

//   // ============================================================
//   // SEARCH + DROPDOWNS (FULLY RESPONSIVE — NO OVERFLOW)
//   // ============================================================
//   Widget _buildFilters(BuildContext context) {
//     final isMobile = AppResponsive.isMobile(context);

//     // MOBILE VIEW
//     if (isMobile) {
//       return Column(
//         children: [
//           TextField(
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: Colors.white,
//               prefixIcon: const Icon(Icons.search),
//               hintText:
//                   "Search programs by name, description, or instructor...",
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//             ),
//           ),
//           const SizedBox(height: 16),

//           Row(
//             children: [
//               Expanded(
//                 child: _dropdown(
//                   title: selectedCategory,
//                   items: const [
//                     "All Categories",
//                     "Fitness",
//                     "Mental Health",
//                     "Nutrition",
//                     "Preventive Care"
//                   ],
//                   onChanged: (v) => setState(() => selectedCategory = v!),
//                 ),
//               ),
//               const SizedBox(width: 16),
//               Expanded(
//                 child: _dropdown(
//                   title: selectedStatus,
//                   items: const ["All Status", "Active", "Inactive", "Draft"],
//                   onChanged: (v) => setState(() => selectedStatus = v!),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       );
//     }

//     // DESKTOP VIEW — Overflow-free
//     return Row(
//       children: [
//         Expanded(
//           flex: 2,
//           child: TextField(
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: Colors.white,
//               prefixIcon: const Icon(Icons.search),
//               hintText:
//                   "Search programs by name, description, or instructor...",
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//             ),
//           ),
//         ),

//         const SizedBox(width: 20),

//         Flexible(
//           child: _dropdown(
//             title: selectedCategory,
//             items: const [
//               "All Categories",
//               "Fitness",
//               "Mental Health",
//               "Nutrition",
//               "Preventive Care"
//             ],
//             onChanged: (v) => setState(() => selectedCategory = v!),
//           ),
//         ),

//         const SizedBox(width: 20),

//         Flexible(
//           child: _dropdown(
//             title: selectedStatus,
//             items: const ["All Status", "Active", "Inactive", "Draft"],
//             onChanged: (v) => setState(() => selectedStatus = v!),
//           ),
//         ),
//       ],
//     );
//   }

//   // Correct dropdown widget
//   Widget _dropdown({
//     required String title,
//     required List<String> items,
//     required ValueChanged<String?> onChanged,
//   }) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 14),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.grey.shade300),
//       ),
//       child: DropdownButtonHideUnderline(
//         child: DropdownButton(
//           isExpanded: true,
//           value: title,
//           items: items
//               .map((item) => DropdownMenuItem(value: item, child: Text(item)))
//               .toList(),
//           onChanged: onChanged,
//         ),
//       ),
//     );
//   }

//   // ============================================================
//   // PROGRAM CARD (PIXEL-PERFECT + RESPONSIVE)
//   // ============================================================
//   Widget _buildProgramCard(BuildContext context) {
//     final bool isMobile = AppResponsive.isMobile(context);

//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(25),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(18),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black12.withOpacity(0.06),
//             blurRadius: 10,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // TITLE + TAGS + BUTTONS
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // LEFT SIDE CONTENT
//               Expanded(
//                 child: Wrap(
//                   spacing: 12,
//                   runSpacing: 8,
//                   crossAxisAlignment: WrapCrossAlignment.center,
//                   children: [
//                     const Text(
//                       "Stress Management Workshop",
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.w700,
//                         color: Color(0xFF1B1B1B),
//                       ),
//                     ),
//                     _tag("Mental Health", const Color(0xFFE8D5F5)),
//                     _tag("Active", const Color(0xFFDFF5E1)),
//                   ],
//                 ),
//               ),

//               // DESKTOP BUTTONS (blue Duplicate & blue View Details)
//              if (!isMobile)
//   Row(
//     mainAxisSize: MainAxisSize.min,
//     children: [
//       SizedBox(
//         width: 150,
//         height: 44,
//         child: CustomButton(
//           text: "Duplicate",
//           onPressed: () {},
//         ),
//       ),

//       const SizedBox(width: 12),

//       SizedBox(
//         width: 150,
//         height: 44,
//         child: CustomButton(
//           text: "View Details",
//           onPressed: () {},
//         ),
//       ),
//     ],
//   ),

//             ],
//           ),

//           const SizedBox(height: 10),

//           const Text(
//             "Learn effective techniques to manage workplace stress and improve mental well-being.",
//             style: TextStyle(fontSize: 15, color: Colors.black87),
//           ),

//           const SizedBox(height: 25),

//           Wrap(
//             spacing: 40,
//             runSpacing: 20,
//             children: const [
//               _InfoItem(title: "Instructor", value: "Dr. Sarah Johnson"),
//               _InfoItem(title: "Duration", value: "1/15/2024 - 3/15/2024"),
//               _InfoItem(title: "Enrollment", value: "45/50"),
//               _InfoItem(title: "Cost", value: "₹5,000"),
//             ],
//           ),

//           const SizedBox(height: 28),

//           const ProgressBar(title: "Enrollment Progress", percent: 0.90),
//           const SizedBox(height: 24),
//           const ProgressBar(title: "Completion Rate", percent: 0.78),

//           // MOBILE BUTTONS (blue Duplicate & blue View Details)
//           if (isMobile) ...[
//   const SizedBox(height: 25),

//   SizedBox(
//     width: double.infinity,
//     child: CustomButton(
//       text: "Duplicate",
//       onPressed: () {},
//     ),
//   ),

//   const SizedBox(height: 14),

//   SizedBox(
//     width: double.infinity,
//     child: CustomButton(
//       text: "View Details",
//       onPressed: () {}),
//   ),
// ]

//         ],
//       ),
//     );
//   }

//   // PERFECT TAG DESIGN
//   Widget _tag(String text, Color bg) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [
//             bg.withOpacity(0.9),
//             bg.withOpacity(0.7),
//           ],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black12.withOpacity(0.08),
//             blurRadius: 6,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Text(
//         text,
//         style: const TextStyle(
//           fontWeight: FontWeight.w500,
//           fontSize: 14,
//           color: Color(0xFF4A4A4A),
//         ),
//       ),
//     );
//   }
// }

// // ============================================================
// // INFO ITEM
// // ============================================================
// class _InfoItem extends StatelessWidget {
//   final String title;
//   final String value;

//   const _InfoItem({required this.title, required this.value});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 160,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(title, style: const TextStyle(color: Colors.grey, fontSize: 14)),
//           const SizedBox(height: 4),
//           Text(
//             value,
//             style: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_healthcare_demo/utils/responsive.dart';
import 'package:flutter_healthcare_demo/widgets/custom_header.dart';
import 'package:flutter_healthcare_demo/widgets/custom_button.dart';
import 'package:flutter_healthcare_demo/widgets/stat_card_horizontal.dart';
import 'package:flutter_healthcare_demo/widgets/progress_bar.dart';

class ProgramsManagementPage extends StatefulWidget {
  const ProgramsManagementPage({super.key});

  @override
  State<ProgramsManagementPage> createState() =>
      _ProgramsManagementPageState();
}

class _ProgramsManagementPageState
    extends State<ProgramsManagementPage> {
  // Dropdown values
  String selectedCategory = "All Categories";
  String selectedStatus = "All Status";

  @override
  Widget build(BuildContext context) {
    final bool isMobile = AppResponsive.isMobile(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 16 : 28,
          vertical: isMobile ? 16 : 26,
        ),
        child: MaxWidthContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),

              const SizedBox(height: 10),

              _buildStatsRow(context),

              const SizedBox(height: 25),

              _buildFilters(context),

              const SizedBox(height: 30),

              _buildProgramCard(context),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // HEADER (With Wrap Fix)
  // ============================================================
  Widget _buildHeader(BuildContext context) {
    return PageHeader(
      title: "Programs Management",
      // we manually override desktop behaviour using wrap
      button1Text: "Import Programs",
      button1OnPressed: () {},
      button2Text: "Create Program",
      button2Icon: Icons.add,
      button2OnPressed: () {},
      // wrap will prevent overflow
      padding: const EdgeInsets.only(bottom: 20),
    );
  }

  // ============================================================
  // TOP STATS ROW
  // ============================================================
  Widget _buildStatsRow(BuildContext context) {
    final bool isMobile = AppResponsive.isMobile(context);

    return Wrap(
      spacing: 20,
      runSpacing: 20,
      children: [
        StatCardHorizontal(
          title: "Total Programs",
          count: 5,
          icon: Icons.blur_circular,
          iconColor: Colors.blue,
          width: isMobile ? double.infinity : 230,
        ),
        StatCardHorizontal(
          title: "Active Programs",
          count: 4,
          icon: Icons.auto_graph,
          iconColor: Colors.green,
          width: isMobile ? double.infinity : 230,
        ),
        StatCardHorizontal(
          title: "Total Enrollments",
          count: 400,
          icon: Icons.people_alt,
          iconColor: Colors.purple,
          width: isMobile ? double.infinity : 230,
        ),
        StatCardHorizontal(
          title: "Avg Completion",
          count: 54,
          icon: Icons.trending_up,
          iconColor: Colors.orange,
          width: isMobile ? double.infinity : 230,
        ),
      ],
    );
  }

  // ============================================================
  // SEARCH + DROPDOWNS (Search box LONGER!)
  // ============================================================
  Widget _buildFilters(BuildContext context) {
    final isMobile = AppResponsive.isMobile(context);

    // MOBILE LAYOUT
    if (isMobile) {
      return Column(
        children: [
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              prefixIcon: const Icon(Icons.search),
              hintText:
                  "Search programs by name, description, or instructor...",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: _dropdown(
                  title: selectedCategory,
                  items: const [
                    "All Categories",
                    "Fitness",
                    "Mental Health",
                    "Nutrition",
                    "Preventive Care"
                  ],
                  onChanged: (v) =>
                      setState(() => selectedCategory = v!),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _dropdown(
                  title: selectedStatus,
                  items: const [
                    "All Status",
                    "Active",
                    "Inactive",
                    "Draft"
                  ],
                  onChanged: (v) =>
                      setState(() => selectedStatus = v!),
                ),
              ),
            ],
          ),
        ],
      );
    }

    // DESKTOP LAYOUT (SEARCH LONGER VIA FLEX: 2)
    return Row(
      children: [
        Expanded(
          flex: 3, // 🔥 search bar is now longer
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              prefixIcon: const Icon(Icons.search),
              hintText:
                  "Search programs by name, description, or instructor...",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),

        const SizedBox(width: 20),

        Flexible(
          child: _dropdown(
            title: selectedCategory,
            items: const [
              "All Categories",
              "Fitness",
              "Mental Health",
              "Nutrition",
              "Preventive Care"
            ],
            onChanged: (v) =>
                setState(() => selectedCategory = v!),
          ),
        ),

        const SizedBox(width: 20),

        Flexible(
          child: _dropdown(
            title: selectedStatus,
            items: const [
              "All Status",
              "Active",
              "Inactive",
              "Draft"
            ],
            onChanged: (v) =>
                setState(() => selectedStatus = v!),
          ),
        ),
      ],
    );
  }

  // Dropdown Builder
  Widget _dropdown({
    required String title,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          isExpanded: true,
          value: title,
          items: items
              .map((item) =>
                  DropdownMenuItem(value: item, child: Text(item)))
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  // ============================================================
  // PROGRAM CARD (Blue Duplicate + Blue View Details)
  // ============================================================
  Widget _buildProgramCard(BuildContext context) {
    final bool isMobile = AppResponsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.06),
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
              Expanded(
                child: Wrap(
                  spacing: 12,
                  runSpacing: 8,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Text(
                      "Stress Management Workshop",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1B1B1B),
                      ),
                    ),
                    _tag("Mental Health", const Color(0xFFE8D5F5)),
                    _tag("Active", const Color(0xFFDFF5E1)),
                  ],
                ),
              ),

              // DESKTOP BUTTONS
              if (!isMobile)
                Wrap(
                  spacing: 12,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 44,
                      child: CustomButton(
                        text: "Duplicate",
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      height: 44,
                      child: CustomButton(
                        text: "View Details",
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
            ],
          ),

          const SizedBox(height: 10),

          const Text(
            "Learn effective techniques to manage workplace stress and improve mental well-being.",
            style:
                TextStyle(fontSize: 15, color: Colors.black87),
          ),

          const SizedBox(height: 25),

          Wrap(
            spacing: 40,
            runSpacing: 20,
            children: const [
              _InfoItem(title: "Instructor", value: "Dr. Sarah Johnson"),
              _InfoItem(title: "Duration", value: "1/15/2024 - 3/15/2024"),
              _InfoItem(title: "Enrollment", value: "45/50"),
              _InfoItem(title: "Cost", value: "₹5,000"),
            ],
          ),

          const SizedBox(height: 28),

          const ProgressBar(
              title: "Enrollment Progress", percent: 0.90),
          const SizedBox(height: 24),
          const ProgressBar(
              title: "Completion Rate", percent: 0.78),

          // MOBILE BUTTONS
          if (isMobile) ...[
            const SizedBox(height: 25),
            CustomButton(text: "Duplicate", onPressed: () {}),
            const SizedBox(height: 14),
            CustomButton(text: "View Details", onPressed: () {}),
          ],
        ],
      ),
    );
  }

  // TAG WIDGET
  Widget _tag(String text, Color bg) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            bg.withOpacity(0.9),
            bg.withOpacity(0.7),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.08),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: Color(0xFF4A4A4A),
        ),
      ),
    );
  }
}

// ============================================================
// INFO ITEM
// ============================================================
class _InfoItem extends StatelessWidget {
  final String title;
  final String value;

  const _InfoItem({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  color: Colors.grey, fontSize: 14)),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
