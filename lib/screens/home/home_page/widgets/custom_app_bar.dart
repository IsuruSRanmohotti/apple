import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: const FaIcon(
              FontAwesomeIcons.apple,
              color: Colors.white,
            ),
            style: ButtonStyle(
                backgroundColor:
                    WidgetStatePropertyAll(Colors.grey.shade800)),
          ),
          const Text(
            'Apple Store',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
            style: ButtonStyle(
                backgroundColor:
                    WidgetStatePropertyAll(Colors.grey.shade800)),
          ),
        ],
      ),
    );
  }
}
