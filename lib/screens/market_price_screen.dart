import 'package:agricstock/core/constants/app_colors.dart';
import 'package:agricstock/core/constants/app_images.dart';
import 'package:agricstock/screens/widgets/feature_card.dart';
import 'package:agricstock/screens/widgets/price_list_card.dart';
import 'package:agricstock/shared/data/commodity_data.dart';
import 'package:agricstock/shared/data/feature_product.dart';
import 'package:agricstock/shared/widgets/custom_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarketPriceScreen extends ConsumerStatefulWidget {
  const MarketPriceScreen({super.key});

  @override
  ConsumerState<MarketPriceScreen> createState() => _MarketPriceScreenState();
}

class _MarketPriceScreenState extends ConsumerState<MarketPriceScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late CarouselSliderController carouselController;

  @override
  void initState() {
    carouselController = CarouselSliderController();
    super.initState();
  }

  final List<FeatureProduct> products = [
    FeatureProduct(
        title: "Fresh Corn",
        newPrice: "GHC 2.99",
        oldPrice: "GHC 3.49",
        rate: "+4.5",
        image: AppImages.corn),
    FeatureProduct(
        title: "Ripe Apple",
        newPrice: "GHC 1.99",
        oldPrice: "GHC 2.49",
        rate: "+4.2",
        image: AppImages.apple),
    FeatureProduct(
        title: "Fresh Banana",
        newPrice: "GHC 3.49",
        oldPrice: "GHC 3.99",
        rate: "+4.7",
        image: AppImages.bana)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                30.verticalSpace,
                SizedBox(
                  height: 180.h,
                  child: Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 160.h,
                        child: CarouselSlider(
                          carouselController: carouselController,
                          items: List.generate(products.length, (index) {
                            return Builder(builder: (BuildContext context) {
                              final product = products[index];
                              return FeaturedCard(product: product);
                            });
                          }),
                          options: CarouselOptions(
                            enlargeCenterPage: true,
                            autoPlay: true,
                            viewportFraction: 0.75.h,
                            autoPlayAnimationDuration:
                                const Duration(seconds: 3),
                            onPageChanged: (index, reason) {
                              setState(() {
                                _currentIndex = index;
                              });
                            },
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: _buildIndicators()),
                    ],
                  ),
                ),
                20.verticalSpace,
                const CustomText(
                  body: "Price List",
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.greenColor,
                ),
                10.verticalSpace,
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.h),
                      topRight: Radius.circular(20.h),
                    ),
                  ),
                  padding: EdgeInsets.only(left: 10.h, right: 10.h),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.only(bottom: 40.h),
                    itemCount: CommodityData.commodities.length,
                    itemBuilder: (context, index) {
                      final commodity = CommodityData.commodities[index];
                      return PriceListCard(
                        commodity: commodity,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // custom indicators
  Widget _buildIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 1000),
          margin: EdgeInsets.symmetric(horizontal: 5.w),
          height: 8.h,
          width: _currentIndex == index ? 22.w : 10.w,
          decoration: BoxDecoration(
            color: AppColors.linearGradient1Color,
            borderRadius: BorderRadius.circular(10.r),
          ),
        );
      }),
    );
  }
}
