import 'package:agricstock/core/constants/app_colors.dart';
import 'package:agricstock/shared/widgets/app_form_field.dart';
import 'package:agricstock/shared/widgets/custom_text.dart';
import 'package:agricstock/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    for (var controller in [
      fullNameController,
      emailController,
      passwordController,
      confirmPasswordController
    ]) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.whiteColor,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              size: 28.h,
            )),
      ),
      body: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CustomText(
                    body: "Sign Up",
                    fontSize: 38,
                    color: AppColors.greenColor,
                    fontWeight: FontWeight.w500,
                  ),
                  40.verticalSpace,
                  const CustomText(
                    body: "First create your account",
                    fontWeight: FontWeight.w500,
                  ),
                  40.verticalSpace,
                  AppFormField(
                      controller: fullNameController, hintText: "Full name"),
                  10.verticalSpace,
                  AppFormField(controller: emailController, hintText: "Email"),
                  10.verticalSpace,
                  AppFormField(
                    controller: passwordController,
                    hintText: "Password",
                    isPassword: true,
                  ),
                  10.verticalSpace,
                  AppFormField(
                    controller: confirmPasswordController,
                    hintText: "Confirm your password",
                    isPassword: true,
                  ),
                  40.verticalSpace,
                  PrimaryButton(onTap: () {}, text: "SIGN UP"),
                  20.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomText(
                        body: "Already have an account?",
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const CustomText(
                            body: "Login",
                            color: AppColors.greenColor,
                            fontWeight: FontWeight.w500,
                          ))
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
