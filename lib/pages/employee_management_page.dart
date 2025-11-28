

import 'package:flutter/material.dart';
import '../widgets/custom_header.dart';
import '../widgets/stat_card_horizontal.dart';
import '../widgets/custom_button.dart';

class EmployeeManagementPage extends StatefulWidget {
  const EmployeeManagementPage({super.key});

  @override
  State<EmployeeManagementPage> createState() =>
      _EmployeeManagementPageState();
}

class _EmployeeManagementPageState extends State<EmployeeManagementPage> {
  final TextEditingController searchController = TextEditingController();
  String selectedDepartment = "All Departments";

  final List<String> departments = [
    "All Departments",
    "Engineering",
    "HR",
    "Marketing",
    "Finance",
  ];

  int totalEmployees = 5;
  int activeEmployees = 4;
  int avgHealthScore = 74;
  int programEnrollments = 13;

  @override
  Widget build(BuildContext context) {
    const double maxWidth = 1100;

    return Material(
      color: Colors.transparent,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 28),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: maxWidth),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ------------------------------------------------
                // HEADER (Desktop / Tablet / Mobile)
                // ------------------------------------------------
                LayoutBuilder(
                  builder: (context, constraints) {
                    final double w = constraints.maxWidth;
                    final bool isMobile = w < 480;

                    if (isMobile) {
                      // ---------- MOBILE STACKED HEADER ----------
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Employee Management",
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.w700),
                          ),

                          const SizedBox(height: 14),

                          // BLUE Export Report
                          CustomButton(
                            text: "Export Report",
                            icon: Icons.download_outlined,
                            onPressed: () {},
                            height: 45,
                          ),

                          const SizedBox(height: 10),

                          // BLUE Add Employee
                          CustomButton(
                            text: "Add Employee",
                            icon: Icons.person_add_alt_1,
                            onPressed: () {},
                            height: 45,
                          ),

                          const SizedBox(height: 24),
                        ],
                      );
                    }

                    // ---------- DESKTOP HEADER ----------
                    return PageHeader(
                      title: "Employee Management",
                      subtitle: "",
                      button1Icon: Icons.download_outlined,
                      button1Text: "Export Report",
                      button1OnPressed: () {},

                      button2Icon: Icons.person_add_alt_1,
                      button2Text: "Add Employee",
                      button2OnPressed: () {},

                      padding: const EdgeInsets.only(bottom: 30),
                    );
                  },
                ),

                const SizedBox(height: 10),

                // ------------------------------------------------
                // STAT CARDS
                // ------------------------------------------------
                LayoutBuilder(
                  builder: (context, constraints) {
                    final double width = constraints.maxWidth;
                    const double spacing = 20;
                    const double minCard = 220;

                    int cols = (width / (minCard + spacing)).floor();
                    if (cols < 1) cols = 1;
                    if (cols > 4) cols = 4;

                    double cardWidth =
                        (width - spacing * (cols - 1)) / cols;

                    return Wrap(
                      spacing: spacing,
                      runSpacing: spacing,
                      children: [
                        StatCardHorizontal(
                          title: "Total Employees",
                          count: totalEmployees,
                          icon: Icons.groups_2_outlined,
                          iconColor: Colors.blue,
                          width: cardWidth,
                        ),
                        StatCardHorizontal(
                          title: "Active",
                          count: activeEmployees,
                          icon: Icons.monitor_heart_outlined,
                          iconColor: Colors.green,
                          width: cardWidth,
                        ),
                        StatCardHorizontal(
                          title: "Avg Health Score",
                          count: avgHealthScore,
                          icon: Icons.favorite_border_outlined,
                          iconColor: Colors.red,
                          width: cardWidth,
                        ),
                        StatCardHorizontal(
                          title: "Program Enrollments",
                          count: programEnrollments,
                          icon: Icons.show_chart_rounded,
                          iconColor: Colors.deepPurple,
                          width: cardWidth,
                        ),
                      ],
                    );
                  },
                ),

                const SizedBox(height: 28),

                // ------------------------------------------------
                // SEARCH + DROPDOWN
                // ------------------------------------------------
                LayoutBuilder(builder: (context, c) {
                  final double w = c.maxWidth;

                  if (w > 420) {
                    return Row(
                      children: [
                        Expanded(child: _searchBox()),
                        const SizedBox(width: 12),
                        SizedBox(
                          width: 170,
                          child: _departmentDropdown(),
                        ),
                      ],
                    );
                  }

                  // Mobile stacked
                  return Column(
                    children: [
                      _searchBox(),
                      const SizedBox(height: 12),
                      _departmentDropdown(),
                    ],
                  );
                }),

                const SizedBox(height: 26),

                // ------------------------------------------------
                // EMPLOYEE LIST
                // ------------------------------------------------
                _employeeCard(
                  initials: "RS",
                  name: "Rahul Sharma",
                  email: "rahul.sharma@techcorp.com",
                  department: "Engineering - Senior Developer",
                  healthScore: 85,
                  programs: 3,
                  lastCheckup: "1/10/2024",
                ),

                const SizedBox(height: 16),

                _employeeCard(
                  initials: "PP",
                  name: "Priya Patel",
                  email: "priya.patel@techcorp.com",
                  department: "HR - HR Manager",
                  healthScore: 92,
                  programs: 5,
                  lastCheckup: "1/8/2024",
                ),

                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ======================== WIDGET HELPERS ========================

  Widget _searchBox() {
    return TextField(
      controller: searchController,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: "Search employees...",
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
      ),
    );
  }

  Widget _departmentDropdown() {
    return Container(
      height: 52,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: selectedDepartment,
          items: departments
              .map((d) => DropdownMenuItem(
                    value: d,
                    child: Text(d),
                  ))
              .toList(),
          onChanged: (v) => setState(() => selectedDepartment = v!),
        ),
      ),
    );
  }

  // Employee card UI
  Widget _employeeCard({
    required String initials,
    required String name,
    required String email,
    required String department,
    required int healthScore,
    required int programs,
    required String lastCheckup,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 650;

        return Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 26,
                    backgroundColor: Colors.grey.shade200,
                    child: Text(
                      initials,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),

                        const SizedBox(height: 8),

                        Wrap(
                          spacing: 8,
                          runSpacing: 6,
                          children: [
                            _chip("Excellent"),
                            _chip("Low Risk"),
                          ],
                        ),

                        const SizedBox(height: 10),

                        Wrap(
                          spacing: 12,
                          runSpacing: 6,
                          children: [
                            _iconText(Icons.email_outlined, email),
                            _iconText(Icons.business_center_outlined,
                                department),
                          ],
                        ),

                        const SizedBox(height: 10),

                        Text(
                          "Health Score: $healthScore/100   Programs: $programs   Last Checkup: $lastCheckup",
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              // Buttons bottom
              if (isMobile)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _actionBtn("Invite to Programs"),
                    const SizedBox(height: 10),
                    _actionBtn("View Details"),
                  ],
                )
              else
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _actionBtn("Invite to Programs"),
                    const SizedBox(width: 12),
                    _actionBtn("View Details"),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _chip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.green.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text, style: const TextStyle(fontSize: 12)),
    );
  }

  Widget _iconText(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16),
        const SizedBox(width: 6),
        Flexible(child: Text(text, softWrap: true)),
      ],
    );
  }

  Widget _actionBtn(String text) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        text,
        style:
            const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
    );
  }
}
