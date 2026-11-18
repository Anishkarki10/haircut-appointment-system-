import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool visibility = true; // true basically means that the  password hidden
  int selectedRole = 0; // 0 means Customer, 1  means Barber, admin cant be register


  Color green = Color(0xFF1F5C46);
  Color grey = Color(0xFF6B7370);
  Color lightBorder = Color(0xFFE8EAE6);

  TextStyle labelStyle = TextStyle(
    color: Color(0xFF5F6663),
    fontSize: 13,
    fontWeight: FontWeight.bold,
  );

  // Log in, Register tab
  Widget tabButton(String text, bool selected) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
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

  // Customer, Barber, Admin card
  // enabled = false makes the card look non active
  Widget roleCard(int index, IconData icon, String name, bool enabled) {
    bool selected = selectedRole == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (enabled == true) {
            setState(() {
              selectedRole = index;
            });
          }
        },
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: selected ? Color(0xFFF1F6F3) : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              width: selected ? 2 : 1,
              color: selected
                  ? green
                  : (enabled ? lightBorder : Color(0xFFF1F3F0)),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 22,
                color: enabled ? (selected ? green : grey) : Color(0xFFD0D4D1),
              ),
              SizedBox(height: 8),
              Text(
                name,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: enabled ? (selected ? green : grey) : Color(0xFFD0D4D1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // border of the text fields
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

                // ---------- LOGO ----------
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
                  'Create your account.',
                  style: TextStyle(
                    color: Color(0xFF151A18),
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'A few details and you’re ready to get started.',
                  style: TextStyle(color: grey, fontSize: 15),
                ),

                SizedBox(height: 24),

                //LOG IN, REGISTER TAB
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Color(0xFFF1F3F0),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      tabButton('Log in', false),
                      tabButton('Register', true),
                    ],
                  ),
                ),

                SizedBox(height: 14),

                //ROLE SELECTOR
                Row(
                  children: [
                    roleCard(0, Icons.person_outline, 'Customer', true),
                    SizedBox(width: 10),
                    roleCard(1, Icons.storefront_outlined, 'Barber', true),
                    SizedBox(width: 10),
                    roleCard(2, Icons.gpp_good_outlined, 'Admin', false),
                  ],
                ),

                SizedBox(height: 20),

                //full name
                Text('Full name', style: labelStyle),
                SizedBox(height: 8),
                TextFormField(
                  controller: nameController,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_outline, color: grey),
                    hint: Text(
                      'Your name',
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

                // email
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

                // pass
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

                SizedBox(height: 24),

                // creating account
                // light green when a field is empty, dark green when all three are filled
                GestureDetector(
                  onTap: () {
                  },
                  child: Container(
                    height: 54,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: nameController.text.isEmpty ||
                          emailController.text.isEmpty ||
                          passwordController.text.isEmpty
                          ? Color(0xFF9BB5A9)
                          : green,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Create account',
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
      ),
    );
  }
}