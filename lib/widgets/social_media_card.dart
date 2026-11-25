import 'package:flutter/material.dart';
import '../constants/app_images.dart';

class SocialMediaCard extends StatelessWidget {
  final String? image;
  final String label;
  final VoidCallback? onTap;

  const SocialMediaCard({
    super.key,
    this.image,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image ?? AppImages.logo,
                height: 30,
                width: 30,
              ),
              SizedBox(width: 10),
              Text(label),
            ],
          ),
        ),
      ),
    );
  }
}