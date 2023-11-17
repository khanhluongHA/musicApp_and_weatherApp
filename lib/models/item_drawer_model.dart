import 'package:flutter/material.dart';

class ItemDrawerModel {
  ItemDrawerModel({
    required this.icon,
    required this.onPressed,
    required this.title,
  });
  final String title;
  final IconData icon;
  final VoidCallback onPressed;
}
