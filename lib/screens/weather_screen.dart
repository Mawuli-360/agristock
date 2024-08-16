import 'package:agricstock/core/constants/app_colors.dart';
import 'package:agricstock/core/constants/app_images.dart';
import 'package:agricstock/screens/widgets/next_forecast_card.dart';
import 'package:agricstock/shared/widgets/custom_text.dart';
import 'package:agricstock/shared/widgets/weather_dashboard.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherScreen extends ConsumerStatefulWidget {
  const WeatherScreen({super.key});

  @override
  ConsumerState<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends ConsumerState<WeatherScreen> {
  List<Map<String, dynamic>> dailyWeather = [
    {"day": "SAT", "icon": AppImages.sun},
    {"day": "SUN", "icon": AppImages.sun},
    {"day": "MON", "icon": AppImages.partlySunny},
    {"day": "TUE", "icon": AppImages.cloud},
    {"day": "WED", "icon": AppImages.rain},
    {"day": "THU", "icon": AppImages.cloud},
    {"day": "FRI", "icon": AppImages.partlySunny},
  ];

  List<Map<String, dynamic>> nextForecast = [
    {"day": "Monday", "icon": AppImages.sun, "high": "13°c", "low": "10°c"},
    {"day": "Tuesday", "icon": AppImages.sun, "high": "17°c", "low": "12°c"},
    {
      "day": "Wednesday",
      "icon": AppImages.partlySunny,
      "high": "13°c",
      "low": "10°c"
    },
    {"day": "Thursday", "icon": AppImages.cloud, "high": "21°c", "low": "18°c"},
    {"day": "Friday", "icon": AppImages.rain, "high": "13°c", "low": "10°c"},
    {"day": "Saturday", "icon": AppImages.cloud, "high": "16°c", "low": "16°c"},
    {
      "day": "Sunday",
      "icon": AppImages.partlySunny,
      "high": "13°c",
      "low": "10°c"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  30.verticalSpace,
                  WeatherDashboard(dailyWeather: dailyWeather),
                  20.verticalSpace,
                  const CustomText(
                    body: "Next Forecast",
                    fontWeight: FontWeight.w500,
                    fontSize: 19,
                  ),
                  5.verticalSpace,
                  NextForecastCard(nextForecast: nextForecast),
                  50.verticalSpace,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
