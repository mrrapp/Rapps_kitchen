import 'package:flutter/material.dart';

// providing what a category should have
class Category {
  const Category({
    required this.id,
    required this.title,
    required this.color,
  });
// contents
  final String id;
  final String title;
  final Color color;
}
