import 'package:agricstock/core/constants/app_images.dart';
import 'package:agricstock/shared/domain/commodity.dart';

class CommodityData {
  CommodityData._();

  static List<Commodity> commodities = [
    Commodity(
        name: "Cocoyam",
        newPrice: "GHC 160.50",
        oldPrice: "GHC 90.00",
        productImage: AppImages.cocoyam,
        rateImage: AppImages.increase,
        rate: '+25%'),
    Commodity(
        name: "Banana",
        newPrice: "GHC 100.50",
        oldPrice: "GHC 95.00",
        productImage: AppImages.banana,
        rateImage: AppImages.increase,
        rate: '+25%'),
    Commodity(
        name: "Tomato",
        newPrice: "GHC 180.00",
        oldPrice: "GHC 200.50",
        productImage: AppImages.tomato,
        rateImage: AppImages.decrease,
        rate: '-16%'),
    Commodity(
        name: "Cassava",
        newPrice: "GHC 100.00",
        oldPrice: "GHC 80.50",
        productImage: AppImages.cassava,
        rateImage: AppImages.increase,
        rate: '+11%'),
    Commodity(
        name: "Plantain",
        newPrice: "GHC 80.00",
        oldPrice: "GHC 180.50",
        productImage: AppImages.plantain,
        rateImage: AppImages.decrease,
        rate: '-16%'),
    Commodity(
        name: "Pineapple",
        newPrice: "GHC 70.00",
        oldPrice: "GHC 100.00",
        productImage: AppImages.pineapple,
        rateImage: AppImages.decrease,
        rate: '-13%'),
    Commodity(
        name: "Rice",
        newPrice: "GHC 150.00",
        oldPrice: "GHC 80.00",
        productImage: AppImages.rice,
        rateImage: AppImages.increase,
        rate: '+13%'),
    Commodity(
        name: "Carrot",
        newPrice: "GHC 60.50",
        oldPrice: "GHC 80.00",
        productImage: AppImages.carrot,
        rateImage: AppImages.decrease,
        rate: '-7%'),
    Commodity(
        name: "Cock",
        newPrice: "GHC 155.00",
        oldPrice: "GHC 80.00",
        productImage: AppImages.rooster,
        rateImage: AppImages.increase,
        rate: '+10%'),
    Commodity(
        name: "Onion",
        newPrice: "GHC 95.00",
        oldPrice: "GHC 110.50",
        productImage: AppImages.onion,
        rateImage: AppImages.decrease,
        rate: '-14%'),
    Commodity(
        name: "Orange",
        newPrice: "GHC 145.50",
        oldPrice: "GHC 90.00",
        productImage: AppImages.orange,
        rateImage: AppImages.increase,
        rate: '+17%'),
    Commodity(
        name: "Peanut",
        newPrice: "GHC 150.00",
        oldPrice: "GHC 130.50",
        productImage: AppImages.peanut,
        rateImage: AppImages.increase,
        rate: '+11%'),
    Commodity(
        name: "Pepper",
        newPrice: "GHC 120.50",
        oldPrice: "GHC 80.50",
        productImage: AppImages.pepper,
        rateImage: AppImages.decrease,
        rate: '-12%'),
    Commodity(
        name: "Soybean",
        newPrice: "GHC 110.00",
        oldPrice: "GHC 100.00",
        productImage: AppImages.soybean,
        rateImage: AppImages.increase,
        rate: '+11%'),
    Commodity(
        name: "Tilapia",
        newPrice: "GHC 65.00",
        oldPrice: "GHC 60.00",
        productImage: AppImages.tilapia,
        rateImage: AppImages.decrease,
        rate: '-11%'),
  ];
}
