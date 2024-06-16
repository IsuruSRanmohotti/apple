import 'package:apple/screens/home/home_page/home_page.dart';
import 'package:flutter/material.dart';

class HomeRow extends StatelessWidget {
  const HomeRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _CustomIconButton(
          text: 'Profile',
          icon: Icons.person,
          iconColor: Colors.green.shade700,
          onTap: () {},
        ),
        _CustomIconButton(
          text: 'Favorite',
          icon: Icons.favorite,
          iconColor: Colors.red,
          onTap: () {},
        ),
        _CustomIconButton(
          text: 'Cart',
          iconColor: Colors.blue.shade700,
          icon: Icons.shopping_cart_rounded,
          onTap: () {},
        ),
        _CustomIconButton(
          text: 'Web',
          iconColor: Colors.purple.shade700,
          onTap: () {},
          icon: Icons.web,
        ),
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  const _CustomIconButton(
      {super.key,
      required this.text,
      required this.iconColor,
      required this.onTap,
      required this.icon});

  final String text;
  final Color iconColor;
  final VoidCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: iconColor.withOpacity(0.4),
            child: Icon(
              icon,
              color: iconColor,
            ),
          ),
          Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}