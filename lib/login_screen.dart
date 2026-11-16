import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool visibility = true; // hide pass
  bool isLogin = true; // true for Login, false for Register
  int selectedRole = 0; // 0 = Customer, 1 = Barber, 2 = Admin

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFCFA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),

                // ---------- LOGO ----------
                Row(
                  children: [
                    // TODO: later replace this Container with your logo image:
                    // Image.asset('assets/images/logo.png', height: 44, width: 44)
                    Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                        color: Color(0xFF1F5C46),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'K',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Text(
                      'KapalTime',
                      style: TextStyle(
                        color: Color(0xFF1F5C46),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 40),

                // ---------- HEADING ----------
                Text(
                  'WELCOME',
                  style: TextStyle(
                    color: Color(0xFF1F5C46),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Good to see you.',
                  style: TextStyle(
                    color: Color(0xFF151A18),
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Choose your role, then sign in.',
                  style: TextStyle(
                    color: Color(0xFF6B7370),
                    fontSize: 15,
                  ),
                ),

                SizedBox(height: 24),

                // ---------- LOG IN / REGISTER TAB ----------
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
                          onTap: () {
                            setState(() {
                              isLogin = true;
                            });
                          },
                          child: Container(
                            height: 44,
                            decoration: BoxDecoration(
                              color: isLogin == true
                                  ? Colors.white
                                  : Color(0xFFF1F3F0),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: isLogin == true
                                  ? [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 6,
                                  offset: Offset(0, 2),
                                ),
                              ]
                                  : [],
                            ),
                            child: Center(
                              child: Text(
                                'Log in',
                                style: TextStyle(
                                  color: isLogin == true
                                      ? Color(0xFF151A18)
                                      : Color(0xFF6B7370),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isLogin = false;
                            });
                          },
                          child: Container(
                            height: 44,
                            decoration: BoxDecoration(
                              color: isLogin == false
                                  ? Colors.white
                                  : Color(0xFFF1F3F0),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: isLogin == false
                                  ? [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 6,
                                  offset: Offset(0, 2),
                                ),
                              ]
                                  : [],
                            ),
                            child: Center(
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  color: isLogin == false
                                      ? Color(0xFF151A18)
                                      : Color(0xFF6B7370),
                                  fontSize: 14,
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

                // ---------- ROLE SELECTOR ----------
                Row(
                  children: [
                    // Customer
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedRole = 0;
                          });
                        },
                        child: Container(
                          height: 80,
                          decoration: BoxDecoration(
                            color: selectedRole == 0
                                ? Color(0xFFF1F6F3)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              width: selectedRole == 0 ? 2 : 1,
                              color: selectedRole == 0
                                  ? Color(0xFF1F5C46)
                                  : Color(0xFFE8EAE6),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.person_outline,
                                size: 22,
                                color: selectedRole == 0
                                    ? Color(0xFF1F5C46)
                                    : Color(0xFF6B7370),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Customer',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: selectedRole == 0
                                      ? Color(0xFF1F5C46)
                                      : Color(0xFF6B7370),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),

                    // Barber
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedRole = 1;
                          });
                        },
                        child: Container(
                          height: 80,
                          decoration: BoxDecoration(
                            color: selectedRole == 1
                                ? Color(0xFFF1F6F3)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              width: selectedRole == 1 ? 2 : 1,
                              color: selectedRole == 1
                                  ? Color(0xFF1F5C46)
                                  : Color(0xFFE8EAE6),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.storefront_outlined,
                                size: 22,
                                color: selectedRole == 1
                                    ? Color(0xFF1F5C46)
                                    : Color(0xFF6B7370),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Barber',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: selectedRole == 1
                                      ? Color(0xFF1F5C46)
                                      : Color(0xFF6B7370),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),

                    // Admin
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedRole = 2;
                          });
                        },
                        child: Container(
                          height: 80,
                          decoration: BoxDecoration(
                            color: selectedRole == 2
                                ? Color(0xFFF1F6F3)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              width: selectedRole == 2 ? 2 : 1,
                              color: selectedRole == 2
                                  ? Color(0xFF1F5C46)
                                  : Color(0xFFE8EAE6),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.gpp_good_outlined,
                                size: 22,
                                color: selectedRole == 2
                                    ? Color(0xFF1F5C46)
                                    : Color(0xFF6B7370),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Admin',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: selectedRole == 2
                                      ? Color(0xFF1F5C46)
                                      : Color(0xFF6B7370),
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

                // ---------- EMAIL ----------
                Text(
                  'Email',
                  style: TextStyle(
                    color: Color(0xFF5F6663),
                    fontSize: 13,
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
                    prefixIcon: Icon(
                      Icons.mail_outline,
                      color: Color(0xFF6B7370),
                    ),
                    hint: Text(
                      'you@email.com',
                      style: TextStyle(color: Color(0xFF9AA09D), fontSize: 15),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 18),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(width: 1, color: Color(0xFFE8EAE6)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(width: 1, color: Color(0xFF1F5C46)),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),

                SizedBox(height: 16),

                // ---------- PASSWORD ----------
                Text(
                  'Password',
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
                    prefixIcon: Icon(
                      Icons.key_outlined,
                      color: Color(0xFF6B7370),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          visibility = !visibility;
                        });
                      },
                      icon: Icon(
                        visibility == true
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Color(0xFF6B7370),
                      ),
                    ),
                    hint: Text(
                      'Enter your password',
                      style: TextStyle(color: Color(0xFF9AA09D), fontSize: 15),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 18),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(width: 1, color: Color(0xFFE8EAE6)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(width: 1, color: Color(0xFF1F5C46)),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),

                SizedBox(height: 12),

                // ---------- FORGOT PASSWORD ----------
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(
                      color: Color(0xFF1F5C46),
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: 24),

                // ---------- LOG IN BUTTON ----------
                // light green when fields are empty, dark green when both are filled
                GestureDetector(
                  onTap: () {
                    // TODO: add your login code here
                  },
                  child: Container(
                    height: 54,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: emailController.text.isEmpty ||
                          passwordController.text.isEmpty
                          ? Color(0xFF9BB5A9)
                          : Color(0xFF1F5C46),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Log in',
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

                // ---------- OR DIVIDER ----------
                Row(
                  children: [
                    Expanded(
                      child: Container(height: 1, color: Color(0xFFE8EAE6)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'or',
                        style: TextStyle(
                          color: Color(0xFF9AA09D),
                          fontSize: 11,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(height: 1, color: Color(0xFFE8EAE6)),
                    ),
                  ],
                ),

                SizedBox(height: 16),

                // ---------- GOOGLE BUTTON ----------
                GestureDetector(
                  onTap: () {
                    // TODO: add your google sign in code here
                  },
                  child: Container(
                    height: 54,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(width: 1, color: Color(0xFFE8EAE6)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // TODO: later replace this Text('G') with the Google logo image:
                        // Image.asset('assets/images/google.png', height: 20, width: 20)
                        Text(
                          'G',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Continue with Google',
                          style: TextStyle(
                            color: Color(0xFF151A18),
                            fontSize: 15,
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
      ),
    );
  }
}