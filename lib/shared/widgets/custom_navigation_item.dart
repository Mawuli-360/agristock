import 'package:agricstock/core/constants/app_colors.dart';
import 'package:agricstock/providers/language_provider.dart';
import 'package:agricstock/shared/widgets/custom_text.dart';
import 'package:agricstock/util/extension/translate_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavigationItem extends ConsumerStatefulWidget {
  const CustomBottomNavigationItem({
    super.key,
    this.isNavSelected = false,
    required this.icon,
    required this.navName,
    this.onTap,
  });

  final bool isNavSelected;
  final AssetImage icon;
  final String navName;
  final VoidCallback? onTap;

  CustomBottomNavigationItem copyWith({
    bool? isNavSelected,
    VoidCallback? onTap,
  }) {
    return CustomBottomNavigationItem(
      isNavSelected: isNavSelected ?? this.isNavSelected,
      icon: icon,
      navName: navName,
      onTap: onTap ?? this.onTap,
    );
  }

  @override
  ConsumerState<CustomBottomNavigationItem> createState() =>
      _CustomBottomNavigationItemState();
}

class _CustomBottomNavigationItemState
    extends ConsumerState<CustomBottomNavigationItem> {
  @override
  Widget build(BuildContext context) {
    // final targetLanguage = ref.watch(currentLanguage);
    return GestureDetector(
        onTap: widget.onTap,
        child: widget.isNavSelected
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedOpacity(
                    opacity: widget.isNavSelected ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 300),
                    child: CustomText(
                      body: widget.navName,
                      color: AppColors.greenColor,
                    ),
                  ),
                  4.verticalSpace,
                  Container(
                    height: 10.h,
                    width: 10.h,
                    decoration: const BoxDecoration(
                      color: AppColors.greenColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              )
            : Center(
                child: Image(
                  image: widget.icon,
                  height: 33.h,
                ),
              ));
  }
}
