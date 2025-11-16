import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking/product/constant/app_padding.dart';
import 'package:flutter_hotel_booking/product/constant/app_strings.dart';
import 'package:gen/gen.dart';
import 'package:widgets/widgets.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
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
                text: AppStrings.signUpTitle,
                titleColor: ColorName.greyscale4,
                descriptionColor: ColorName.greyscale4,
                description: AppStrings.signUpTitleDescription,
              ),

              AppMultiTextfield(
                title: AppStrings.fullName,
                textField: CustomTextField(
                  labelText: AppStrings.enterYourName,
                  onChanged: (value) {},
                  keyboardType: TextInputType.emailAddress,
                ),
              ),

              AppMultiTextfield(
                title: AppStrings.emailLabel,
                textField: CustomTextField(
                  labelText: AppStrings.emailHint,
                  onChanged: (value) {},
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              AppMultiTextfield(
                title: AppStrings.passwordLabel,
                textField: CustomTextField(
                  labelText: AppStrings.passwordHint,
                  onChanged: (value) {},
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  suffixIcon: const Icon(Icons.visibility),
                ),
              ),
              AppCustomElevatedButton(
                text: AppStrings.signIn,
                onPressed: () {},
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
                onFacebookTap: () {},
                onAppleTap: () {},
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
