import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Controllers for text boxes
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Simple state variables
  bool visibility = true; // true = hide password, false = show password
  int selectedRole = 0; // 0 = Customer, 1 = Barber (Admin cannot register)

  // Colors from the design
  Color bgColor = Color(0xFFFCFCFA);
  Color green = Color(0xFF1F5C46);
  Color lightGreen = Color(0xFFF1F6F3);
  Color disabledGreen = Color(0xFF9BB5A9);
  Color darkText = Color(0xFF151A18);
  Color greyText = Color(0xFF6B7370);
  Color hintColor = Color(0xFF9AA09D);
  Color borderColor = Color(0xFFE8EAE6);
  Color tabBgColor = Color(0xFFF1F3F0);
  Color disabledCardColor = Color(0xFFF1F3F0);
  Color disabledTextColor = Color(0xFFD0D4D1);

  @override
  Widget build(BuildContext context) {
    // Check if name, email, and password are all filled
    bool isFormReady = false;
    if (nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      isFormReady = true;
    }

    // Create account button color
    Color submitColor = disabledGreen;
    if (isFormReady == true) {
      submitColor = green;
    }

    // Customer role card colors (enabled)
    Color customerBg = Colors.white;
    Color customerBorder = borderColor;
    double customerBorderWidth = 1;
    Color customerColor = greyText;
    if (selectedRole == 0) {
      customerBg = lightGreen;
      customerBorder = green;
      customerBorderWidth = 2;
      customerColor = green;
    }

    // Barber role card colors (enabled)
    Color barberBg = Colors.white;
    Color barberBorder = borderColor;
    double barberBorderWidth = 1;
    Color barberColor = greyText;
    if (selectedRole == 1) {
      barberBg = lightGreen;
      barberBorder = green;
      barberBorderWidth = 2;
      barberColor = green;
    }

    // Admin role card colors (disabled on Register page)
    Color adminBg = Colors.white;
    Color adminBorder = disabledCardColor;
    double adminBorderWidth = 1;
    Color adminColor = disabledTextColor;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),

              // 1. LOGO AND APP NAME
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      "assets/images/logo.png",
                      height: 44,
                      width: 44,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 44,
                          width: 44,
                          color: lightGreen,
                          child: Icon(Icons.image, color: green, size: 22),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 12),
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

              SizedBox(height: 40),

              // 2. HEADING TEXT
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
              SizedBox(height: 8),
              Text(
                "Create your account.",
                style: TextStyle(
                  color: darkText,
                  fontSize: 34,
                  fontFamily: 'Times New Roman',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "A few details and you’re ready to get started.",
                style: TextStyle(
                  color: greyText,
                  fontFamily: 'Times New Roman',
                  fontSize: 15,
                ),
              ),

              SizedBox(height: 24),

              // 3. LOG IN / REGISTER TABS
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: tabBgColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    // Log in tab (goes back to LoginScreen)
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 44,
                          decoration: BoxDecoration(
                            color: tabBgColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
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
                    // Register tab (active on this screen)
                    Expanded(
                      flex: 1,
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

              SizedBox(height: 14),

              // 4. ROLE SELECTOR CARDS
              Row(
                children: [
                  // Customer card
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedRole = 0;
                        });
                      },
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                          color: customerBg,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            width: customerBorderWidth,
                            color: customerBorder,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.person_outline, size: 22, color: customerColor),
                            SizedBox(height: 8),
                            Text(
                              "Customer",
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Times New Roman',
                                fontWeight: FontWeight.bold,
                                color: customerColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),

                  // Barber card
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedRole = 1;
                        });
                      },
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                          color: barberBg,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            width: barberBorderWidth,
                            color: barberBorder,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.storefront_outlined, size: 22, color: barberColor),
                            SizedBox(height: 8),
                            Text(
                              "Barber",
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Times New Roman',
                                fontWeight: FontWeight.bold,
                                color: barberColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),

                  // Admin card (not active for registration)
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: adminBg,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          width: adminBorderWidth,
                          color: adminBorder,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.gpp_good_outlined, size: 22, color: adminColor),
                          SizedBox(height: 8),
                          Text(
                            "Admin",
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Times New Roman',
                              fontWeight: FontWeight.bold,
                              color: adminColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              // 5. FULL NAME INPUT
              Text(
                "Full name",
                style: TextStyle(
                  color: Color(0xFF5F6663),
                  fontSize: 13,
                  fontFamily: 'Times New Roman',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: nameController,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person_outline, color: greyText),
                  hintText: "Your name",
                  hintStyle: TextStyle(color: hintColor, fontSize: 15),
                  contentPadding: EdgeInsets.symmetric(vertical: 18),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(width: 1, color: borderColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(width: 1, color: green),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),

              SizedBox(height: 16),

              // 6. EMAIL INPUT
              Text(
                "Email",
                style: TextStyle(
                  color: Color(0xFF5F6663),
                  fontSize: 13,
                  fontFamily: 'Times New Roman',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: emailController,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail_outline, color: greyText),
                  hintText: "you@email.com",
                  hintStyle: TextStyle(color: hintColor, fontSize: 15),
                  contentPadding: EdgeInsets.symmetric(vertical: 18),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(width: 1, color: borderColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(width: 1, color: green),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),

              SizedBox(height: 16),

              // 7. PASSWORD INPUT
              Text(
                "Password",
                style: TextStyle(
                  color: Color(0xFF5F6663),
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: passwordController,
                obscureText: visibility,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.key_outlined, color: greyText),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        if (visibility == true) {
                          visibility = false;
                        } else {
                          visibility = true;
                        }
                      });
                    },
                    icon: Icon(
                      visibility == true ? Icons.visibility_off : Icons.visibility,
                      color: greyText,
                    ),
                  ),
                  hintText: "Enter your password",
                  hintStyle: TextStyle(color: hintColor, fontSize: 15),
                  contentPadding: EdgeInsets.symmetric(vertical: 18),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(width: 1, color: borderColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(width: 1, color: green),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),

              SizedBox(height: 24),

              // 8. CREATE ACCOUNT BUTTON
              SizedBox(
                height: 54,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: submitColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    // Register code here
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Create account",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.login, color: Colors.white, size: 20),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
