import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool visibility = true;
  bool isLogin = true;
  int selectedRole = 0;

  Color bgColor = Color(0xFFFCFCFA);
  Color green = Color(0xFF1F5C46);
  Color lightGreen = Color(0xFFF1F6F3);
  Color disabledGreen = Color(0xFF9BB5A9);
  Color darkText = Color(0xFF151A18);
  Color greyText = Color(0xFF6B7370);
  Color hintColor = Color(0xFF9AA09D);
  Color borderColor = Color(0xFFE8EAE6);
  Color tabBgColor = Color(0xFFF1F3F0);

  @override
  Widget build(BuildContext context) {
    bool isFormReady = false;
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      isFormReady = true;
    }

    Color submitColor = disabledGreen;
    if (isFormReady) {
      submitColor = green;
    }

    String submitText = "Log in";
    if (!isLogin) {
      submitText = "Register";
    }

    Color loginBg = tabBgColor;
    Color loginTextColor = greyText;
    if (isLogin) {
      loginBg = Colors.white;
      loginTextColor = darkText;
    }

    Color registerBg = tabBgColor;
    Color registerTextColor = greyText;
    if (!isLogin) {
      registerBg = Colors.white;
      registerTextColor = darkText;
    }

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

    Color adminBg = Colors.white;
    Color adminBorder = borderColor;
    double adminBorderWidth = 1;
    Color adminColor = greyText;
    if (selectedRole == 2) {
      adminBg = lightGreen;
      adminBorder = green;
      adminBorderWidth = 2;
      adminColor = green;
    }

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),

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
                "Good to see you.",
                style: TextStyle(
                  color: darkText,
                  fontSize: 34,
                  fontFamily: 'Times New Roman',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Choose your role, then sign in.",
                style: TextStyle(
                  color: greyText,
                  fontFamily: 'Times New Roman',
                  fontSize: 15,
                ),
              ),

              SizedBox(height: 24),

              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: tabBgColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isLogin = true;
                          });
                        },
                        child: Container(
                          height: 44,
                          decoration: BoxDecoration(
                            color: loginBg,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              "Log in",
                              style: TextStyle(
                                color: loginTextColor,
                                fontSize: 14,
                                fontFamily: 'Times New Roman',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isLogin = false;
                          });
                        },
                        child: Container(
                          height: 44,
                          decoration: BoxDecoration(
                            color: registerBg,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              "Register",
                              style: TextStyle(
                                color: registerTextColor,
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

              SizedBox(height: 14),

              Row(
                children: [
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
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedRole = 2;
                        });
                      },
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
                  ),
                ],
              ),

              SizedBox(height: 20),

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
                        visibility = !visibility;
                      });
                    },
                    icon: Icon(
                      visibility ? Icons.visibility_off : Icons.visibility,
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

              SizedBox(height: 12),

              Align(
                alignment: Alignment.centerRight,
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

              SizedBox(height: 24),

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
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        submitText,
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

              SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(height: 1, color: borderColor),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      "or",
                      style: TextStyle(color: hintColor, fontSize: 11),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(height: 1, color: borderColor),
                  ),
                ],
              ),

              SizedBox(height: 16),

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
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/google_logo.png",
                        height: 20,
                        width: 20,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 10),
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

              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}