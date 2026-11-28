
import 'package:flutter/material.dart';

void main() {
  runApp(const KapalTimeApp());
}

class KapalTimeApp extends StatelessWidget {
  const KapalTimeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KapalTime',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFCFDFC),
        fontFamily: 'Roboto',
      ),
      home: const ForgotPasswordScreen(),
    );
  }
}

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController =
  TextEditingController();

  final Color green = const Color(0xFF23694F);
  final Color lightGreen = const Color(0xFFDCEDE5);

  void sendResetLink() {
    String email = emailController.text.trim();

    if (email.isEmpty || !email.contains('@') || !email.contains('.')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid email address.'),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Password reset link requested!'),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(height: 16),

                // Logo and App Name
                Row(
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: green,
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: const Center(
                        child: Text(
                          'K',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    Text(
                      'KapalTime',
                      style: TextStyle(
                        color: green,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 49),

                // Back to Login
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back,
                        size: 18,
                        color: green,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Back to log in',
                        style: TextStyle(
                          color: green,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 72),

                // Email Icon
                Container(
                  height: 85,
                  width: 85,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F8F5),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Container(
                      height: 68,
                      width: 68,
                      decoration: BoxDecoration(
                        color: lightGreen,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        Icons.mail_outline,
                        size: 30,
                        color: green,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                // Password Reset Label
                Text(
                  'PASSWORD RESET',
                  style: TextStyle(
                    color: green,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.7,
                  ),
                ),

                const SizedBox(height: 9),

                // Main Heading
                const Text(
                  'Forgot your password?',
                  style: TextStyle(
                    fontSize: 29,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF101C22),
                    letterSpacing: -1.1,
                  ),
                ),

                const SizedBox(height: 9),

                // Description
                const Text(
                  "Enter the email linked to your account and we’ll send you a secure reset link.",
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.55,
                    color: Color(0xFF66747C),
                  ),
                ),

                const SizedBox(height: 27),

                // Email Label
                const Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF53636A),
                  ),
                ),

                const SizedBox(height: 7),

                // Email Input Field
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: green,
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: green.withOpacity(0.12),
                        blurRadius: 4,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 17,
                      ),
                      prefixIcon: Icon(
                        Icons.mail_outline,
                        color: green,
                        size: 19,
                      ),
                      hintText: 'you@email.com',
                      hintStyle: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF8A969B),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 17),

                // Send Reset Link Button
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: sendResetLink,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF9CB9AD),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      'Send reset link',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                // Privacy Text
                const Center(
                  child: Text(
                    "We’ll only use this email to help you recover your account.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 9,
                      color: Color(0xFF89969B),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
