import 'package:flutter/material.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool visibility = true;
  int selectedRole = 0;

  final roles = ['Customer', 'Barber', 'Admin'];

  final bgColor = const Color(0xFFFCFCFA);
  final green = const Color(0xFF1F5C46);
  final lightGreen = const Color(0xFFF1F6F3);
  final disabledGreen = const Color(0xFF9BB5A9);
  final darkText = const Color(0xFF151A18);
  final greyText = const Color(0xFF6B7370);
  final hintColor = const Color(0xFF9AA09D);
  final borderColor = const Color(0xFFE8EAE6);
  final tabBgColor = const Color(0xFFF1F3F0);

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // ---------- actions ----------

  void goToRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegisterScreen()),
    );
  }

  void login() {
    // runs the validators of both text fields
    if (!formKey.currentState!.validate()) return;

    // TODO: call your real login (Firebase / API) here
    showMessage("Logging in as ${roles[selectedRole]}...");
  }

  void showMessage(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  // ---------- small reusable pieces ----------

  Widget roleCard(int index, IconData icon, String label) {
    bool selected = selectedRole == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedRole = index;
          });
        },
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: selected ? lightGreen : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              width: selected ? 2 : 1,
              color: selected ? green : borderColor,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 22, color: selected ? green : greyText),
              const SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Times New Roman',
                  fontWeight: FontWeight.bold,
                  color: selected ? green : greyText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget fieldLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFF5F6663),
        fontSize: 13,
        fontFamily: 'Times New Roman',
        fontWeight: FontWeight.bold,
      ),
    );
  }

  OutlineInputBorder border(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(width: 1, color: color),
    );
  }

  InputDecoration inputDecoration(IconData icon, String hint, {Widget? suffix}) {
    return InputDecoration(
      prefixIcon: Icon(icon, color: greyText),
      suffixIcon: suffix,
      hintText: hint,
      hintStyle: TextStyle(color: hintColor, fontSize: 15),
      contentPadding: const EdgeInsets.symmetric(vertical: 18),
      enabledBorder: border(borderColor),
      focusedBorder: border(green),
      errorBorder: border(Colors.red),
      focusedErrorBorder: border(Colors.red),
      filled: true,
      fillColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isFormReady =
        emailController.text.isNotEmpty && passwordController.text.isNotEmpty;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                // logo
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        "assets/images/logo.png",
                        height: 44,
                        width: 44,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      "KapalTime",
                      style: TextStyle(
                        color: green,
                        fontSize: 16,
                        fontFamily: 'Times New Roman',
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                Text(
                  "WELCOME",
                  style: TextStyle(
                    color: green,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Times New Roman',
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Good to see you.",
                  style: TextStyle(
                    color: darkText,
                    fontSize: 34,
                    fontFamily: 'Times New Roman',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Choose your role, then sign in.",
                  style: TextStyle(
                    color: greyText,
                    fontFamily: 'Times New Roman',
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 24),

                // Log in / Register tabs
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: tabBgColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      // Log in tab (this is the current page, so it is always selected)
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
                                color: darkText,
                                fontSize: 14,
                                fontFamily: 'Times New Roman',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Register tab -> opens the register page
                      Expanded(
                        child: GestureDetector(
                          onTap: goToRegister,
                          child: Container(
                            height: 44,
                            color: Colors.transparent,
                            child: Center(
                              child: Text(
                                "Register",
                                style: TextStyle(
                                  color: greyText,
                                  fontSize: 14,
                                  fontFamily: 'Times New Roman',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 14),

                // role cards
                Row(
                  children: [
                    roleCard(0, Icons.person_outline, "Customer"),
                    const SizedBox(width: 10),
                    roleCard(1, Icons.storefront_outlined, "Barber"),
                    const SizedBox(width: 10),
                    roleCard(2, Icons.gpp_good_outlined, "Admin"),
                  ],
                ),

                const SizedBox(height: 20),

                fieldLabel("Email"),
                const SizedBox(height: 8),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  onChanged: (value) {
                    setState(() {});
                  },
                  validator: (value) {
                    final email = (value ?? "").trim();
                    if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(email)) {
                      return "Enter a valid email";
                    }
                    return null;
                  },
                  decoration: inputDecoration(Icons.mail_outline, "you@email.com"),
                ),

                const SizedBox(height: 16),

                fieldLabel("Password"),
                const SizedBox(height: 8),
                TextFormField(
                  controller: passwordController,
                  obscureText: visibility,
                  textInputAction: TextInputAction.done,
                  onChanged: (value) {
                    setState(() {});
                  },
                  onFieldSubmitted: (value) {
                    if (isFormReady) login();
                  },
                  validator: (value) {
                    if ((value ?? "").length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    return null;
                  },
                  decoration: inputDecoration(
                    Icons.key_outlined,
                    "Enter your password",
                    suffix: IconButton(
                      onPressed: () {
                        setState(() {
                          visibility = !visibility;
                        });
                      },
                      icon: Icon(
                        visibility ? Icons.visibility_off : Icons.visibility,
                        color: greyText,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      // TODO: open a forgot password page
                      showMessage("Forgot password is coming soon");
                    },
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(
                        color: green,
                        fontSize: 13,
                        fontFamily: 'Times New Roman',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Log in button (always says "Log in")
                SizedBox(
                  height: 54,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: green,
                      foregroundColor: Colors.white,
                      disabledBackgroundColor: disabledGreen,
                      disabledForegroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    // null = button is disabled until both fields are filled
                    onPressed: isFormReady ? login : null,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Log in",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.login, size: 20),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                Row(
                  children: [
                    Expanded(child: Container(height: 1, color: borderColor)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "or",
                        style: TextStyle(color: hintColor, fontSize: 11),
                      ),
                    ),
                    Expanded(child: Container(height: 1, color: borderColor)),
                  ],
                ),

                const SizedBox(height: 16),

                SizedBox(
                  height: 54,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: darkText,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(width: 1, color: borderColor),
                      ),
                    ),
                    onPressed: () {
                      // TODO: add Google sign-in here
                      showMessage("Google sign-in is coming soon");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/google_logo.png",
                          height: 20,
                          width: 20,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "Continue with Google",
                          style: TextStyle(
                            color: darkText,
                            fontSize: 15,
                            fontFamily: 'Times New Roman',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}