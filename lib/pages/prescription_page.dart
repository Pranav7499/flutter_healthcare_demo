// import 'package:flutter/material.dart';
// import '../widgets/custom_header.dart';
// import '../widgets/custom_button.dart';
// import '../utils/app_responsive.dart';
// import '../widgets/custom_tab.dart';
// import '../widgets/stat_card_horizontal.dart';



// class PrescriptionPage extends StatefulWidget {
//   const PrescriptionPage({super.key});

//   @override
//   State<PrescriptionPage> createState() => _PrescriptionPageState();
// }

// class _PrescriptionPageState extends State<PrescriptionPage> {
//   int _activeCount = 0;
//   int _completedCount = 0;
//   int _expiredCount = 0;
//   int _remindersCount = 3;

//   int _selectedTab = 0;

//   final List<String> _tabs = [
//     "Active",
//     "Completed",
//     "Expired",
//     "All Prescriptions",
//   ];

//   final List<int> _tabCounts = [0, 0, 0, 0];

//   final TextEditingController _searchController = TextEditingController();

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   void _onUploadPressed() {
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text("Upload pressed (not implemented)")),
//     );
//   }

//   void _onExportPressed() {
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text("Export pressed (not implemented)")),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     const double maxWidth = 1100;
//     final double screenWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       backgroundColor: const Color(0xFFF6F7FB),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.symmetric(vertical: 28),
//         child: Center(
//           child: ConstrainedBox(
//             constraints: const BoxConstraints(maxWidth: maxWidth),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [

               
//                 LayoutBuilder(
//   builder: (context, constraints) {
//     // 📌 Force mobile layout below 420px width
//     bool smallScreen = constraints.maxWidth < 460;

//     return ConstrainedBox(
//       constraints: BoxConstraints(maxWidth: constraints.maxWidth),
//       child: PageHeader(
//         title: "My Prescriptions",
//         subtitle: "Track your medications and prescriptions",

//         // On small screens, shorten button text
//         button1Icon: Icons.file_upload_outlined,
//         button1Text: smallScreen ? "Upload" : "Upload Prescription",
//         button1OnPressed: _onUploadPressed,

//         button2Icon: Icons.download_outlined,
//         button2Text: smallScreen ? "Export" : "Export Records",
//         button2OnPressed: _onExportPressed,

//         // Add spacing only
//         padding: const EdgeInsets.only(bottom: 32),
//       ),
//     );
//   },
// ),

//                 /// SEARCH BAR
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: ConstrainedBox(
//                     constraints: BoxConstraints(
//                       maxWidth: screenWidth < 600 ? screenWidth : maxWidth * 0.6,
//                     ),
//                     child: SizedBox(
//                       height: 52,
//                       child: TextField(
//                         controller: _searchController,
//                         textAlignVertical: TextAlignVertical.center,
//                         decoration: InputDecoration(
//                           prefixIcon: const Icon(Icons.search),
//                           hintText: "Search medications or providers...",
//                           filled: true,
//                           fillColor: Colors.white,
//                           contentPadding:
//                               const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                             borderSide: BorderSide(color: Colors.grey.shade200),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                             borderSide: BorderSide(color: Colors.grey.shade200),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 28),

//                 /// STAT CARDS
//                 LayoutBuilder(builder: (context, constraints) {
//                   return Wrap(
//                     spacing: 20,
//                     runSpacing: 20,
//                     children: [
//                       StatCardHorizontal(
//                         title: "Active",
//                         count: _activeCount,
//                         icon: Icons.medication_rounded,
//                         iconColor: Colors.green,
//                         width: _cardWidth(constraints.maxWidth),
//                       ),

//                       StatCardHorizontal(
//                         title: "Completed",
//                         count: _completedCount,
//                         icon: Icons.check_circle_outline,
//                         iconColor: Colors.blue,
//                         width: _cardWidth(constraints.maxWidth),
//                       ),
//                       StatCardHorizontal(
//                         title: "Expired",
//                         count: _expiredCount,
//                         icon: Icons.error_outline,
//                         iconColor: Colors.red,
//                         width: _cardWidth(constraints.maxWidth),
//                       ),
//                       StatCardHorizontal(
//                         title: "Reminders",
//                         count: _remindersCount,
//                         icon: Icons.notifications_none,
//                         iconColor: Colors.orange,
//                         width: _cardWidth(constraints.maxWidth),
//                       ),
//                     ],
//                   );
//                 }),

//                 const SizedBox(height: 28),

                
//                 //_buildTabs(),
//                 TabToggle(
//   options: _tabs,
//   counts: _tabCounts,
//   selectedIndex: _selectedTab,
//   onSelected: (index) {
//     setState(() => _selectedTab = index);
//   },
//   height: 42,     
//   fontSize: 12,   
// ),


//                 const SizedBox(height: 28),

//                 /// CONTENT
//                 _buildTabContent(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   /// CARD WIDTH LOGIC
//   double _cardWidth(double maxWidth) {
//     if (maxWidth >= 1100) {
//       return (1100 - (20 * 3)) / 4;
//     } else if (maxWidth >= 700) {
//       return (maxWidth - 20) / 2;
//     } else {
//       return maxWidth;
//     }
//   }

//   /// STAT CARD
  

//   Widget _buildTabContent() {
//     return Center(
//     );
//   }
// }


import 'package:flutter/material.dart';
import '../widgets/custom_header.dart';
import '../widgets/custom_button.dart';
import '../utils/app_responsive.dart';
import '../widgets/custom_tab.dart';
import '../widgets/stat_card_horizontal.dart';

class PrescriptionPage extends StatefulWidget {
  const PrescriptionPage({super.key});

  @override
  State<PrescriptionPage> createState() => _PrescriptionPageState();
}

class _PrescriptionPageState extends State<PrescriptionPage> {
  int _activeCount = 0;
  int _completedCount = 0;
  int _expiredCount = 0;
  int _remindersCount = 3;

  int _selectedTab = 0;

  final List<String> _tabs = [
    "Active",
    "Completed",
    "Expired",
    "All Prescriptions",
  ];

  final List<int> _tabCounts = [0, 0, 0, 0];

  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onUploadPressed() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Upload pressed (not implemented)")),
    );
  }

  void _onExportPressed() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Export pressed (not implemented)")),
    );
  }

  @override
  Widget build(BuildContext context) {
    const double maxWidth = 1100;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Material(
      color: Colors.transparent, 
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 28),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: maxWidth),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// ---------------- HEADER ----------------
                LayoutBuilder(
                  builder: (context, constraints) {
                    bool smallScreen = constraints.maxWidth < 460;

                    return ConstrainedBox(
                      constraints:
                          BoxConstraints(maxWidth: constraints.maxWidth),
                      child: PageHeader(
                        title: "My Prescriptions",
                        subtitle:
                            "Track your medications and prescriptions",

                        button1Icon: Icons.file_upload_outlined,
                        button1Text:
                            smallScreen ? "Upload" : "Upload Prescription",
                        button1OnPressed: _onUploadPressed,

                        button2Icon: Icons.download_outlined,
                        button2Text:
                            smallScreen ? "Export" : "Export Records",
                        button2OnPressed: _onExportPressed,

                        padding: const EdgeInsets.only(bottom: 32),
                      ),
                    );
                  },
                ),

                /// ---------------- SEARCH BAR ----------------
                Align(
                  alignment: Alignment.centerLeft,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth:
                          screenWidth < 600 ? screenWidth : maxWidth * 0.6,
                    ),
                    child: SizedBox(
                      height: 52,
                      child: TextField(
                        controller: _searchController,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          hintText:
                              "Search medications or providers...",
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                BorderSide(color: Colors.grey.shade200),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                BorderSide(color: Colors.grey.shade200),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                /// ---------------- STAT CARDS ----------------
                LayoutBuilder(builder: (context, constraints) {
                  return Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: [
                      StatCardHorizontal(
                        title: "Active",
                        count: _activeCount,
                        icon: Icons.medication_rounded,
                        iconColor: Colors.green,
                        width: _cardWidth(constraints.maxWidth),
                      ),
                      StatCardHorizontal(
                        title: "Completed",
                        count: _completedCount,
                        icon: Icons.check_circle_outline,
                        iconColor: Colors.blue,
                        width: _cardWidth(constraints.maxWidth),
                      ),
                      StatCardHorizontal(
                        title: "Expired",
                        count: _expiredCount,
                        icon: Icons.error_outline,
                        iconColor: Colors.red,
                        width: _cardWidth(constraints.maxWidth),
                      ),
                      StatCardHorizontal(
                        title: "Reminders",
                        count: _remindersCount,
                        icon: Icons.notifications_none,
                        iconColor: Colors.orange,
                        width: _cardWidth(constraints.maxWidth),
                      ),
                    ],
                  );
                }),

                const SizedBox(height: 28),

                /// ---------------- TABS ----------------
                TabToggle(
                  options: _tabs,
                  counts: _tabCounts,
                  selectedIndex: _selectedTab,
                  onSelected: (index) =>
                      setState(() => _selectedTab = index),
                  height: 42,
                  fontSize: 12,
                ),

                const SizedBox(height: 28),

                /// ---------------- CONTENT ----------------
                _buildTabContent(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// CARD WIDTH LOGIC (unchanged)
  double _cardWidth(double maxWidth) {
    if (maxWidth >= 1100) {
      return (1100 - (20 * 3)) / 4;
    } else if (maxWidth >= 700) {
      return (maxWidth - 20) / 2;
    } else {
      return maxWidth;
    }
  }

  /// PLACEHOLDER CONTENT
  Widget _buildTabContent() {
    return Center(
      child: Text(
        "",
        style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
      ),
    );
  }
}
