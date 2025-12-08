// lib/pages/analytics_dashboard_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_healthcare_demo/utils/responsive.dart';
import 'package:flutter_healthcare_demo/widgets/progress_bar.dart';

class AnalyticsDashboardPage extends StatefulWidget {
  const AnalyticsDashboardPage({super.key});

  @override
  State<AnalyticsDashboardPage> createState() => _AnalyticsDashboardPageState();
}

class _AnalyticsDashboardPageState extends State<AnalyticsDashboardPage> {
  int selectedTab = 0; // 0 = Overview, 1 = Revenue, 2 = Users, 3 = Projections

  @override
  Widget build(BuildContext context) {
    final bool isMobile = AppResponsive.isMobile(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 16 : 28,
          vertical: isMobile ? 20 : 30,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1400),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // HEADER (title + realtime button)
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "Analytics Dashboard",
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF0F1724),
                        ),
                      ),
                    ),
                    _realTimeDataButton(),
                  ],
                ),

                const SizedBox(height: 25),

                // TAB BAR
                _tabBar(),

                const SizedBox(height: 30),

                // TAB CONTENT
                if (selectedTab == 0) _overviewTab(),
                if (selectedTab == 1) _revenueTab(),
                if (selectedTab == 2) _usersTab(),
                if (selectedTab == 3) _projectionsTab(),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ----------------- TAB BAR -----------------
  Widget _tabBar() {
    final tabs = ["Overview", "Revenue", "Users", "Projections"];

    return LayoutBuilder(builder: (context, constraints) {
      // Make tab spacing slightly tighter on small widths
      final bool narrow = constraints.maxWidth < 700;

      return Container(
        padding: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: const Color(0xFFF3F4F6),
          borderRadius: BorderRadius.circular(16),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(tabs.length, (index) {
              bool active = selectedTab == index;
              return Padding(
                padding: EdgeInsets.only(
                    left: index == 0 ? 12 : 10, right: index == tabs.length - 1 ? 12 : 6),
                child: GestureDetector(
                  onTap: () => setState(() => selectedTab = index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: narrow ? 18 : 28,
                    ),
                    decoration: BoxDecoration(
                      color: active ? Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: active
                          ? [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.06),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              )
                            ]
                          : null,
                      border: active
                          ? Border.all(color: Colors.blue.shade300, width: 2)
                          : null,
                    ),
                    child: Text(
                      tabs[index],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: active ? FontWeight.w700 : FontWeight.w600,
                        color: active ? Colors.black87 : Colors.grey.shade700,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      );
    });
  }

  // ----------------- REAL-TIME DATA BUTTON -----------------
  Widget _realTimeDataButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.blue.shade200),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.monitor_heart, color: Color(0xFF2563EB), size: 18),
          SizedBox(width: 8),
          Text(
            "Real-time Data",
            style: TextStyle(
              color: Color(0xFF2563EB),
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  // ----------------- OVERVIEW TAB -----------------
  Widget _overviewTab() {
    final bool isMobile = AppResponsive.isMobile(context);
    return Column(
      children: [
        _buildTopCards(),
        const SizedBox(height: 30),
        _buildProgressSection(isMobile),
      ],
    );
  }

  // ----------------- Top 4 stat cards (responsive) -----------------
  Widget _buildTopCards() {
    return LayoutBuilder(builder: (context, constraints) {
      // Compute card widths so that on wide screens we get 4 columns,
      // but on smaller screens the cards will wrap naturally.
      final double maxWidth = constraints.maxWidth;
      final bool narrow = maxWidth < 900;
      final int columns = narrow ? 1 : 4;
      final double gap = 20;
      // cardWidth minus padding; when columns==1, cardWidth = full width.
      final double cardWidth =
          columns == 1 ? double.infinity : (maxWidth - gap * (columns - 1)) / columns;

      final List<Widget> cards = [
        _statCard(
          title: "Total Users",
          value: "26",
          subtitle: "+0.0% from last month",
          icon: Icons.people,
          iconColor: Colors.blue,
          width: cardWidth,
        ),
        _statCard(
          title: "Total Revenue",
          value: "₹0",
          subtitle: "+0.0% from last month",
          icon: Icons.currency_rupee,
          iconColor: Colors.green,
          width: cardWidth,
        ),
        _statCard(
          title: "Monthly Revenue",
          value: "₹0",
          subtitle: "Current month earnings",
          icon: Icons.trending_up,
          iconColor: Colors.purple,
          width: cardWidth,
        ),
        _statCard(
          title: "Appointments",
          value: "0",
          subtitle: "0 completed",
          icon: Icons.calendar_today,
          iconColor: Colors.orange,
          width: cardWidth,
        ),
      ];

      return Wrap(
        spacing: gap,
        runSpacing: 20,
        children: cards,
      );
    });
  }

  Widget _statCard({
    required String title,
    required String value,
    required String subtitle,
    required IconData icon,
    required Color iconColor,
    required double width,
  }) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 14,
            offset: const Offset(0, 8),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF0F1724),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: iconColor, size: 18),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 13, color: Colors.green, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  // ----------------- Progress section: user breakdown + business metrics -----------------
  Widget _buildProgressSection(bool isMobile) {
    if (isMobile) {
      return Column(
        children: [
          _leftProgressCard(),
          const SizedBox(height: 20),
          _rightProgressCard(),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _leftProgressCard()),
        const SizedBox(width: 24),
        Expanded(child: _rightProgressCard()),
      ],
    );
  }

  Widget _leftProgressCard() {
    return Container(
      padding: const EdgeInsets.all(22),
      height: 320,
      decoration: _boxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "User Breakdown",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: Color(0xFF0F1724)),
          ),
          SizedBox(height: 22),
          Row(
            children: [
              Icon(Icons.person_outline, color: Colors.blue, size: 22),
              SizedBox(width: 10),
              Text("Patients", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
              Spacer(),
              Text("12", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
            ],
          ),
          SizedBox(height: 6),
          Text("46.2%", style: TextStyle(fontSize: 13, color: Colors.black54)),
          SizedBox(height: 10),
          ProgressBar(title: "", percent: 0.46),
          SizedBox(height: 22),
          Row(
            children: [
              Icon(Icons.medical_services_outlined, color: Colors.green, size: 22),
              SizedBox(width: 10),
              Text("Providers", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
              Spacer(),
              Text("9", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
            ],
          ),
          SizedBox(height: 6),
          Text("34.6%", style: TextStyle(fontSize: 13, color: Colors.black54)),
          SizedBox(height: 10),
          ProgressBar(title: "", percent: 0.34),
        ],
      ),
    );
  }

  Widget _rightProgressCard() {
    return Container(
      padding: const EdgeInsets.all(22),
      height: 320,
      decoration: _boxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Business Metrics",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: Color(0xFF0F1724))),
          const SizedBox(height: 22),
          _metricRow("Avg Transaction Value", "₹0"),
          const SizedBox(height: 18),
          _metricRow("Appointment Completion Rate", "0%"),
          const SizedBox(height: 18),
          _metricRow("Patient to Provider Ratio", "1.3:1"),
        ],
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Colors.grey.shade200),
      boxShadow: [
        BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 12, offset: const Offset(0, 6)),
      ],
    );
  }

  Widget _metricRow(String label, String value) {
    return Row(
      children: [
        Expanded(
          child: Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        ),
        Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
      ],
    );
  }

  // ----------------- REVENUE TAB -----------------
  Widget _revenueTab() {
    final bool isMobile = AppResponsive.isMobile(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isMobile
            ? Column(
                children: [
                  _revenueCard("Popular Services"),
                  const SizedBox(height: 20),
                  _revenueCard("Payment Methods"),
                ],
              )
            : Row(
                children: [
                  Expanded(child: _revenueCard("Popular Services")),
                  const SizedBox(width: 24),
                  Expanded(child: _revenueCard("Payment Methods")),
                ],
              ),
        const SizedBox(height: 30),
        _monthlyTrendsCard(),
      ],
    );
  }

  Widget _revenueCard(String title) {
    return Container(
      padding: const EdgeInsets.all(26),
      height: 160,
      decoration: _boxDecoration(),
      child: Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
    );
  }

  Widget _monthlyTrendsCard() {
    return Container(
      padding: const EdgeInsets.all(26),
      decoration: _boxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Monthly Trends", style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800)),
          const SizedBox(height: 24),
          _trendRow("Jul 2025", "0", "₹0", "0"),
          const Divider(height: 36, thickness: 1, color: Color(0xFFE5E7EB)),
          _trendRow("Aug 2025", "0", "₹0", "0"),
        ],
      ),
    );
  }

  Widget _trendRow(String month, String users, String revenue, String appts) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Text(month, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(users, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                const Text("Users", style: TextStyle(fontSize: 13, color: Colors.black54)),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(revenue, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                const Text("Revenue", style: TextStyle(fontSize: 13, color: Colors.black54)),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(appts, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                const Text("Appointments", style: TextStyle(fontSize: 13, color: Colors.black54)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ----------------- USERS TAB -----------------
  Widget _usersTab() {
    final bool isMobile = AppResponsive.isMobile(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // top three small cards
        isMobile
            ? Column(
                children: [
                  _userStatCard(
                    title: "Total Patients",
                    value: "12",
                    subtitle: "46.2% of total users",
                    icon: Icons.people_outline,
                    iconColor: Colors.blue,
                  ),
                  const SizedBox(height: 14),
                  _userStatCard(
                    title: "Total Providers",
                    value: "9",
                    subtitle: "34.6% of total users",
                    icon: Icons.medical_services_outlined,
                    iconColor: Colors.green,
                  ),
                  const SizedBox(height: 14),
                  _userStatCard(
                    title: "User Growth",
                    value: "+0.0%",
                    subtitle: "Compared to last month",
                    valueColor: Colors.green,
                    icon: Icons.show_chart,
                    iconColor: Colors.green,
                  ),
                ],
              )
            : Row(
                children: [
                  Expanded(
                    child: _userStatCard(
                      title: "Total Patients",
                      value: "12",
                      subtitle: "46.2% of total users",
                      icon: Icons.people_outline,
                      iconColor: Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: _userStatCard(
                      title: "Total Providers",
                      value: "9",
                      subtitle: "34.6% of total users",
                      icon: Icons.medical_services_outlined,
                      iconColor: Colors.green,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: _userStatCard(
                      title: "User Growth",
                      value: "+0.0%",
                      subtitle: "Compared to last month",
                      valueColor: Colors.green,
                      icon: Icons.show_chart,
                      iconColor: Colors.green,
                    ),
                  ),
                ],
              ),

        const SizedBox(height: 30),
        // registration trends
        _userRegistrationTrends(),
      ],
    );
  }

  Widget _userStatCard({
    required String title,
    required String value,
    required String subtitle,
    required IconData icon,
    required Color iconColor,
    Color valueColor = Colors.black,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: _boxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Text(title, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600))),
              Icon(icon, color: iconColor, size: 20),
            ],
          ),
          const SizedBox(height: 12),
          Text(value, style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800, color: valueColor)),
          const SizedBox(height: 8),
          Text(subtitle, style: const TextStyle(fontSize: 14, color: Colors.black54)),
        ],
      ),
    );
  }

  Widget _userRegistrationTrends() {
    return Container(
      padding: const EdgeInsets.all(26),
      decoration: _boxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("User Registration Trends", style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800)),
          const SizedBox(height: 24),
          _userTrendRow("Jul 2025", 0),
          const Divider(height: 36, thickness: 1, color: Color(0xFFE5E7EB)),
          _userTrendRow("Aug 2025", 0),
        ],
      ),
    );
  }

  Widget _userTrendRow(String month, int users) {
    final double progress = users == 0 ? 0.0 : (users / 100.0).clamp(0.0, 1.0);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Expanded(child: Text(month, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600))),
          Expanded(child: Text("$users new users", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 8,
                backgroundColor: Colors.grey.shade300,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ----------------- PROJECTIONS TAB -----------------
  Widget _projectionsTab() {
    final bool isMobile = AppResponsive.isMobile(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Revenue Projections + Growth Projections
        isMobile
            ? Column(
                children: [
                  _revenueProjectionCard(),
                  const SizedBox(height: 20),
                  _growthProjectionCard(),
                ],
              )
            : Row(
                children: [
                  Expanded(child: _revenueProjectionCard()),
                  const SizedBox(width: 24),
                  Expanded(child: _growthProjectionCard()),
                ],
              ),
        const SizedBox(height: 30),
        _kpiCard(),
      ],
    );
  }

  Widget _revenueProjectionCard() {
    return Container(
      padding: const EdgeInsets.all(26),
      decoration: _boxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title with icon
          Row(
            children: const [
              Icon(Icons.currency_rupee, size: 22, color: Colors.black87),
              SizedBox(width: 10),
              Text("Revenue Projections", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
            ],
          ),
          const SizedBox(height: 22),
          _projectionRowWidget("Next Month (Projected)", "₹0"),
          const SizedBox(height: 12),
          _projectionRowWidget("Next Quarter (Projected)", "₹0"),
          const SizedBox(height: 12),
          _projectionRowWidget("Annual Run Rate", "₹0"),
        ],
      ),
    );
  }

  Widget _growthProjectionCard() {
    return Container(
      padding: const EdgeInsets.all(26),
      decoration: _boxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.show_chart, size: 22, color: Colors.black87),
              SizedBox(width: 10),
              Text("Growth Projections", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
            ],
          ),
          const SizedBox(height: 22),
          _projectionRowWidget("Projected Users (Next Month)", "26"),
          const SizedBox(height: 12),
          _projectionRowWidget("Projected Appointments (Monthly)", "0"),
          const SizedBox(height: 12),
          _projectionRowWidget("Market Penetration", "0.26%"),
        ],
      ),
    );
  }

  Widget _projectionRowWidget(String label, String value) {
    return Row(
      children: [
        Expanded(child: Text(label, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500))),
        Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
      ],
    );
  }

  Widget _kpiCard() {
    return Container(
      padding: const EdgeInsets.all(26),
      decoration: _boxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Key Performance Indicators", style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800)),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(child: _kpiItem("Monthly Recurring Revenue Growth", 0.0)),
              const SizedBox(width: 30),
              Expanded(child: _kpiItem("Appointment Completion Rate", 0.0)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _kpiItem(String title, double value) {
    // value expected 0..1
    final display = (value * 100).toStringAsFixed(1);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text("$display%")],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: value.clamp(0.0, 1.0),
            minHeight: 8,
            backgroundColor: Colors.grey.shade300,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
        ),
      ],
    );
  }
}
