import 'package:agricstock/core/constants/app_colors.dart';
import 'package:agricstock/core/constants/app_images.dart';
import 'package:agricstock/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherDashboard extends StatelessWidget {
  const WeatherDashboard({
    super.key,
    required this.dailyWeather,
  });

  final List<Map<String, dynamic>> dailyWeather;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.h),
      height: 368.h,
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
      child: Column(
        children: [
          SizedBox(
            height: 220.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 150.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: double.infinity,
                          height: 140.h,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 7.h,
                                child: const CustomText(
                                  body: "Thursday",
                                  fontSize: 18,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                              Positioned(
                                top: 7.h,
                                right: 40.h,
                                child: const CustomText(
                                  body: "°",
                                  fontSize: 55,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                              Positioned(
                                bottom: 4.h,
                                child: const CustomText(
                                  body: "26",
                                  fontSize: 75,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                              const Align(
                                alignment: Alignment.bottomLeft,
                                child: CustomText(
                                  body: "Last updated 11:45",
                                  fontSize: 14,
                                  color: Color.fromARGB(195, 230, 230, 230),
                                ),
                              ),
                            ],
                          )),
                      20.verticalSpace,
                      const CustomText(
                        body: "High  30°",
                        color: AppColors.whiteColor,
                      ),
                      5.verticalSpace,
                      const CustomText(
                        body: "Low   20°",
                        color: AppColors.whiteColor,
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomText(
                      body: "Clear",
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w500,
                    ),
                    20.verticalSpace,
                    Image(
                      fit: BoxFit.cover,
                      height: 100.h,
                      image: AppImages.cloud,
                    ),
                  ],
                )
              ],
            ),
          ),
          15.verticalSpace,
          SizedBox(
            height: 60.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: dailyWeather.map((elememt) {
                return Column(
                  children: [
                    CustomText(
                      body: elememt['day'],
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    10.verticalSpace,
                    Image(
                      image: elememt['icon'],
                      height: 18.h,
                      fit: BoxFit.cover,
                    )
                  ],
                );
              }).toList(),
            ),
          ),
          15.verticalSpace,
          Row(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: AppColors.whiteColor,
                    size: 26.h,
                  ),
                  const CustomText(
                    body: "Eastern, Ghana",
                    fontSize: 14,
                    color: AppColors.whiteColor,
                  ),
                  8.horizontalSpace,
                  Row(
                    children: [
                      Image(
                        image: AppImages.wind,
                        height: 30.h,
                      ),
                      8.horizontalSpace,
                      const CustomText(
                        body: "Wind Speed 28 km/h",
                        fontSize: 14,
                        color: AppColors.whiteColor,
                      )
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
