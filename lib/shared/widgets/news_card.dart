import 'package:agricstock/core/constants/app_colors.dart';
import 'package:agricstock/providers/language_provider.dart';
import 'package:agricstock/screens/news_detail_screen.dart';
import 'package:agricstock/shared/domain/news.dart';
import 'package:agricstock/shared/widgets/custom_text.dart';
import 'package:agricstock/shared/widgets/primary_button.dart';
import 'package:agricstock/util/extension/translate_extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsCard extends ConsumerWidget {
  const NewsCard({
    super.key,
    required this.news,
  });

  final News news;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final targetLanguage = ref.watch(currentLanguage);
    return Container(
      height: 315.h,
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(16.h)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 110.h,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.h),
                topRight: Radius.circular(16.h),
              ),
              child: CachedNetworkImage(
                  fit: BoxFit.cover, height: 120.h, imageUrl: news.image),
            ),
          ),
          5.verticalSpace,
          Padding(
            padding: EdgeInsets.only(left: 10.h, right: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                news.title.translate(
                  targetLanguage,
                  fontWeight: FontWeight.w600,
                  maxLines: 2,
                  textOverflow: TextOverflow.fade,
                  fontSize: 16,
                ),

                // CustomText(
                //   body: news.title,
                //   fontWeight: FontWeight.w600,
                //   maxLines: 2,
                //   textOverflow: TextOverflow.fade,
                //   fontSize: 16,
                // ),
                5.verticalSpace,

                CustomText(
                  body: news.date,
                  color: AppColors.greyColor,
                  fontSize: 16,
                ),
                5.verticalSpace,
                news.description.translate(
                  targetLanguage,
                  color: AppColors.blackColor,
                  fontSize: 15,
                  maxLines: 2,
                  textOverflow: TextOverflow.ellipsis,
                ),

                // CustomText(
                //   body: news.description,
                //   color: AppColors.blackColor,
                //   fontSize: 15,
                //   maxLines: 2,
                //   textOverflow: TextOverflow.ellipsis,
                // ),
                5.verticalSpace,

                news.tags.translate(targetLanguage,
                    color: AppColors.hashtagColor, fontSize: 15),
                // CustomText(
                //   body: news.tags,
                //   color: AppColors.hashtagColor,
                //   fontSize: 15,
                // ),
                5.verticalSpace,
                Align(
                  alignment: Alignment.centerRight,
                  child: PrimaryButton(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewsDetailScreen(news)));
                    },
                    text: "Read More",
                    fontSize: 14,
                    height: 35,
                    width: 125,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
