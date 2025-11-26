import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking/future/login_process/login/signup/sign_up_view_model.dart';
import 'package:flutter_hotel_booking/product/constant/design/app_padding.dart';
import 'package:flutter_hotel_booking/product/constant/strings/general_strings.dart';
import 'package:flutter_hotel_booking/product/constant/strings/key/app_keys.dart';

import 'package:flutter_hotel_booking/product/constant/strings/views/auth_strings.dart';
import 'package:flutter_hotel_booking/product/service/service_locator.dart';
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
                  text: AuthStrings.signUpTitle,
                  titleColor: ColorName.greyscale4,
                  descriptionColor: ColorName.greyscale4,
                  description: AuthStrings.emailHint,
                ),

                AppMultiTextfield(
                  title: AuthStrings.fullName,
                  textField: CustomTextField(
                    controller: fullNameController,
                    hintText: AuthStrings.enterYourName,
                    validator: AppValidators.username,
                    onChanged: (value) {},
                    keyboardType: TextInputType.name,
                  ),
                ),

                AppMultiTextfield(
                  title: AuthStrings.emailLabel,
                  textField: CustomTextField(
                    controller: emailController,
                    hintText: AuthStrings.emailHint,
                    validator: AppValidators.email,
                    onChanged: (value) {},
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),

                AppMultiTextfield(
                  title: AuthStrings.passwordLabel,
                  textField: ValueListenableBuilder<bool>(
                    valueListenable: obscurePassword,
                    builder: (context, isObscure, _) {
                      return CustomTextField(
                        controller: passwordController,
                        hintText: AuthStrings.passwordHint,
                        validator: AppValidators.password,
                        onChanged: (value) {},
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: isObscure,
                        suffixIcon: IconButton(
                          icon: Icon(
                            isObscure ? Icons.visibility_off : Icons.visibility,
                          ),
                          onPressed: () =>
                              obscurePassword.value = !obscurePassword.value,
                        ),
                      );
                    },
                  ),
                ),

                AppCustomElevatedButton(
                  text: AuthStrings.createAccount,
                  onPressed: appCustomElevatedButtonOnPressed,
                ),

                const DividerWithText(
                  text: AuthStrings.orSignInWith,
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
                  text1: AuthStrings.termsAgreement,
                  text2: AuthStrings.termsAgreement2,
                  fontWeight1: FontWeight.w400,
                  fontWeight2: FontWeight.w600,
                  color2: ColorName.greyscale4,
                  onTap: () {
                    locator.urlLauncherService.launchUrlInBrowser(
                      url: GeneralStrings.akillisletme,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
