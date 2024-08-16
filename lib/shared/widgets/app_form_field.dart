import 'package:agricstock/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppFormField extends StatelessWidget {
  const AppFormField(
      {super.key,
      this.suffixIcon,
      this.height,
      required this.hintText,
      this.isPassword = false,
      this.inputType,
      this.readOnly,
      this.onChanged,
      this.controller});

  final Widget? suffixIcon;
  final double? height;
  final String hintText;
  final bool isPassword;
  final TextInputType? inputType;
  final bool? readOnly;
  final void Function(String)? onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 60.h,
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        obscuringCharacter: '*',
        obscureText: isPassword,
        readOnly: readOnly ?? false,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelStyle: TextStyle(fontSize: 18.sp, color: AppColors.greenColor),
          // suffix: ,
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 18.sp, color: AppColors.greyColor),
        ),
      ),
    );
  }
}
