import 'package:flutter/material.dart';
import '../widgets/custom_header.dart';
import '../widgets/custom_button.dart';
import '../utils/app_responsive.dart';
import '../widgets/custom_tab.dart';
import '../widgets/stat_card_horizontal.dart';

class InsuranceManagementPage extends StatefulWidget {
  const InsuranceManagementPage({super.key});

  @override
  State<InsuranceManagementPage> createState() =>
      _InsuranceManagementPageState();
}

class _InsuranceManagementPageState extends State<InsuranceManagementPage> {
  int activePolicies = 0;
  int totalClaims = 0;
  int pendingClaims = 0;

  int selectedTab = 0;

  final List<String> tabs = [
    "Insurance Policies",
    "Claims",
    "Coverage Details",
  ];

  final List<int> tabCounts = [0, 0, 0];

  @override
  Widget build(BuildContext context) {
    const double maxWidth = 1100;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Material(
      color: Colors.transparent,
      child: SingleChildScrollView(
        //padding: const EdgeInsets.symmetric(vertical: 28),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 28),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: maxWidth),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 🔷 HEADER
                LayoutBuilder(
                  builder: (context, constraints) {
                    bool smallScreen = constraints.maxWidth < 500;

                    return PageHeader(
                      title: "Insurance Management",
                      subtitle:
                          "Manage your insurance policies and claims",

                      /// BUTTON 1 - Add Policy
                      button1Icon: Icons.add,
                      button1Text: smallScreen ? "Add" : "Add Policy",
                      button1OnPressed: () {},

                      /// BUTTON 2 - File Claim
                      button2Icon: Icons.description_outlined,
                      button2Text:
                          smallScreen ? "Claim" : "File Claim",
                      button2OnPressed: () {},

                      padding: const EdgeInsets.only(bottom: 32),
                    );
                  },
                ),

                /// 🔷 STAT CARDS
                LayoutBuilder(builder: (context, constraints) {
                  return Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: [
                      StatCardHorizontal(
                        title: "Active Policies",
                        count: activePolicies,
                        icon: Icons.shield_outlined,
                        iconColor: Colors.blue,
                        width: _cardWidth(constraints.maxWidth),
                      ),
                      StatCardHorizontal(
                        title: "Total Claims",
                        count: totalClaims,
                        icon: Icons.article_outlined,
                        iconColor: Colors.green,
                        width: _cardWidth(constraints.maxWidth),
                      ),
                      StatCardHorizontal(
                        title: "Pending Claims",
                        count: pendingClaims,
                        icon: Icons.attach_money_rounded,
                        iconColor: Colors.orange,
                        width: _cardWidth(constraints.maxWidth),
                      ),
                    ],
                  );
                }),

                const SizedBox(height: 28),

                /// 🔷 TABS
                TabToggle(
                  options: tabs,
                  counts: tabCounts,
                  selectedIndex: selectedTab,
                  onSelected: (i) =>
                      setState(() => selectedTab = i),
                  height: 42,
                  fontSize: 12,
                ),

                const SizedBox(height: 28),

                /// 🔷 TAB CONTENT
                _buildContent(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Calculate card width like your original prescription page
  double _cardWidth(double maxWidth) {
    if (maxWidth >= 1100) {
      return (1100 - (20 * 2)) / 3;
    } else if (maxWidth >= 700) {
      return (maxWidth - 20) / 2;
    } else {
      return maxWidth;
    }
  }

  Widget _buildContent() {
    switch (selectedTab) {
      case 0:
        return _emptyView("No insurance policies found.");
      case 1:
        return _emptyView("No claims available.");
      case 2:
        return _emptyView("No coverage details available.");
      default:
        return Container();
    }
  }

  Widget _emptyView(String msg) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Text(
          msg,
          style: TextStyle(fontSize: 15, color: Colors.grey.shade600),
        ),
      ),
    );
  }
}
