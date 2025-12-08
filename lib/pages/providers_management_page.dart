import 'package:flutter/material.dart';
import 'package:flutter_healthcare_demo/utils/responsive.dart';
import 'package:flutter_healthcare_demo/widgets/custom_header.dart';
import 'package:flutter_healthcare_demo/widgets/custom_button.dart';
import 'package:flutter_healthcare_demo/widgets/stat_card_horizontal.dart';
import 'package:flutter_healthcare_demo/widgets/doctor_card.dart'; // your DoctorCard

class ProvidersManagementPage extends StatefulWidget {
  const ProvidersManagementPage({super.key});

  @override
  State<ProvidersManagementPage> createState() =>
      _ProvidersManagementPageState();
}

class _ProvidersManagementPageState extends State<ProvidersManagementPage> {
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    final bool isMobile = AppResponsive.isMobile(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 14 : 28,
          vertical: isMobile ? 14 : 28,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),

            const SizedBox(height: 20),

            _buildStatsRow(context),

            const SizedBox(height: 25),

            _buildSearchBox(),

            const SizedBox(height: 20),

            _buildTabs(context),

            const SizedBox(height: 20),

            _buildDoctorCardsList(context),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------
  // HEADER (Export + Send buttons)
  // ---------------------------------------------------------------------
  Widget _buildHeader(BuildContext context) {
    return PageHeader(
      title: "Provider Management",
      button1Text: "Export Data",
      button1OnPressed: () {},
      button2Text: "Send Invitations",
      // button2Icon: Icons.send,
      button2OnPressed: () {},
      padding: const EdgeInsets.only(bottom: 10),
    );
  }

  // ---------------------------------------------------------------------
  // STATS ROW
  // ---------------------------------------------------------------------
  Widget _buildStatsRow(BuildContext context) {
    final isMobile = AppResponsive.isMobile(context);

    return Wrap(
      spacing: 20,
      runSpacing: 20,
      children: [
        StatCardHorizontal(
          title: "Total Providers",
          count: 5,
          icon: Icons.group,
          iconColor: Colors.blue,
          width: isMobile ? double.infinity : 230,
        ),
        StatCardHorizontal(
          title: "Verified",
          count: 3,
          icon: Icons.verified,
          iconColor: Colors.green,
          width: isMobile ? double.infinity : 230,
        ),
        StatCardHorizontal(
          title: "Pending Review",
          count: 1,
          icon: Icons.access_time,
          iconColor: Colors.orange,
          width: isMobile ? double.infinity : 230,
        ),
        StatCardHorizontal(
          title: "Avg. Fee",
          count: 850,
          icon: Icons.attach_money,
          iconColor: Colors.blueAccent,
          width: isMobile ? double.infinity : 230,
        ),
      ],
    );
  }

  // ---------------------------------------------------------------------
  // SEARCH BOX
  // ---------------------------------------------------------------------
  Widget _buildSearchBox() {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        prefixIcon: const Icon(Icons.search),
        hintText:
            "Search providers by name, specialty, or location...",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------
  // TABS ROW
  // ---------------------------------------------------------------------
  Widget _buildTabs(BuildContext context) {
    List<String> tabs = ["All Providers (5)", "Verified (3)", "Pending (1)", "Rejected (1)"];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(tabs.length, (index) {
          bool selected = currentTab == index;

          return Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () => setState(() => currentTab = index),
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 18, vertical: 10),
                decoration: BoxDecoration(
                  color: selected ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: selected
                      ? [
                          BoxShadow(
                            color: Colors.black12.withOpacity(0.05),
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          )
                        ]
                      : [],
                ),
                child: Text(
                  tabs[index],
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight:
                        selected ? FontWeight.w600 : FontWeight.w500,
                    color:
                        selected ? Colors.black : Colors.grey.shade700,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  // ---------------------------------------------------------------------
  // DOCTOR CARD LIST
  // ---------------------------------------------------------------------
  Widget _buildDoctorCardsList(BuildContext context) {
    return Column(
      children: [
        DoctorCard(
          name: "Dr. Rajesh Kumar",
          email: "rajesh.kumar@healthcare.com",
          location: "Mumbai, Maharashtra",
          rating: 4.8,
          consultations: 1250,
          fee: 800,
          specialties: const ["Cardiology", "Internal Medicine"],
          verified: true,
          onViewDetails: () {},
        ),
      ],
    );
  }
}
