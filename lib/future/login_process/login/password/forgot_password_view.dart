import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking/product/constant/app_padding.dart';
import 'package:flutter_hotel_booking/product/constant/app_strings.dart';
import 'package:gen/gen.dart';
import 'package:widgets/widgets.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

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
          child: Column(
            spacing: 30,
            children: [
              SizedBox(height: size.height * 0.05),
              const AppTitleDescriptionText(
                text: AppStrings.forgotPassword,
                description: AppStrings.recoverPasswordSubtitle,
                titleColor: ColorName.greyscale4,
                descriptionColor: ColorName.greyscale4,
              ),
              AppMultiTextfield(
                title: AppStrings.emailHint,
                textField: CustomTextField(
                  hintText: AppStrings.emailLabel,
                  onChanged: (value) {},
                  keyboardType: TextInputType.emailAddress,
                ),
              ),

              AppCustomElevatedButton(
                text: AppStrings.signIn,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
