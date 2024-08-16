import 'package:agricstock/core/constants/app_colors.dart';
import 'package:agricstock/providers/language_provider.dart';
import 'package:agricstock/shared/domain/commodity.dart';
import 'package:agricstock/shared/widgets/custom_text.dart';
import 'package:agricstock/util/extension/translate_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceListCard extends ConsumerWidget {
  const PriceListCard({
    super.key,
    required this.commodity,
  });

  final Commodity commodity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final targetLanguage = ref.watch(currentLanguage);
    return SizedBox(
      height: 90.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 70.h,
                width: 70.h,
                decoration: const BoxDecoration(
                  color: AppColors.greenColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image(
                    image: commodity.productImage,
                    height: 45.h,
                  ),
                ),
              ),
              5.horizontalSpace,
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commodity.name.translate(targetLanguage),
                  // CustomText(body: commodity.name),
                  CustomText(
                    body: commodity.rate,
                    color: AppColors.greenColor,
                  ),
                  12.verticalSpace,
                ],
              ),
            ],
          ),
          Image(
            image: commodity.rateImage,
            height: 63.h,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomText(
                body: commodity.newPrice,
                color: AppColors.greenColor,
              ),
              CustomText(
                body: commodity.oldPrice,
                color: AppColors.greyColor,
              ),
              12.verticalSpace,
            ],
          ),
        ],
      ),
    );
  }
}
