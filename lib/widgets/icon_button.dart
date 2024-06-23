import 'package:admin/constants.dart';
import 'package:flutter/material.dart';

import '../responsive.dart';

class MyIconButton extends StatelessWidget {
  final Function()? onPressed;
  final String label;
  final IconData icon;

  const MyIconButton({
    required this.onPressed,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: TextButton.styleFrom(
        backgroundColor: primaryColor,
        padding: EdgeInsets.symmetric(
          horizontal: defaultPadding * 1.5,
          vertical: defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
        ),
      ),
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.black),
      label: Text(
        label,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}
