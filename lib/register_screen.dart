
import 'package:flutter/material.dart';

import '../constants/app_images.dart';
import '../widgets/role_card.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool visibility = true;
  int selectedRole = 0;

  List<String> roles = ['Customer', 'Barber'];

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Return to login screen
  void goToLogin() {
    Navigator.pop(context);
  }

  // Create account
  void createAccount() {
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Account created as ${roles[selectedRole]}",
          ),
        ),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isFormReady =
        firstNameController.text.isNotEmpty &&
            lastNameController.text.isNotEmpty &&
            phoneController.text.isNotEmpty &&
            emailController.text.isNotEmpty &&
            passwordController.text.isNotEmpty;

    return Scaffold(
      backgroundColor: Color(0xFFFCFCFA),

      // Adjust the screen when the keyboard opens
      resizeToAvoidBottomInset: true,

      body: SafeArea(
        child: SingleChildScrollView(
          // Allow scrolling and dismiss the keyboard when dragging
          physics: AlwaysScrollableScrollPhysics(),
          keyboardDismissBehavior:
          ScrollViewKeyboardDismissBehavior.onDrag,

          // Extra space below the last widget
          padding: EdgeInsets.only(bottom: 40),

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
                    "Create your account.",
                    style: TextStyle(
                      color: Color(0xFF151A18),
                      fontSize: 34,
                      fontFamily: 'Times New Roman',
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    "A few details and you're ready to get started.",
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
                          child: GestureDetector(
                            onTap: goToLogin,
                            child: Container(
                              height: 44,
                              color: Colors.transparent,
                              child: Center(
                                child: Text("Log in"),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 44,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                "Register",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
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

                      // Admin cannot register directly
                      RoleCard(
                        label: "Admin",
                        icon: Icons.gpp_good_outlined,
                        selected: false,
                        onTap: null,
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  // First name and last name
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "First name",
                              style: TextStyle(
                                color: Color(0xFF5F6663),
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),

                            SizedBox(height: 8),

                            TextFormField(
                              controller: firstNameController,
                              textCapitalization:
                              TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              onChanged: (value) {
                                setState(() {});
                              },
                              validator: (value) {
                                if ((value ?? "").trim().isEmpty) {
                                  return "Enter first name";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                prefixIcon:
                                Icon(Icons.person_outline),
                                hintText: "First name",
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding:
                                EdgeInsets.symmetric(
                                  vertical: 18,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(16),
                                  borderSide: BorderSide(
                                    color: Color(0xFFE8EAE6),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(16),
                                  borderSide: BorderSide(
                                    color: Color(0xFF1F5C46),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(width: 10),

                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Last name",
                              style: TextStyle(
                                color: Color(0xFF5F6663),
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),

                            SizedBox(height: 8),

                            TextFormField(
                              controller: lastNameController,
                              textCapitalization:
                              TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              onChanged: (value) {
                                setState(() {});
                              },
                              validator: (value) {
                                if ((value ?? "").trim().isEmpty) {
                                  return "Enter last name";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                prefixIcon:
                                Icon(Icons.person_outline),
                                hintText: "Last name",
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding:
                                EdgeInsets.symmetric(
                                  vertical: 18,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(16),
                                  borderSide: BorderSide(
                                    color: Color(0xFFE8EAE6),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(16),
                                  borderSide: BorderSide(
                                    color: Color(0xFF1F5C46),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16),

                  // Phone number
                  Text(
                    "Phone number",
                    style: TextStyle(
                      color: Color(0xFF5F6663),
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),

                  SizedBox(height: 8),

                  TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    onChanged: (value) {
                      setState(() {});
                    },
                    validator: (value) {
                      if ((value ?? "").trim().length < 7) {
                        return "Enter a valid phone number";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone_outlined),
                      hintText: "Enter your phone number",
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 18),
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
                    textInputAction: TextInputAction.next,
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
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 18),
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
                    textInputAction: TextInputAction.done,
                    onChanged: (value) {
                      setState(() {});
                    },
                    onFieldSubmitted: (value) {
                      if (isFormReady) {
                        createAccount();
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
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 18),
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

                  SizedBox(height: 24),

                  // Create account button
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
                      onPressed:
                      isFormReady ? createAccount : null,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Create account"),
                          SizedBox(width: 8),
                          Icon(Icons.login),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 12),

                  // Already have an account?
                  Center(
                    child: TextButton(
                      onPressed: goToLogin,
                      child: Text(
                        "Already have an account? Log in",
                        style: TextStyle(
                          color: Color(0xFF1F5C46),
                          fontSize: 14,
                          fontFamily: 'Times New Roman',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
