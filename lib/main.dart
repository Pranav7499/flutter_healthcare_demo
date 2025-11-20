// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter_healthcare_demo/pages/auth_page.dart';
// import 'dart:convert';

// class AuthPage extends StatefulWidget {
//   const AuthPage({super.key});

//   @override
//   State<AuthPage> createState() => _AuthPageState();
// }

// class _AuthPageState extends State<AuthPage> with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _isLoading = false;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//   }

//   Future<void> _login() async {
//     final email = _emailController.text.trim();
//     final password = _passwordController.text.trim();

//     if (email.isEmpty || password.isEmpty) {
//       _showSnack("Please enter both fields");
//       return;
//     }

//     setState(() => _isLoading = true);

//     try {
//       final url = Uri.parse('https://dummyjson.com/auth/login');
//       final response = await http.post(
//         url,
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'username': email, 'password': password}),
//       );

//       if (!mounted) return;

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         if (data['token'] != null) {
//           _showSnack("Login successful ✅");
//           Navigator.pushReplacementNamed(context, '/dashboard');
//         }
//       } else {
//         _showSnack("Invalid credentials ❌");
//       }
//     } catch (e) {
//       _showSnack("Error: $e");
//     } finally {
//       setState(() => _isLoading = false);
//     }
//   }

//   void _showSnack(String msg) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF6F7FB), // light gray background
//       body: Center(
//         child: SingleChildScrollView(
//           child: Container(
//             width: 400,
//             padding: const EdgeInsets.all(24),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(16),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black12,
//                   blurRadius: 20,
//                   offset: const Offset(0, 10),
//                 ),
//               ],
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const Text(
//                   "Welcome to HealthCare Platform",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black87,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 const Text(
//                   "Access comprehensive healthcare services and manage your health journey",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Colors.black54,
//                     fontSize: 14,
//                   ),
//                 ),
//                 const SizedBox(height: 24),
//                 Container(
//                   decoration: BoxDecoration(
//                     color: const Color(0xFFF5F6F8),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: TabBar(
//                     controller: _tabController,
//                     labelColor: Colors.white,
//                     unselectedLabelColor: Colors.black54,
//                     indicator: BoxDecoration(
//                       color: Colors.blue.shade600,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     tabs: const [
//                       Tab(text: "Sign In"),
//                       Tab(text: "Sign Up"),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 24),
//                 SizedBox(
//                   height: 280,
//                   child: TabBarView(
//                     controller: _tabController,
//                     children: [
//                       _buildLoginForm(),
//                       _buildSignupPlaceholder(),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildLoginForm() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text("Email", style: TextStyle(fontWeight: FontWeight.w600)),
//         const SizedBox(height: 8),
//         TextField(
//           controller: _emailController,
//           decoration: InputDecoration(
//             hintText: "Enter your email",
//             prefixIcon: const Icon(Icons.email_outlined),
//             filled: true,
//             fillColor: const Color(0xFFF8F9FB),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: BorderSide.none,
//             ),
//           ),
//         ),
//         const SizedBox(height: 20),
//         const Text("Password", style: TextStyle(fontWeight: FontWeight.w600)),
//         const SizedBox(height: 8),
//         TextField(
//           controller: _passwordController,
//           obscureText: true,
//           decoration: InputDecoration(
//             hintText: "Enter your password",
//             prefixIcon: const Icon(Icons.lock_outline),
//             filled: true,
//             fillColor: const Color(0xFFF8F9FB),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: BorderSide.none,
//             ),
//           ),
//         ),
//         const SizedBox(height: 30),
//         SizedBox(
//           width: double.infinity,
//           child: ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.blue.shade600,
//               padding: const EdgeInsets.symmetric(vertical: 16),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//             ),
//             onPressed: _isLoading ? null : _login,
//             child: _isLoading
//                 ? const CircularProgressIndicator(color: Colors.white)
//                 : const Text("Sign In", style: TextStyle(fontSize: 16)),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildSignupPlaceholder() {
//     return const Center(
//       child: Text(
//         "Sign Up form coming soon...",
//         style: TextStyle(color: Colors.black54),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
// import 'package:flutter_healthcare_demo/pages/auth_page.dart';
//import 'package:flutter_healthcare_demo/pages/doctor_list_page.dart';
import 'package:flutter_healthcare_demo/widgets/video_consultation_card.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Healthcare Platform',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const TestWidgetPage(),
 // Start with your AuthPage
      routes: {
        '/dashboard': (context) => const DashboardPage(),
      },
    );
  }
}

// Temporary placeholder for dashboard screen
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard")),
      body: const Center(child: Text("Welcome to the Dashboard!")),
    );
  }
}

class TestWidgetPage extends StatelessWidget {
  const TestWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      body: Center(
        child: VideoConsultationCard(
          onVideoCall: () {
            print("Video call start");
          },
          onAudioCall: () {
            print("Audio call start");
          },
        ),
      ),
    );
  }
}

