import 'package:admin/constants.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  const MyButton({
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 50),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
