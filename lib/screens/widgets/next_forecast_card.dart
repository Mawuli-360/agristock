import 'package:agricstock/core/constants/app_colors.dart';
import 'package:agricstock/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NextForecastCard extends StatelessWidget {
  const NextForecastCard({
    super.key,
    required this.nextForecast,
  });

  final List<Map<String, dynamic>> nextForecast;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260.h,
      padding: EdgeInsets.all(10.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.h),
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.gradientColorBlack1,
                AppColors.gradientColorBlack2,
                AppColors.gradientColorBlack3,
              ])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(nextForecast.length, (index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 200.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      body: nextForecast[index]['day'],
                      color: AppColors.whiteColor,
                      fontSize: 18,
                    ),
                    Image(
                      image: nextForecast[index]['icon'],
                      fit: BoxFit.cover,
                      height: 26.h,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  CustomText(
                    body: nextForecast[index]['high'],
                    color: AppColors.whiteColor,
                  ),
                  15.horizontalSpace,
                  CustomText(
                    body: nextForecast[index]['low'],
                    color: AppColors.whiteColor,
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
