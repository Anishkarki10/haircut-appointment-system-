import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class BarberDetailsScreen extends StatefulWidget {
  const BarberDetailsScreen({super.key});

  @override
  State<BarberDetailsScreen> createState() =>
      _BarberDetailsScreenState();
}

class _BarberDetailsScreenState extends State<BarberDetailsScreen> {
  final Color primaryColor = const Color(0xFF205E48);
  final Color backgroundColor = const Color(0xFFF8FAF9);
  final Color textColor = const Color(0xFF17211C);
  final Color secondaryColor = const Color(0xFF68736D);
  final Color borderColor = const Color(0xFFDFE5E1);
  final Color lightGreen = const Color(0xFFD8EBE2);

  bool isFavourite = false;

  int selectedRole = 0;
  int currentImage = 0;

  final List<String> shopImages = [

    'assets/image/barbershop_1.jpg',

    'assets/image/barbershop_2.jpg',

    'assets/image/barbershop_3.jpg',

    'assets/image/barbershop_4.jpg',

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: AppBar(
        backgroundColor: backgroundColor,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        toolbarHeight: 65,

        title: Text(
          'KapalTime',
          style: TextStyle(
            color: primaryColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.5,
          ),
        ),

        actions: [
          roleSelector(),
          const SizedBox(width: 12),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            imageCarousel(),

            Padding(
              padding: const EdgeInsets.all(20),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  shopInformation(),

                  const SizedBox(height: 20),

                  Divider(color: borderColor),

                  const SizedBox(height: 20),

                  servicesSection(),

                  const SizedBox(height: 25),

                  barbersSection(),

                  const SizedBox(height: 25),

                  reviewCard(),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: bookingBar(),
    );
  }

  // Role selector

  Widget roleSelector() {
    return Container(
      padding: const EdgeInsets.all(3),

      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(12),
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

      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 12,
        ),

        decoration: BoxDecoration(
          color: isSelected ? textColor : Colors.transparent,
          borderRadius: BorderRadius.circular(9),
        ),

        child: Text(
          title,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : secondaryColor,
          ),
        ),
      ),
    );
  }

  // Image carousel

  Widget imageCarousel() {
    return SizedBox(
      height: 280,
      width: double.infinity,

      child: Stack(
        children: [
          PageView.builder(
            itemCount: shopImages.length,

            onPageChanged: (index) {
              setState(() {
                currentImage = index;
              });
            },

            itemBuilder: (context, index) {
              return Image.asset(
                shopImages[index],
                fit: BoxFit.cover,
                width: double.infinity,

                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: const Color(0xFFD8DFDA),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          LucideIcons.image,
                          size: 55,
                          color: secondaryColor,
                        ),

                        const SizedBox(height: 10),

                        Text(
                          'Barbershop Image ${index + 1}',
                          style: TextStyle(
                            color: secondaryColor,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),

          // Back button

          Positioned(
            top: 15,
            left: 15,

            child: circleButton(
              icon: LucideIcons.arrowLeft,

              onTap: () {
                Navigator.maybePop(context);
              },
            ),
          ),

          // Favourite button

          Positioned(
            top: 15,
            right: 15,

            child: circleButton(
              icon: isFavourite
                  ? Icons.favorite
                  : LucideIcons.heart,

              color: isFavourite ? Colors.red : textColor,

              onTap: () {
                setState(() {
                  isFavourite = !isFavourite;
                });
              },
            ),
          ),

          // Image counter

          Positioned(
            bottom: 15,
            right: 15,

            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 6,
              ),

              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(20),
              ),

              child: Text(
                '${currentImage + 1}/${shopImages.length}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Reusable circular icon button

  Widget circleButton({
    required IconData icon,
    required VoidCallback onTap,
    Color? color,
  }) {
    return Material(
      color: backgroundColor,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          height: 42,
          width: 42,
          child: Icon(
            icon,
            color: color ?? textColor,
            size: 21,
          ),
        ),
      ),
    );
  }

  // Shop information

  Widget shopInformation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'North & Co.',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: textColor,
            letterSpacing: -1,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          '18 Camden High Street · Open until 19:00',
          style: TextStyle(
            fontSize: 13,
            color: secondaryColor,
          ),
        ),

        const SizedBox(height: 20),

        Row(
          children: [
            Text(
              '4.9',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),

            const SizedBox(width: 10),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                starRating(
                  color: const Color(0xFFD28B20),
                  size: 14,
                ),

                const SizedBox(height: 3),

                Text(
                  '128 reviews',
                  style: TextStyle(
                    fontSize: 9,
                    color: secondaryColor,
                  ),
                ),
              ],
            ),

            const Spacer(),

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 5,
              ),

              decoration: BoxDecoration(
                color: lightGreen,
                borderRadius: BorderRadius.circular(20),
              ),

              child: Text(
                'Quiet now',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Star rating

  Widget starRating({
    required Color color,
    double size = 16,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,

      children: List.generate(
        5,
            (index) => Icon(
          Icons.star,
          color: color,
          size: size,
        ),
      ),
    );
  }

  // Services section

  Widget servicesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            sectionTitle('Services'),

            Text(
              'From £18',
              style: TextStyle(
                fontSize: 12,
                color: secondaryColor,
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        serviceTile(
          name: 'Classic cut',
          duration: '30 min',
          price: '£22',
        ),

        Divider(color: borderColor, height: 1),

        serviceTile(
          name: 'Skin fade',
          duration: '45 min',
          price: '£26',
        ),

        Divider(color: borderColor, height: 1),

        serviceTile(
          name: 'Beard trim',
          duration: '20 min',
          price: '£14',
        ),

        Divider(color: borderColor, height: 1),
      ],
    );
  }

  // Reusable service item

  Widget serviceTile({
    required String name,
    required String duration,
    required String price,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                duration,
                style: TextStyle(
                  fontSize: 11,
                  color: secondaryColor,
                ),
              ),
            ],
          ),

          Text(
            price,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  // Barbers section

  Widget barbersSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sectionTitle('Barbers'),

        const SizedBox(height: 15),

        Row(
          children: [
            Expanded(
              child: barberCard(
                initials: 'RM',
                name: 'Ram',
                speciality: 'Fades & textured cuts',
              ),
            ),

            const SizedBox(width: 15),

            Expanded(
              child: barberCard(
                initials: 'RJ',
                name: 'Raju',
                speciality: 'Classic barbering',
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Reusable barber card

  Widget barberCard({
    required String initials,
    required String name,
    required String speciality,
    String? imagePath,
  }) {
    return Row(
      children: [
        CircleAvatar(
          radius: 21,
          backgroundColor: lightGreen,

          foregroundImage: imagePath != null
              ? AssetImage(imagePath)
              : null,

          child: Text(
            initials,
            style: TextStyle(
              color: primaryColor,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                speciality,
                style: TextStyle(
                  fontSize: 9,
                  color: secondaryColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Customer review card

  Widget reviewCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: const Color(0xFFEEF2EF),
        borderRadius: BorderRadius.circular(18),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  '"Exactly what I asked for."',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ),

              starRating(
                color: textColor,
                size: 18,
              ),
            ],
          ),

          const SizedBox(height: 15),

          Text(
            'Quick, friendly and a great cut. — Noah, 2 days ago',
            style: TextStyle(
              fontSize: 10,
              color: secondaryColor,
            ),
          ),
        ],
      ),
    );
  }

  // Reusable section title

  Widget sectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
    );
  }

  // Fixed bottom booking bar

  Widget bookingBar() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 12,
      ),

      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border(
          top: BorderSide(
            color: borderColor,
          ),
        ),
      ),

      child: SafeArea(
        top: false,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Next available',
                  style: TextStyle(
                    fontSize: 10,
                    color: secondaryColor,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  'Today, 10:30',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ],
            ),

            ElevatedButton(
              onPressed: () {
                // Add booking screen navigation here.
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
                elevation: 2,

                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),

              child: const Text(
                'Book now',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}