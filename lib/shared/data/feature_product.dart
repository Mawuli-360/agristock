import 'package:flutter/material.dart';

class FeatureProduct {
  final String title;
  final String newPrice;
  final String oldPrice;
  final String rate;
  final AssetImage image;

  FeatureProduct({
    required this.title,
    required this.newPrice,
    required this.oldPrice,
    required this.rate,
    required this.image,
  });
}
