import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool visibility = true;
  int selectedRole = 0;

  final roles = ['Customer', 'Barber'];

  final bgColor = const Color(0xFFFCFCFA);
  final green = const Color(0xFF1F5C46);
  final lightGreen = const Color(0xFFF1F6F3);
  final disabledGreen = const Color(0xFF9BB5A9);
  final darkText = const Color(0xFF151A18);
  final greyText = const Color(0xFF6B7370);
  final hintColor = const Color(0xFF9AA09D);
  final borderColor = const Color(0xFFE8EAE6);
  final tabBgColor = const Color(0xFFF1F3F0);
  final disabledCardColor = const Color(0xFFF1F3F0);
  final disabledTextColor = const Color(0xFFD0D4D1);

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // ---------- actions ----------

  void goToLogin() {
    Navigator.pop(context); // goes back to the login page
  }

  void createAccount() {
    if (!formKey.currentState!.validate()) return;

    // TODO: call your real register (Firebase / API) here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Account created as ${roles[selectedRole]}")),
    );
    Navigator.pop(context); // back to login after registering
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

  // Admin cannot be chosen when registering, so it is greyed out and not tappable
  Widget disabledAdminCard() {
    return Expanded(
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(width: 1, color: disabledCardColor),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.gpp_good_outlined, size: 22, color: disabledTextColor),
            const SizedBox(height: 8),
            Text(
              "Admin",
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Times New Roman',
                fontWeight: FontWeight.bold,
                color: disabledTextColor,
              ),
            ),
          ],
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
    bool isFormReady = nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;

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
                  "Create your account.",
                  style: TextStyle(
                    color: darkText,
                    fontSize: 34,
                    fontFamily: 'Times New Roman',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "A few details and you’re ready to get started.",
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
                      // Log in tab -> goes back to login page
                      Expanded(
                        child: GestureDetector(
                          onTap: goToLogin,
                          child: Container(
                            height: 44,
                            color: Colors.transparent,
                            child: Center(
                              child: Text(
                                "Log in",
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
                      // Register tab (current page, always selected)
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
                                color: darkText,
                                fontSize: 14,
                                fontFamily: 'Times New Roman',
                                fontWeight: FontWeight.bold,
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
                    disabledAdminCard(),
                  ],
                ),

                const SizedBox(height: 20),

                fieldLabel("Full name"),
                const SizedBox(height: 8),
                TextFormField(
                  controller: nameController,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  onChanged: (value) {
                    setState(() {});
                  },
                  validator: (value) {
                    if ((value ?? "").trim().length < 2) {
                      return "Enter your name";
                    }
                    return null;
                  },
                  decoration: inputDecoration(Icons.person_outline, "Your name"),
                ),

                const SizedBox(height: 16),

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
                    if (isFormReady) createAccount();
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

                const SizedBox(height: 24),

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
                    // null = button is disabled until all fields are filled
                    onPressed: isFormReady ? createAccount : null,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Create account",
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

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}