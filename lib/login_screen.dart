import 'package:flutter/material.dart';

import '../constants/app_images.dart';
import '../widgets/social_media_card.dart';
import '../widgets/role_card.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool visibility = true;
  int selectedRole = 0;

  List<String> roles = ['Customer', 'Barber', 'Admin'];

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Open the registration screen
  void goToRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const RegisterScreen(),
      ),
    );
  }

  // Login button action
  void login() {
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Logging in as ${roles[selectedRole]}"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isFormReady = emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;

    return Scaffold(
      backgroundColor: Color(0xFFFCFCFA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),

                  // Logo
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          AppImages.logo,
                          height: 44,
                          width: 44,
                        ),
                      ),
                      SizedBox(width: 12),
                      Text(
                        "KapalTime",
                        style: TextStyle(
                          color: Color(0xFF1F5C46),
                          fontSize: 16,
                          fontFamily: 'Times New Roman',
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 40),

                  Text(
                    "WELCOME",
                    style: TextStyle(
                      color: Color(0xFF1F5C46),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    "Good to see you.",
                    style: TextStyle(
                      color: Color(0xFF151A18),
                      fontSize: 34,
                      fontFamily: 'Times New Roman',
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    "Choose your role, then sign in.",
                    style: TextStyle(
                      color: Color(0xFF6B7370),
                      fontSize: 15,
                    ),
                  ),

                  SizedBox(height: 24),

                  // Login and Register tabs
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Color(0xFFF1F3F0),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 44,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                "Log in",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),

                        Expanded(
                          child: GestureDetector(
                            onTap: goToRegister,
                            child: Container(
                              height: 44,
                              color: Colors.transparent,
                              child: Center(
                                child: Text("Register"),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 14),

                  // Choose a role
                  Row(
                    children: [
                      RoleCard(
                        label: "Customer",
                        icon: Icons.person_outline,
                        selected: selectedRole == 0,
                        onTap: () {
                          setState(() {
                            selectedRole = 0;
                          });
                        },
                      ),

                      SizedBox(width: 10),

                      RoleCard(
                        label: "Barber",
                        icon: Icons.storefront_outlined,
                        selected: selectedRole == 1,
                        onTap: () {
                          setState(() {
                            selectedRole = 1;
                          });
                        },
                      ),

                      SizedBox(width: 10),

                      RoleCard(
                        label: "Admin",
                        icon: Icons.gpp_good_outlined,
                        selected: selectedRole == 2,
                        onTap: () {
                          setState(() {
                            selectedRole = 2;
                          });
                        },
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  // Email
                  Text(
                    "Email",
                    style: TextStyle(
                      color: Color(0xFF5F6663),
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),

                  SizedBox(height: 8),

                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      setState(() {});
                    },
                    validator: (value) {
                      String email = (value ?? "").trim();

                      if (!RegExp(
                        r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                      ).hasMatch(email)) {
                        return "Enter a valid email";
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.mail_outline),
                      hintText: "you@email.com",
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(vertical: 18),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: Color(0xFFE8EAE6),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: Color(0xFF1F5C46),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 16),

                  // Password
                  Text(
                    "Password",
                    style: TextStyle(
                      color: Color(0xFF5F6663),
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),

                  SizedBox(height: 8),

                  TextFormField(
                    controller: passwordController,
                    obscureText: visibility,
                    onChanged: (value) {
                      setState(() {});
                    },
                    onFieldSubmitted: (value) {
                      if (isFormReady) {
                        login();
                      }
                    },
                    validator: (value) {
                      if ((value ?? "").length < 6) {
                        return "Password must be at least 6 characters";
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.key_outlined),
                      hintText: "Enter your password",
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            visibility = !visibility;
                          });
                        },
                        icon: Icon(
                          visibility
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(vertical: 18),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: Color(0xFFE8EAE6),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: Color(0xFF1F5C46),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 12),

                  // Forgot password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Forgot password is coming soon",
                            ),
                          ),
                        );
                      },
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(
                          color: Color(0xFF1F5C46),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 16),

                  // Login button
                  SizedBox(
                    height: 54,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF1F5C46),
                        foregroundColor: Colors.white,
                        disabledBackgroundColor: Color(0xFF9BB5A9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: isFormReady ? login : null,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Log in"),
                          SizedBox(width: 8),
                          Icon(Icons.login),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 16),

                  // Divider
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Color(0xFFE8EAE6),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          "or",
                          style: TextStyle(
                            color: Color(0xFF9AA09D),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Color(0xFFE8EAE6),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16),

                  // Google button
                  SocialMediaCard(
                    image: AppImages.google,
                    label: "Continue with Google",
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Google sign-in is coming soon",
                          ),
                        ),
                      );
                    },
                  ),

                  SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}