import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking/future/login_process/login/signup/sign_up_view_model.dart';
import 'package:flutter_hotel_booking/product/constant/app_keys.dart';
import 'package:flutter_hotel_booking/product/constant/app_padding.dart';
import 'package:flutter_hotel_booking/product/constant/app_strings.dart';
import 'package:flutter_hotel_booking/product/service/services/service_validator.dart';
import 'package:gen/gen.dart';
import 'package:widgets/widgets.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends SignUpViewModel {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: ProjectPadding.horizontalLarge,
          child: Form(
            key: AppKeys.signUpFormKey,
            child: Column(
              spacing: 30,
              children: [
                SizedBox(height: size.height * 0.05),
                
                const AppTitleDescriptionText(
                  text: AppStrings.signUpTitle,
                  titleColor: ColorName.greyscale4,
                  descriptionColor: ColorName.greyscale4,
                  description: AppStrings.emailHint,
                ),

                AppMultiTextfield(
                  title: AppStrings.fullName,
                  textField: CustomTextField(
                    controller: usernameController,
                    hintText: AppStrings.enterYourName,
                    validator: AppValidators.username,
                    onChanged: (value) {},
                    keyboardType: TextInputType.name,
                  ),
                ),

                AppMultiTextfield(
                  title: AppStrings.emailLabel,
                  textField: CustomTextField(
                    controller: emailController,
                    hintText: AppStrings.emailHint,
                    validator: AppValidators.email,
                    onChanged: (value) {},
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),

                AppMultiTextfield(
                  title: AppStrings.passwordLabel,
                  textField: CustomTextField(
                    controller: passwordController,
                    hintText: AppStrings.passwordHint,
                    validator: AppValidators.password,
                    onChanged: (value) {},
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    suffixIcon: const Icon(Icons.visibility),
                  ),
                ),

                AppCustomElevatedButton(
                  text: AppStrings.signIn,
                  onPressed: appCustomElevatedButtonOnPressed,
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
      ),
    );
  }
}
