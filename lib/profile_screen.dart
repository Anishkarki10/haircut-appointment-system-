import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool appointmentReminder = true;
  bool bookingChanges = true;

  int selectedIndex = 3;
  int selectedRole = 0;

  final Color primaryColor = const Color(0xFF205E48);
  final Color backgroundColor = const Color(0xFFF8FAF9);
  final Color textColor = const Color(0xFF17211C);
  final Color secondaryColor = const Color(0xFF68736D);
  final Color borderColor = const Color(0xFFDFE5E1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: AppBar(
        backgroundColor: backgroundColor,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        toolbarHeight: 80,

        title: Text(
          'KapalTime',
          style: TextStyle(
            color: primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.5,
          ),
        ),

        actions: [
          roleSelector(),
          const SizedBox(width: 15),
        ],

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Divider(
            height: 1,
            color: borderColor,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 25,
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ACCOUNT',
              style: TextStyle(
                color: primaryColor,
                fontSize: 13,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              'Your profile',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: textColor,
                letterSpacing: -1,
              ),
            ),

            const SizedBox(height: 25),

            profileCard(),

            const SizedBox(height: 30),

            sectionTitle('Notifications'),

            const SizedBox(height: 15),

            notificationTile(
              title: 'Appointment reminders',
              subtitle: '24 hours before',
              value: appointmentReminder,
              onChanged: (value) {
                setState(() {
                  appointmentReminder = value;
                });
              },
            ),

            Divider(color: borderColor, height: 1),

            notificationTile(
              title: 'Booking changes',
              subtitle: 'Confirmations and cancellations',
              value: bookingChanges,
              onChanged: (value) {
                setState(() {
                  bookingChanges = value;
                });
              },
            ),

            Divider(color: borderColor, height: 1),

            const SizedBox(height: 28),

            sectionTitle('Preview another role'),

            const SizedBox(height: 15),

            workspaceTile(
              title: 'Barber workspace',
              subtitle: 'Bookings, services and hours',
              icon: LucideIcons.store,
              onTap: () {
                setState(() {
                  selectedRole = 1;
                });
              },
            ),

            Divider(color: borderColor, height: 1),

            workspaceTile(
              title: 'Admin workspace',
              subtitle: 'Overview, approvals and conflicts',
              icon: LucideIcons.shieldCheck,
              onTap: () {
                setState(() {
                  selectedRole = 2;
                });
              },
            ),

            Divider(color: borderColor, height: 1),

            const SizedBox(height: 25),
          ],
        ),
      ),

      bottomNavigationBar: bottomNavigation(),
    );
  }

  // Role selector

  Widget roleSelector() {
    return Container(
      padding: const EdgeInsets.all(4),

      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(14),
      ),

      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          roleButton('Customer', 0),
          roleButton('Barber', 1),
          roleButton('Admin', 2),
        ],
      ),
    );
  }

  Widget roleButton(String title, int index) {
    bool isSelected = selectedRole == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedRole = index;
        });
      },

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),

        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 13,
        ),

        decoration: BoxDecoration(
          color: isSelected ? textColor : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),

        child: Text(
          title,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : secondaryColor,
          ),
        ),
      ),
    );
  }

  // Profile card

  Widget profileCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(20),
      ),

      child: Row(
        children: [
          CircleAvatar(
            radius: 27,
            backgroundColor: const Color(0xFFD8EBE2),

            child: Text(
              'BA',
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bardan Ali',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  'bardan@email.com · 07123 456789',
                  style: TextStyle(
                    fontSize: 11,
                    color: secondaryColor,
                  ),
                ),
              ],
            ),
          ),

          TextButton(
            onPressed: () {
              // Add edit profile navigation here.
            },

            child: Text(
              'Edit',
              style: TextStyle(
                color: primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Section headings

  Widget sectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
    );
  }

  // Notification settings

  Widget notificationTile({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 17),

      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: secondaryColor,
                  ),
                ),
              ],
            ),
          ),

          Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: Colors.white,
            activeTrackColor: primaryColor,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.grey.shade300,
          ),
        ],
      ),
    );
  }

  // Workspace sections

  Widget workspaceTile({
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 19),

        child: Row(
          children: [
            Icon(
              icon,
              color: textColor,
              size: 24,
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: textColor,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 11,
                      color: secondaryColor,
                    ),
                  ),
                ],
              ),
            ),

            Icon(
              LucideIcons.chevronRight,
              color: textColor,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }

  // Bottom navigation bar

  Widget bottomNavigation() {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border(
          top: BorderSide(color: borderColor),
        ),
      ),

      child: SafeArea(
        top: false,

        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              navigationItem(
                icon: LucideIcons.compass,
                label: 'Discover',
                index: 0,
              ),

              navigationItem(
                icon: LucideIcons.map,
                label: 'Map',
                index: 1,
              ),

              navigationItem(
                icon: LucideIcons.calendarDays,
                label: 'Bookings',
                index: 2,
              ),

              navigationItem(
                icon: LucideIcons.userRound,
                label: 'Profile',
                index: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable navigation item

  Widget navigationItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    bool isSelected = selectedIndex == index;

    Color color = isSelected
        ? primaryColor
        : const Color(0xFF909A95);

    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,

        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: color,
              size: 26,
            ),

            const SizedBox(height: 5),

            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}