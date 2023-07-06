import 'package:flutter/material.dart';

class Coffetype extends StatelessWidget {
  final String coffetype;
  final bool isSelected;
  final VoidCallback onTap;

  Coffetype({
    required this.coffetype,
    required this.isSelected,
    required this.onTap,
  });
 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Text(
          coffetype,
            style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.orange : Colors.white,
          ),
        ),
      ),
    );
  }
}