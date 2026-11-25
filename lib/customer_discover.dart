import 'package:flutter/material.dart';

import 'search_barber_shops_screen.dart';

class CustomerDiscoverScreen extends StatefulWidget {
  const CustomerDiscoverScreen({super.key});

  @override
  State<CustomerDiscoverScreen> createState() => _CustomerDiscoverScreenState();
}

class _CustomerDiscoverScreenState extends State<CustomerDiscoverScreen> {
  int selectedIndex = 0;
  PageController controller = PageController();
  Color green = Colors.teal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
            controller.jumpToPage(index);
          });
        },
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Discover"),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: "Map"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "Bookings"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile"),
        ],
      ),
      body: SafeArea(
        child: PageView(
          controller: controller,
          scrollDirection: Axis.horizontal,
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // logo and role switch
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            "assets/images/logo.png",
                            height: 38,
                            width: 38,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                "Customer",
                                style: TextStyle(color: Colors.white, fontSize: 12),
                              ),
                            ),
                            SizedBox(width: 8),
                            Text("Barber", style: TextStyle(fontSize: 12)),
                            SizedBox(width: 8),
                            Text("Admin", style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16),

                    // location and bell icon
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("NEAR CAMDEN", style: TextStyle(color: Colors.teal)),
                        Icon(Icons.notifications_none),
                      ],
                    ),
                    Text(
                      "Find your next cut.",
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 12),

                    // search bar and filter icon
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            readOnly: true,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const SearchBarberShopsScreen(),
                                ),
                              );
                            },
                            decoration: InputDecoration(
                              hintText: "Shop or area",
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(Icons.tune),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),

                    // face scan box
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.brown.shade50,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.face_retouching_natural),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Not sure what suits you?"),
                                Text("Try a private face scan"),
                              ],
                            ),
                          ),
                          Icon(Icons.chevron_right),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Nearby shops", style: TextStyle(fontSize: 18)),
                        Text("Map", style: TextStyle(color: Colors.teal)),
                      ],
                    ),
                    SizedBox(height: 10),

                    // shop list
                    shopItem(
                      "assets/images/placeholder_temp.png",
                      "North & Co.",
                      "4.9 (128) · Camden High Street",
                      "From £18",
                      "10:30 next",
                    ),
                    shopItem(
                      "assets/images/placeholder_temp.png",
                      "The Good Chair",
                      "4.8 (94) · Kentish Town",
                      "From £16",
                      "11:15 next",
                    ),
                  ],
                ),
              ),
            ),
            Center(child: Text("Map")),
            Center(child: Text("Bookings")),
            Center(child: Text("Profile")),
          ],
        ),
      ),
    );
  }

  // shop row helper
  Widget shopItem(String img, String name, String info, String price, String time) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(img, height: 90, width: 90, fit: BoxFit.cover),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                    Icon(Icons.favorite_border),
                  ],
                ),
                Text(info),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(price),
                    Text("Quiet", style: TextStyle(color: Colors.teal)),
                    Text(time),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}