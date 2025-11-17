import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking/product/constant/app_padding.dart';
import 'package:flutter_hotel_booking/product/constant/app_strings.dart';
import 'package:gen/gen.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets/widgets.dart';

class SignView extends StatefulWidget {
  const SignView({super.key});

  @override
  State<SignView> createState() => _SignViewState();
}

class _SignViewState extends State<SignView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: ProjectPadding.horizontalLarge,
          child: Column(
            spacing: 30,
            children: [
              SizedBox(height: size.height * 0.1),
              const AppTitleDescriptionText(
                text: AppStrings.loginTitle,
                titleColor: ColorName.greyscale4,
                descriptionColor: ColorName.greyscale4,
                description: AppStrings.loginSubtitle,
              ),

              AppMultiTextfield(
                title: AppStrings.emailLabel,
                textField: CustomTextField(
                  hintText: AppStrings.emailHint,
                  onChanged: (value) {},
                  keyboardType: TextInputType.emailAddress,
                ),
              ),

              AppMultiTextfield(
                title: AppStrings.passwordLabel,
                textField: CustomTextField(
                  hintText: AppStrings.passwordHint,
                  onChanged: (value) {},
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  suffixIcon: const Icon(Icons.visibility),
                ),
              ),

              RememberMeForgotPassword(
                onRememberMeChanged: (value) {},
                onForgotPasswordTap: () {
                  context.pushNamed(AppStrings.routerForgotPasswordView);
                },
                rememberMeText: AppStrings.rememberMe,
                forgotPasswordText: AppStrings.forgotPassword,
              ),

              AppCustomElevatedButton(
                text: AppStrings.signIn,
                onPressed: () {},
              ),

              //Go to -->SignUp
              CustomRichText(
                text1: AppStrings.noAccount1,
                text2: AppStrings.noAccount3,
                fontWeight2: FontWeight.w900,
                onTap: () {
                  context.pushNamed(AppStrings.routerSignUpView);
                },
              ),

              const DividerWithText(
                text: AppStrings.orSignInWith,
                textColor: ColorName.greyscale2,
                thickness: 2,
                horizontalPadding: 50,
                textHorizontalPadding: 20,
              ),

              MultiSocialLoginButton(
                width: MediaQuery.of(context).size.width,
                onGoogleTap: () {},
                onFacebookTap: () {
                  context.pushNamed(AppStrings.routerEnterOtpView);
                },
                onAppleTap: () {
                  context.pushNamed(AppStrings.routerCreateNewPasswordView);
                },
              ),

              CustomRichText(
                text1: AppStrings.termsAgreement,
                text2: AppStrings.termsAgreement2,
                fontWeight1: FontWeight.w400,
                fontWeight2: FontWeight.w600,
                color2: ColorName.greyscale4,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
