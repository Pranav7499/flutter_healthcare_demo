import 'package:flutter/material.dart';
import 'package:flutter_healthcare_demo/utils/responsive.dart';
import 'package:flutter_healthcare_demo/widgets/custom_button.dart';

class DoctorVerificationPage extends StatelessWidget {
  const DoctorVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = AppResponsive.isMobile(context);
    final isTablet = AppResponsive.isTablet(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 16 : 28,
          vertical: isMobile ? 16 : 26,
        ),

        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1250),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 32,
                vertical: isMobile ? 22 : 32,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Colors.grey.shade200),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12.withOpacity(0.05),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // ---------------------------------------------
                  // HEADER (ICON + TITLE)
                  // -----------------------------
                  // 
                  // 
                  // ----------------
                 // ---------- RESPONSIVE HEADER (NO OVERFLOW) ----------
LayoutBuilder(
  builder: (context, constraints) {
    return Wrap(
      spacing: 12,
      runSpacing: 8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: const [
        Icon(
          Icons.verified_user_outlined,
          size: 30,
          color: Colors.black87,
        ),
        Text(
          "Doctor Verification Portal",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            color: Colors.black87,
          ),
        ),
      ],
    );
  },
),

                  const SizedBox(height: 10),

                  const Text(
                    "Verify doctor credentials using National Medical Register (NMR) ID",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                      height: 1.4,
                    ),
                  ),

                  const SizedBox(height: 35),

                  // ---------------------------------------------
                  // LABEL
                  // ---------------------------------------------
                  const Text(
                    "NMR ID / Registration Number",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),

                  const SizedBox(height: 14),

                  // ---------------------------------------------
                  // TEXTFIELD + BUTTON (Desktop = Row, Mobile = Column)
                  // ---------------------------------------------
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final bool useColumn = isMobile || constraints.maxWidth < 650;

                      if (useColumn) {
                        // ---------- MOBILE / TABLET LAYOUT ----------
                        return Column(
                          children: [
                            _buildTextField(),
                            const SizedBox(height: 14),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: CustomButton(
                                text: "Verify",
                                icon: Icons.search,
                                onPressed: () {},
                              ),
                            ),
                          ],
                        );
                      }

                      // ---------- DESKTOP LAYOUT ----------
                      return Row(
                        children: [
                          Expanded(child: _buildTextField()),
                          const SizedBox(width: 16),
                          SizedBox(
                            width: 140,
                            height: 50,
                            child: CustomButton(
                              text: "Verify",
                              icon: Icons.search,
                              onPressed: () {},
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // --------------------------------------------------
  // TEXTFIELD WIDGET
  // --------------------------------------------------
  Widget _buildTextField() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Enter NMR ID (e.g., NMR12345678)",
        filled: true,
        fillColor: const Color(0xFFF8F9FB),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.blue, width: 1.4),
        ),
      ),
    );
  }
}
