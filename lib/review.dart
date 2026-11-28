
import 'package:flutter/material.dart';

void main() {
  runApp(const KapalTimeApp());
}

const Color darkGreen = Color(0xFF23664E);
const Color lightGreen = Color(0xFFDCEDE5);
const Color backgroundColor = Color(0xFFFCFDFC);
const Color textColor = Color(0xFF14221E);

class KapalTimeApp extends StatelessWidget {
  const KapalTimeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KapalTime',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: backgroundColor,
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(
          seedColor: darkGreen,
        ),
      ),
      home: const AppointmentsScreen(),
    );
  }
}

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() =>
      _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  String selectedRole = 'Customer';
  int selectedTab = 2;

  bool appointmentCancelled = false;

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      body: SafeArea(
        child: Column(
          children: [

            // TOP HEADER
            buildHeader(),

            // MAIN CONTENT
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Text(
                      'MY SCHEDULE',
                      style: TextStyle(
                        color: darkGreen,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),

                    const SizedBox(height: 7),

                    const Text(
                      'Appointments',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                        letterSpacing: -1,
                      ),
                    ),

                    const SizedBox(height: 23),

                    // UPCOMING APPOINTMENT
                    if (!appointmentCancelled)
                      buildAppointmentCard(),

                    const SizedBox(height: 28),

                    // PAST VISITS
                    const Text(
                      'Past visits',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),

                    const SizedBox(height: 17),

                    buildPastVisit(
                      name: 'The Good Chair',
                      date: '28 May',
                      service: 'Classic cut',
                      button: true,
                    ),

                    const Divider(
                      color: Color(0xFFE8EDEA),
                      height: 1,
                    ),

                    buildPastVisit(
                      name: 'North & Co.',
                      date: '12 April',
                      service: 'Skin fade',
                      button: false,
                    ),

                    const Divider(
                      color: Color(0xFFE8EDEA),
                      height: 1,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // BOTTOM NAVIGATION
      bottomNavigationBar: buildBottomNavigation(),
    );
  }

  // HEADER
  Widget buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(13, 18, 12, 5),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFE8EEEA),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          const Text(
            'KapalTime',
            style: TextStyle(
              color: darkGreen,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.7,
            ),
          ),

          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: const Color(0xFFE5E9E6),
              ),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Row(
              children: ['Customer', 'Barber', 'Admin']
                  .map((role) {
                bool isSelected = selectedRole == role;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedRole = role;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFF17251F)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      role,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: isSelected
                            ? Colors.white
                            : const Color(0xFF77817C),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  // UPCOMING APPOINTMENT CARD
  Widget buildAppointmentCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(21),
        border: Border.all(
          color: const Color(0xFFE7ECE8),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.035),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // DATE BOX
          Container(
            height: 59,
            width: 53,
            decoration: BoxDecoration(
              color: darkGreen,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '14',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'JUN',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 15),

          // APPOINTMENT DETAILS
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: lightGreen,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Confirmed',
                    style: TextStyle(
                      color: darkGreen,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 9),

                const Text(
                  '10:30 · North & Co.',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 5),

                const Text(
                  'Classic cut · Ram',
                  style: TextStyle(
                    color: Color(0xFF78857F),
                    fontSize: 11,
                  ),
                ),

                const SizedBox(height: 16),

                // ACTION BUTTONS
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [

                    OutlinedButton(
                      onPressed: () {
                        showMessage('Reschedule appointment selected');
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: textColor,
                        side: const BorderSide(
                          color: Color(0xFFE5EAE6),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 13,
                          vertical: 11,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: const Text(
                        'Reschedule',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    TextButton(
                      onPressed: () {
                        setState(() {
                          appointmentCancelled = true;
                        });
                        showMessage('Appointment cancelled');
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: darkGreen,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // PAST VISITS
  Widget buildPastVisit({
    required String name,
    required String date,
    required String service,
    required bool button,
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
                  name,
                  style: const TextStyle(
                    color: textColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  '$date · $service',
                  style: const TextStyle(
                    color: Color(0xFF78857F),
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),

          if (button)
            OutlinedButton(
              onPressed: () {
                showMessage('Booking again selected');
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: textColor,
                side: const BorderSide(
                  color: Color(0xFFE5EAE6),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 17,
                  vertical: 13,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                'Book again',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          else
            const Text(
              '★★★★★',
              style: TextStyle(
                color: Color(0xFFD58B32),
                fontSize: 13,
                letterSpacing: 0.5,
              ),
            ),
        ],
      ),
    );
  }

  // BOTTOM NAVIGATION BAR
  Widget buildBottomNavigation() {
    final items = [
      {'icon': Icons.explore_outlined, 'label': 'Discover'},
      {'icon': Icons.map_outlined, 'label': 'Map'},
      {'icon': Icons.calendar_month_outlined, 'label': 'Bookings'},
      {'icon': Icons.person_outline, 'label': 'Profile'},
    ];

    return Container(
      decoration: const BoxDecoration(
        color: backgroundColor,
        border: Border(
          top: BorderSide(
            color: Color(0xFFE8EEEA),
          ),
        ),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 65,
          child: Row(
            children: List.generate(items.length, (index) {

              bool active = selectedTab == index;

              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTab = index;
                    });
                    showMessage(
                      '${items[index]['label']} selected',
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Icon(
                        items[index]['icon'] as IconData,
                        size: 23,
                        color: active
                            ? darkGreen
                            : const Color(0xFF939E98),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        items[index]['label'] as String,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: active
                              ? FontWeight.bold
                              : FontWeight.w500,
                          color: active
                              ? darkGreen
                              : const Color(0xFF939E98),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
