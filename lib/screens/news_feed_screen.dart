import 'package:agricstock/core/constants/app_colors.dart';
import 'package:agricstock/shared/data/news_data.dart';
import 'package:agricstock/shared/widgets/news_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsFeedScreen extends ConsumerWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: ListView.builder(
            itemCount: NewsData.news.length,
            padding: EdgeInsets.only(
                left: 15.h, right: 15.h, top: 15.h, bottom: 40.h),
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: NewsCard(
                news: NewsData.news[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
