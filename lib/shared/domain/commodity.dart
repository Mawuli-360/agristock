import 'package:flutter/rendering.dart';

class Commodity {
  final String name;
  final String newPrice;
  final String oldPrice;
  final AssetImage productImage;
  final AssetImage rateImage;
  final String rate;
  Commodity({
    required this.name,
    required this.newPrice,
    required this.oldPrice,
    required this.productImage,
    required this.rateImage,
    required this.rate,
  });
}
