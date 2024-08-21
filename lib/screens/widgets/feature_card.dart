import 'package:agricstock/shared/data/feature_product.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:agricstock/core/constants/app_colors.dart';
import 'package:agricstock/core/constants/app_images.dart';
import 'package:agricstock/shared/widgets/custom_text.dart';

class FeaturedCard extends StatelessWidget {
  const FeaturedCard({
    super.key,
    required this.product,
  });

  final FeatureProduct product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.h,
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.h),
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.linearGradient1Color,
                AppColors.linearGradient2Color,
                AppColors.linearGradient3Color,
              ])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 120.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      body: product.title,
                      color: AppColors.whiteColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    15.verticalSpace,
                    Row(
                      children: [
                        Image(
                          image: product.image,
                          height: 90.h,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                height: 60.h,
                width: 60.w,
                fit: BoxFit.cover,
                image: AppImages.whiteIncrease,
              ),
              CustomText(
                body: product.newPrice,
                color: AppColors.lightGreenColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              CustomText(
                body: product.oldPrice,
                color: const Color.fromARGB(255, 222, 226, 235),
                fontSize: 16,
              ),
              CustomText(
                body: "${product.rate}%",
                color: AppColors.lightGreenColor,
                fontSize: 16,
              ),
            ],
          )
        ],
      ),
    );
  }
}
