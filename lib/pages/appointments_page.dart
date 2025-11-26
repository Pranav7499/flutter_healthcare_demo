
import 'package:flutter/material.dart';
import '../widgets/custom_header.dart';
import '../utils/app_responsive.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_tab.dart';
import 'package:table_calendar/table_calendar.dart';

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({super.key});

  @override
  State<AppointmentsPage> createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  int _selectedTab = 0;

  final List<String> _tabs = [
    "Upcoming",
    "Past",
    "Calendar View",
  ];

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    const double pageMaxWidth = 1200;

    return Material(
      color: Colors.transparent, // important!
      child: SingleChildScrollView(
        padding: AppResponsive.pagePadding(context),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: pageMaxWidth),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ---------------- HEADER ----------------
                PageHeader(
                  title: "My Appointments",
                  subtitle: "Manage your healthcare appointments",
                  button1Icon: Icons.add,
                  button1Text: "Book Appointment",
                  button1OnPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Book Appointment tapped")),
                    );
                  },
                  padding: const EdgeInsets.only(bottom: 20),
                ),

                const SizedBox(height: 10),

                // ---------------- TABS ----------------
                TabToggle(
                  options: _tabs,
                  counts: [0, 0, 0],
                  selectedIndex: _selectedTab,
                  onSelected: (i) => setState(() => _selectedTab = i),
                  height: 40,
                  fontSize: 12,
                ),

                const SizedBox(height: 30),

                // ---------------- CONTENT ----------------
                _buildTabContent(),

                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// ---------------- TAB CONTENT ----------------
  Widget _buildTabContent() {
    if (_selectedTab == 0) {
      return Center(
        child: Text(
          "No upcoming appointments.",
          style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
        ),
      );
    }

    if (_selectedTab == 1) {
      return Center(
        child: Text(
          "No past appointments.",
          style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
        ),
      );
    }

    // ---------------- CALENDAR VIEW ----------------
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Appointment Calendar",
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            "View your appointments in calendar format",
            style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 20),

          TableCalendar(
            firstDay: DateTime.utc(2010),
            lastDay: DateTime.utc(2040),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
            onDaySelected: (selected, focused) {
              setState(() {
                _selectedDay = selected;
                _focusedDay = focused;
              });
            },
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              titleTextStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              leftChevronIcon: Icon(Icons.chevron_left),
              rightChevronIcon: Icon(Icons.chevron_right),
            ),
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.blue.shade100,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
