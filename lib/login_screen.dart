import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool visibility = true; // true means that the password is hidden
  bool isLogin = true; // true means Log in tab, false means Register tab
  int selectedRole = 0; // 0 is Customer, 1 is Barber, 2 is Admin

  Color green = Color(0xFF1F5C46);
  Color grey = Color(0xFF6B7370);
  Color lightBorder = Color(0xFFE8EAE6);

  TextStyle labelStyle = TextStyle(
    color: Color(0xFF5F6663),
    fontSize: 13,
    fontWeight: FontWeight.bold,
  );

  // Log in / Register tab
  Widget tabButton(String text, bool loginTab) {
    bool selected = isLogin == loginTab;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isLogin = loginTab;
          });
        },
        child: Container(
          height: 44,
          decoration: BoxDecoration(
            color: selected ? Colors.white : Color(0xFFF1F3F0),
            borderRadius: BorderRadius.circular(12),
            boxShadow: selected
                ? [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2))]
                : [],
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: selected ? Color(0xFF151A18) : grey,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Customer / Barber / Admin card
  Widget roleCard(int index, IconData icon, String name) {
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
            color: selected ? Color(0xFFF1F6F3) : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              width: selected ? 2 : 1,
              color: selected ? green : lightBorder,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 22, color: selected ? green : grey),
              SizedBox(height: 8),
              Text(
                name,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: selected ? green : grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // border of text field
  OutlineInputBorder fieldBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(width: 1, color: color),
    );
  }

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

                // LOGO
                Row(
                  children: [
                    Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                        color: green,
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
                        color: green,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 40),

                //HEADING
                Text(
                  'WELCOME',
                  style: TextStyle(
                    color: green,
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
                  style: TextStyle(color: grey, fontSize: 15),
                ),

                SizedBox(height: 24),

                //LOG IN / REGISTER TAB
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Color(0xFFF1F3F0),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      tabButton('Log in', true),
                      tabButton('Register', false),
                    ],
                  ),
                ),

                SizedBox(height: 14),

                //ROLE SELECTOR
                Row(
                  children: [
                    roleCard(0, Icons.person_outline, 'Customer'),
                    SizedBox(width: 10),
                    roleCard(1, Icons.storefront_outlined, 'Barber'),
                    SizedBox(width: 10),
                    roleCard(2, Icons.gpp_good_outlined, 'Admin'),
                  ],
                ),

                SizedBox(height: 20),

                // EMAIL
                Text('Email', style: labelStyle),
                SizedBox(height: 8),
                TextFormField(
                  controller: emailController,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail_outline, color: grey),
                    hint: Text(
                      'you@email.com',
                      style: TextStyle(color: Color(0xFF9AA09D), fontSize: 15),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 18),
                    enabledBorder: fieldBorder(lightBorder),
                    focusedBorder: fieldBorder(green),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),

                SizedBox(height: 16),

                // PASSWORD
                Text('Password', style: labelStyle),
                SizedBox(height: 8),
                TextFormField(
                  controller: passwordController,
                  obscureText: visibility,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.key_outlined, color: grey),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          visibility = !visibility;
                        });
                      },
                      icon: Icon(
                        visibility == true ? Icons.visibility_off : Icons.visibility,
                        color: grey,
                      ),
                    ),
                    hint: Text(
                      'Enter your password',
                      style: TextStyle(color: Color(0xFF9AA09D), fontSize: 15),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 18),
                    enabledBorder: fieldBorder(lightBorder),
                    focusedBorder: fieldBorder(green),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),

                SizedBox(height: 12),

                // FORGOT PASSWORD
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(
                      color: green,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: 24),

                //LOG IN BUTTON

                GestureDetector(
                  onTap: () {
                    // login code here
                  },
                  child: Container(
                    height: 54,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: emailController.text.isEmpty ||
                          passwordController.text.isEmpty
                          ? Color(0xFF9BB5A9)
                          : green,
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

                // OR DIVIDER
                Row(
                  children: [
                    Expanded(child: Container(height: 1, color: lightBorder)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'or',
                        style: TextStyle(color: Color(0xFF9AA09D), fontSize: 11),
                      ),
                    ),
                    Expanded(child: Container(height: 1, color: lightBorder)),
                  ],
                ),

                SizedBox(height: 16),

                // GOOGLE BUTTON
                GestureDetector(
                  onTap: () {
                    // google sign
                  },
                  child: Container(
                    height: 54,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(width: 1, color: lightBorder),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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