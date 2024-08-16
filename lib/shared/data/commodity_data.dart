import 'package:agricstock/core/constants/app_images.dart';
import 'package:agricstock/shared/domain/commodity.dart';
import 'dart:math';

class CommodityData {
  CommodityData._();

  static List<Commodity> commodities = [
    Commodity(
        name: "Banana",
        newPrice: "GHC 12.50",
        oldPrice: "GHC 10.00",
        productImage: AppImages.banana,
        rateImage: AppImages.increase,
        rate: '+25%'),
    Commodity(
        name: "Tomato",
        newPrice: "GHC 8.00",
        oldPrice: "GHC 9.50",
        productImage: AppImages.tomato,
        rateImage: AppImages.decrease,
        rate: '-16%'),
    Commodity(
        name: "Cassava",
        newPrice: "GHC 5.00",
        oldPrice: "GHC 4.50",
        productImage: AppImages.cassava,
        rateImage: AppImages.increase,
        rate: '+11%'),
    Commodity(
        name: "Pineapple",
        newPrice: "GHC 7.00",
        oldPrice: "GHC 8.00",
        productImage: AppImages.pineapple,
        rateImage: AppImages.decrease,
        rate: '-13%'),
    Commodity(
        name: "Rice",
        newPrice: "GHC 45.00",
        oldPrice: "GHC 40.00",
        productImage: AppImages.rice,
        rateImage: AppImages.increase,
        rate: '+13%'),
    Commodity(
        name: "Carrot",
        newPrice: "GHC 6.50",
        oldPrice: "GHC 7.00",
        productImage: AppImages.carrot,
        rateImage: AppImages.decrease,
        rate: '-7%'),
    Commodity(
        name: "Cock",
        newPrice: "GHC 55.00",
        oldPrice: "GHC 50.00",
        productImage: AppImages.rooster,
        rateImage: AppImages.increase,
        rate: '+10%'),
    Commodity(
        name: "Onion",
        newPrice: "GHC 9.00",
        oldPrice: "GHC 10.50",
        productImage: AppImages.onion,
        rateImage: AppImages.decrease,
        rate: '-14%'),
    Commodity(
        name: "Orange",
        newPrice: "GHC 3.50",
        oldPrice: "GHC 3.00",
        productImage: AppImages.orange,
        rateImage: AppImages.increase,
        rate: '+17%'),
    Commodity(
        name: "Peanut",
        newPrice: "GHC 15.00",
        oldPrice: "GHC 13.50",
        productImage: AppImages.peanut,
        rateImage: AppImages.increase,
        rate: '+11%'),
    Commodity(
        name: "Pepper",
        newPrice: "GHC 7.50",
        oldPrice: "GHC 8.50",
        productImage: AppImages.pepper,
        rateImage: AppImages.decrease,
        rate: '-12%'),
    Commodity(
        name: "Soybean",
        newPrice: "GHC 20.00",
        oldPrice: "GHC 18.00",
        productImage: AppImages.soybean,
        rateImage: AppImages.increase,
        rate: '+11%'),
    Commodity(
        name: "Tilapia",
        newPrice: "GHC 25.00",
        oldPrice: "GHC 28.00",
        productImage: AppImages.tilapia,
        rateImage: AppImages.decrease,
        rate: '-11%'),
  ];
}
