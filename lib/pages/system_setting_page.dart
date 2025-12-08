
// // lib/pages/system_setting_page.dart
// import 'package:flutter/material.dart';
// import 'package:flutter_healthcare_demo/widgets/custom_button.dart';
// import 'package:flutter_healthcare_demo/utils/responsive.dart';

// class SystemSettingsPage extends StatefulWidget {
//   const SystemSettingsPage({super.key});

//   @override
//   State<SystemSettingsPage> createState() => _SystemSettingsPageState();
// }

// class _SystemSettingsPageState extends State<SystemSettingsPage> {
//   int _selectedTab = 0;

//   final List<String> _tabs = [
//     "General",
//     "Security",
//     "Notifications",
//     "Backup & Maintenance",
//   ];

//   // General tab states
//   bool maintenanceMode = false;
//   bool enableUserRegistration = true;
//   bool enablePayment = true;
//   bool enableSystemNotifications = true;


//   final TextEditingController maxAppointmentsController =
//       TextEditingController(text: "50");
//   final TextEditingController defaultDurationController =
//       TextEditingController(text: "30");
//   final TextEditingController timeZoneController =
//       TextEditingController(text: "Asia/Kolkata");
//   final TextEditingController emergencyEmailController =
//       TextEditingController(text: "admin@healthcare.com");

//   // Security tab states
//   bool auditLogging = true;
//   bool twoFactorAuth = false;

//   final TextEditingController sessionTimeoutController =
//       TextEditingController(text: "30");
//   final TextEditingController passwordLengthController =
//       TextEditingController(text: "8");
//   final TextEditingController fileUploadSizeController =
//       TextEditingController(text: "10");

//   @override
//   void dispose() {
//     maxAppointmentsController.dispose();
//     defaultDurationController.dispose();
//     timeZoneController.dispose();
//     emergencyEmailController.dispose();
//     sessionTimeoutController.dispose();
//     passwordLengthController.dispose();
//     fileUploadSizeController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final bool isMobile = AppResponsive.isMobile(context);
//     final double width = MediaQuery.of(context).size.width;

//     return Scaffold(
//       backgroundColor: const Color(0xFFF6F7FB),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(
//           horizontal: isMobile ? 16 : 28,
//           vertical: isMobile ? 20 : 30,
//         ),
//         child: Center(
//           child: ConstrainedBox(
//             constraints: BoxConstraints(maxWidth: 1200),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 //---------------------- HEADER ----------------------//
//                 _buildHeader(isMobile),

//                 const SizedBox(height: 18),

//                 //---------------------- TABS ----------------------//
//                 _buildTabs(width),

//                 const SizedBox(height: 18),

//                 //---------------------- TAB CONTENT ----------------------//
//                 if (_selectedTab == 0)
//                   _buildGeneralCard(isMobile, width)
//                 else if (_selectedTab == 1)
//                   _buildSecurityCard(isMobile, width)
//                 else if (_selectedTab == 2)
//                   _buildNotificationsCard(isMobile, width)
//                 else
//                   _buildComingSoon(),

//                 const SizedBox(height: 28),

//                 //---------------------- MOBILE ACTION BUTTONS ----------------------//
//                 if (isMobile) _buildFooterButtons(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // --------------------------- HEADER --------------------------- //
//   Widget _buildHeader(bool isMobile) {
//     return Row(
//       children: [
//         const Expanded(
//           child: Text(
//             "System Settings",
//             style: TextStyle(
//               fontSize: 36,
//               fontWeight: FontWeight.w800,
//               color: Color(0xFF0F1724),
//             ),
//           ),
//         ),

//         if (!isMobile) ...[
//           SizedBox(
//             width: 170,
//             height: 46,
//             child: CustomButton(
//               text: "Reset to Default",
//               onPressed: () {},
//             ),
//           ),
//           const SizedBox(width: 12),
//           SizedBox(
//             width: 150,
//             height: 46,
//             child: CustomButton(
//               text: "Save Changes",
//               onPressed: () {},
//             ),
//           ),
//         ],
//       ],
//     );
//   }

//   // --------------------------- TABS --------------------------- //
//   Widget _buildTabs(double width) {
//     return Container(
//       padding: const EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         color: const Color(0xFFF3F4F6),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Row(
//           children: List.generate(_tabs.length, (index) {
//             final bool selected = _selectedTab == index;
//             return Padding(
//               padding: const EdgeInsets.only(right: 12),
//               child: GestureDetector(
//                 onTap: () => setState(() => _selectedTab = index),
//                 child: AnimatedContainer(
//                   duration: const Duration(milliseconds: 220),
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
//                   decoration: BoxDecoration(
//                     color: selected ? Colors.white : Colors.transparent,
//                     borderRadius: BorderRadius.circular(12),
//                     boxShadow: selected
//                         ? [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.08),
//                               blurRadius: 10,
//                               offset: const Offset(0, 4),
//                             )
//                           ]
//                         : null,
//                   ),
//                   child: Text(
//                     _tabs[index],
//                     style: TextStyle(
//                       fontSize: 15,
//                       fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
//                       color: selected ? Colors.black : Colors.grey.shade700,
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           }),
//         ),
//       ),
//     );
//   }

//   // --------------------------- GENERAL TAB --------------------------- //
//   Widget _buildGeneralCard(bool isMobile, double width) {
//     return Container(
//       decoration: _cardDecoration(),
//       padding: EdgeInsets.symmetric(
//         horizontal: isMobile ? 16 : 24,
//         vertical: isMobile ? 18 : 26,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _title("General Configuration"),
//           const SizedBox(height: 18),

//           _buildToggleRow("Maintenance Mode", maintenanceMode,
//               (v) => setState(() => maintenanceMode = v)),
//           const SizedBox(height: 12),

//           _buildToggleRow("Enable User Registration", enableUserRegistration,
//               (v) => setState(() => enableUserRegistration = v)),
//           const SizedBox(height: 12),

//           _buildToggleRow("Enable Payment Processing", enablePayment,
//               (v) => setState(() => enablePayment = v)),
//           const SizedBox(height: 20),

//           LayoutBuilder(
//             builder: (context, constraints) {
//               bool narrow = constraints.maxWidth < 700;
//               if (narrow) {
//                 return Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     _label("Max Appointments/Day"),
//                     const SizedBox(height: 8),
//                     _buildTextField(maxAppointmentsController),
//                     const SizedBox(height: 14),
//                     _label("Default Duration (min)"),
//                     const SizedBox(height: 8),
//                     _buildTextField(defaultDurationController),
//                   ],
//                 );
//               }
//               return Row(
//                 children: [
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         _label("Max Appointments/Day"),
//                         const SizedBox(height: 8),
//                         _buildTextField(maxAppointmentsController),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(width: 28),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         _label("Default Duration (min)"),
//                         const SizedBox(height: 8),
//                         _buildTextField(defaultDurationController),
//                       ],
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),

//           const SizedBox(height: 20),
//           _label("System Time Zone"),
//           const SizedBox(height: 8),
//           _buildTextField(timeZoneController),

//           const SizedBox(height: 20),
//           _label("Emergency Contact Email"),
//           const SizedBox(height: 8),
//           _buildTextField(emergencyEmailController),
//         ],
//       ),
//     );
//   }

//   // --------------------------- SECURITY TAB --------------------------- //
//   Widget _buildSecurityCard(bool isMobile, double width) {
//     return Container(
//       decoration: _cardDecoration(),
//       padding: EdgeInsets.symmetric(
//         horizontal: isMobile ? 16 : 24,
//         vertical: isMobile ? 18 : 26,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _title("Security Settings"),
//           const SizedBox(height: 20),

//           _buildToggleRow(
//               "Enable Audit Logging", auditLogging, (v) => setState(() => auditLogging = v)),
//           const SizedBox(height: 14),

//           _buildToggleRow("Require Two-Factor Authentication", twoFactorAuth,
//               (v) => setState(() => twoFactorAuth = v)),
//           const SizedBox(height: 28),

//           LayoutBuilder(
//             builder: (context, constraints) {
//               bool narrow = constraints.maxWidth < 700;
//               if (narrow) {
//                 return Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     _label("Session Timeout (minutes)"),
//                     const SizedBox(height: 8),
//                     _buildTextField(sessionTimeoutController),
//                     const SizedBox(height: 14),
//                     _label("Minimum Password Length"),
//                     const SizedBox(height: 8),
//                     _buildTextField(passwordLengthController),
//                   ],
//                 );
//               }
//               return Row(
//                 children: [
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         _label("Session Timeout (minutes)"),
//                         const SizedBox(height: 8),
//                         _buildTextField(sessionTimeoutController),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(width: 28),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         _label("Minimum Password Length"),
//                         const SizedBox(height: 8),
//                         _buildTextField(passwordLengthController),
//                       ],
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),

//           const SizedBox(height: 20),
//           _label("Max File Upload Size (MB)"),
//           const SizedBox(height: 8),
//           _buildTextField(fileUploadSizeController),
//         ],
//       ),
//     );
//   }

//   // --------------------------- NOTIFICATIONS TAB --------------------------- //
//   Widget _buildNotificationsCard(bool isMobile, double width) {
//   return Container(
//     decoration: _cardDecoration(),
//     padding: EdgeInsets.symmetric(
//       horizontal: isMobile ? 16 : 24,
//       vertical: isMobile ? 18 : 26,
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _title("Notification Settings"),
//         const SizedBox(height: 20),

//         _buildToggleRow(
//           "Enable System Notifications",
//           enableSystemNotifications,
//           (v) => setState(() => enableSystemNotifications = v),
//         ),

//         const SizedBox(height: 20),

//         const Text(
//           "Active Notification Channels",
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//         ),
//         const SizedBox(height: 12),

//         Wrap(
//           spacing: 12,
//           runSpacing: 12,
//           children: [
//             _pill("Email"),
//             _pill("SMS"),
//             _pill("Push Notifications"),
//             _pill("In-App"),
//           ],
//         ),
//       ],
//     ),
//   );
// }


//   // --------------------------- BACKUP TAB --------------------------- //
//   Widget _buildComingSoon() {
//     return Container(
//       decoration: _cardDecoration(),
//       padding: const EdgeInsets.all(32),
//       child: const Center(
//         child: Text(
//           "This module will be added soon...",
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//         ),
//       ),
//     );
//   }

//   // --------------------------- MOBILE FOOTER BUTTONS --------------------------- //
//   Widget _buildFooterButtons() {
//     return Row(
//       children: [
//         Expanded(
//           child: SizedBox(
//             height: 46,
//             child: CustomButton(
//               text: "Reset to Default",
//               onPressed: () {},
//             ),
//           ),
//         ),
//         const SizedBox(width: 12),
//         Expanded(
//           child: SizedBox(
//             height: 46,
//             child: CustomButton(
//               text: "Save Changes",
//               onPressed: () {},
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   // --------------------------- HELPERS --------------------------- //
//   BoxDecoration _cardDecoration() {
//     return BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(14),
//       border: Border.all(color: Colors.grey.shade200),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.black.withOpacity(0.04),
//           blurRadius: 14,
//           offset: const Offset(0, 8),
//         ),
//       ],
//     );
//   }

//   Widget _label(String text) => Text(text, style: const TextStyle(fontSize: 16));

//   Widget _title(String text) => Text(
//         text,
//         style: const TextStyle(
//           fontSize: 26,
//           fontWeight: FontWeight.w800,
//           color: Color(0xFF0F1724),
//         ),
//       );

//   //------------------ Toggle Row ------------------//
//   Widget _buildToggleRow(String label, bool value, ValueChanged<bool> onChanged) {
//     return Row(
//       children: [
//         Expanded(
//           child: Text(label, style: const TextStyle(fontSize: 16)),
//         ),
//         Switch(value: value, onChanged: onChanged),
//       ],
//     );
//   }

//   //------------------ TextField ------------------//
//   Widget _buildTextField(TextEditingController controller) {
//     return TextField(
//       controller: controller,
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: Colors.white,
//         contentPadding:
//             const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide(color: Colors.grey.shade200),
//         ),
//       ),
//     );
//   }

//   //------------------ Pill Chip ------------------//
//   Widget _pill(String text) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
//       decoration: BoxDecoration(
//         color: const Color(0xFFF0F2F5),
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.04),
//             blurRadius: 4,
//             offset: const Offset(0, 2),
//           )
//         ],
//       ),
//       child: Text(
//         text,
//         style: const TextStyle(
//           fontSize: 14,
//           fontWeight: FontWeight.w600,
//         ),
//       ),
//     );
//   }
// }

// lib/pages/system_setting_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_healthcare_demo/widgets/custom_button.dart';
import 'package:flutter_healthcare_demo/utils/responsive.dart';

class SystemSettingsPage extends StatefulWidget {
  const SystemSettingsPage({super.key});

  @override
  State<SystemSettingsPage> createState() => _SystemSettingsPageState();
}

class _SystemSettingsPageState extends State<SystemSettingsPage> {
  int _selectedTab = 0;

  final List<String> _tabs = [
    "General",
    "Security",
    "Notifications",
    "Backup & Maintenance",
  ];

  // General Tab States
  bool maintenanceMode = false;
  bool enableUserRegistration = true;
  bool enablePayment = true;

  final TextEditingController maxAppointmentsController =
      TextEditingController(text: "50");
  final TextEditingController defaultDurationController =
      TextEditingController(text: "30");
  final TextEditingController timeZoneController =
      TextEditingController(text: "Asia/Kolkata");
  final TextEditingController emergencyEmailController =
      TextEditingController(text: "admin@healthcare.com");

  // Security Tab States
  bool enableAuditLogging = true;
  bool requireTwoFactor = false;

  final TextEditingController sessionTimeoutController =
      TextEditingController(text: "30");
  final TextEditingController minPasswordLengthController =
      TextEditingController(text: "8");
  final TextEditingController maxFileUploadController =
      TextEditingController(text: "10");

  // Notifications Tab State
  bool enableSystemNotifications = true;
  List<String> selectedChannels = ["Email", "SMS", "Push Notifications", "In-App"];

  // Backup & Maintenance Tab State
  final TextEditingController backupFrequencyController =
      TextEditingController(text: "daily");
  final TextEditingController dataRetentionController =
      TextEditingController(text: "90");

  @override
  Widget build(BuildContext context) {
    final bool isMobile = AppResponsive.isMobile(context);
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 16 : 28,
          vertical: isMobile ? 20 : 30,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(isMobile),

                const SizedBox(height: 18),
                _buildTabs(width),
                const SizedBox(height: 18),

                // TAB VIEWS
                if (_selectedTab == 0) _buildGeneralCard(isMobile, width),
                if (_selectedTab == 1) _buildSecurityCard(isMobile, width),
                if (_selectedTab == 2) _buildNotificationCard(isMobile, width),
                if (_selectedTab == 3) _buildBackupCard(isMobile, width),

                const SizedBox(height: 20),

                if (isMobile) _buildMobileBottomButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //────────────────────────────────────────────
  // TOP HEADER WITH BUTTONS
  //────────────────────────────────────────────
  Widget _buildHeader(bool isMobile) {
    return Row(
      children: [
        const Expanded(
          child: Text(
            "System Settings",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w800,
              color: Color(0xFF0F1724),
            ),
          ),
        ),

        if (!isMobile) ...[
          SizedBox(
            width: 170,
            height: 46,
            child: CustomButton(
              text: "Reset to Default",
              onPressed: () {},
            ),
          ),
          const SizedBox(width: 14),
          SizedBox(
            width: 150,
            height: 46,
            child: CustomButton(
              text: "Save Changes",
              onPressed: () {},
            ),
          ),
        ],
      ],
    );
  }

  //────────────────────────────────────────────
  // TABS
  //────────────────────────────────────────────
  Widget _buildTabs(double availableWidth) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(_tabs.length, (index) {
            final bool selected = _selectedTab == index;
            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: GestureDetector(
                onTap: () => setState(() => _selectedTab = index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 22, vertical: 10),
                  decoration: BoxDecoration(
                    color: selected ? Colors.white : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: selected
                        ? [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.06),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            )
                          ]
                        : null,
                  ),
                  child: Text(
                    _tabs[index],
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight:
                          selected ? FontWeight.w700 : FontWeight.w600,
                      color: selected ? Colors.black87 : Colors.grey.shade700,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  //────────────────────────────────────────────
  // GENERAL TAB
  //────────────────────────────────────────────
  Widget _buildGeneralCard(bool isMobile, double width) {
    return _card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title("General Configuration"),
          const SizedBox(height: 24),

          _buildToggleRow("Maintenance Mode", maintenanceMode,
              (v) => setState(() => maintenanceMode = v)),
          const SizedBox(height: 12),

          _buildToggleRow("Enable User Registration", enableUserRegistration,
              (v) => setState(() => enableUserRegistration = v)),
          const SizedBox(height: 12),

          _buildToggleRow(
              "Enable Payment Processing",
              enablePayment,
              (v) => setState(() => enablePayment = v)),
          const SizedBox(height: 24),

          LayoutBuilder(builder: (context, constraints) {
            final bool narrow = constraints.maxWidth < 700;

            if (narrow) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _label("Max Appointments/Day"),
                  _buildTextField(maxAppointmentsController),
                  const SizedBox(height: 16),
                  _label("Default Duration (min)"),
                  _buildTextField(defaultDurationController),
                ],
              );
            }

            return Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _label("Max Appointments/Day"),
                      _buildTextField(maxAppointmentsController),
                    ],
                  ),
                ),
                const SizedBox(width: 28),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _label("Default Duration (min)"),
                      _buildTextField(defaultDurationController),
                    ],
                  ),
                )
              ],
            );
          }),
          const SizedBox(height: 24),

          _label("System Time Zone"),
          _buildTextField(timeZoneController),
          const SizedBox(height: 24),

          _label("Emergency Contact Email"),
          _buildTextField(emergencyEmailController),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  //────────────────────────────────────────────
  // SECURITY TAB
  //────────────────────────────────────────────
  Widget _buildSecurityCard(bool isMobile, double width) {
    return _card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title("Security Settings"),
          const SizedBox(height: 24),

          _buildToggleRow("Enable Audit Logging", enableAuditLogging,
              (v) => setState(() => enableAuditLogging = v)),
          const SizedBox(height: 12),

          _buildToggleRow(
              "Require Two-Factor Authentication",
              requireTwoFactor,
              (v) => setState(() => requireTwoFactor = v)),
          const SizedBox(height: 24),

          LayoutBuilder(builder: (context, constraints) {
            final narrow = constraints.maxWidth < 700;
            if (narrow) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _label("Session Timeout (minutes)"),
                  _buildTextField(sessionTimeoutController),
                  const SizedBox(height: 16),
                  _label("Minimum Password Length"),
                  _buildTextField(minPasswordLengthController),
                ],
              );
            }

            return Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _label("Session Timeout (minutes)"),
                      _buildTextField(sessionTimeoutController),
                    ],
                  ),
                ),
                const SizedBox(width: 28),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _label("Minimum Password Length"),
                      _buildTextField(minPasswordLengthController),
                    ],
                  ),
                )
              ],
            );
          }),

          const SizedBox(height: 24),

          _label("Max File Upload Size (MB)"),
          _buildTextField(maxFileUploadController),
        ],
      ),
    );
  }

  //────────────────────────────────────────────
  // NOTIFICATION TAB
  //────────────────────────────────────────────
  Widget _buildNotificationCard(bool isMobile, double width) {
    return _card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title("Notification Settings"),
          const SizedBox(height: 24),

          _buildToggleRow(
            "Enable System Notifications",
            enableSystemNotifications,
            (v) => setState(() => enableSystemNotifications = v),
          ),
          const SizedBox(height: 24),

          _label("Active Notification Channels"),
          const SizedBox(height: 12),

          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _chip("Email"),
              _chip("SMS"),
              _chip("Push Notifications"),
              _chip("In-App"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _chip(String label) {
    final bool selected = selectedChannels.contains(label);
    return GestureDetector(
      onTap: () {
        setState(() {
          if (selected) {
            selectedChannels.remove(label);
          } else {
            selectedChannels.add(label);
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF2563EB).withOpacity(0.15) : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: selected ? const Color(0xFF2563EB) : Colors.grey.shade300),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: selected ? const Color(0xFF2563EB) : Colors.black87,
          ),
        ),
      ),
    );
  }

  //────────────────────────────────────────────
  // BACKUP TAB
  //────────────────────────────────────────────
  Widget _buildBackupCard(bool isMobile, double width) {
    return _card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title("Backup & Maintenance"),
          const SizedBox(height: 24),

          _label("Backup Frequency"),
          _buildTextField(backupFrequencyController),
          const SizedBox(height: 24),

          _label("Data Retention Period (days)"),
          _buildTextField(dataRetentionController),
          const SizedBox(height: 24),

          Divider(color: Colors.grey.shade300),
          const SizedBox(height: 20),

          _label("System Status"),
          const SizedBox(height: 18),

          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _statusPill("Database: Online"),
              _statusPill("Storage: Online"),
              _statusPill("Payment Gateway: Online"),
              _statusPill("Notifications: Online"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _statusPill(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  //────────────────────────────────────────────
  // MOBILE BOTTOM BUTTONS
  //────────────────────────────────────────────
  Widget _buildMobileBottomButtons() {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 46,
            child: CustomButton(
              text: "Reset to Default",
              onPressed: () {},
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: SizedBox(
            height: 46,
            child: CustomButton(
              text: "Save Changes",
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }

  //────────────────────────────────────────────
  // COMMON UI HELPERS
  //────────────────────────────────────────────
  Widget _card({required Widget child}) {
    return Container(
      decoration: _cardDecoration(),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 26),
      child: child,
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: Colors.grey.shade200),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.04),
          blurRadius: 14,
          offset: const Offset(0, 8),
        )
      ],
    );
  }

  Widget _title(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w800,
        color: Color(0xFF0F1724),
      ),
    );
  }

  Widget _label(String label) {
    return Text(
      label,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    );
  }

  Widget _buildToggleRow(
      String label, bool value, ValueChanged<bool> onChanged) {
    return Row(
      children: [
        Expanded(
          child: Text(label, style: const TextStyle(fontSize: 16)),
        ),
        Switch(value: value, onChanged: onChanged),
      ],
    );
  }

  Widget _buildTextField(TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
      ),
    );
  }
}
