import 'package:flutter/material.dart';

class RoleCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback? onTap;

  const RoleCard({
    super.key,
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: selected
                ? Color(0xFFF1F6F3)
                : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: selected
                  ? Color(0xFF1F5C46)
                  : Color(0xFFE8EAE6),
              width: selected ? 2 : 1,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 22,
                color: selected
                    ? Color(0xFF1F5C46)
                    : Color(0xFF6B7370),
              ),
              SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Times New Roman',
                  fontWeight: FontWeight.bold,
                  color: selected
                      ? Color(0xFF1F5C46)
                      : Color(0xFF6B7370),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}