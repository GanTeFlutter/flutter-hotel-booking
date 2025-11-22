import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking/future/login_process/login/otp/enter_otp_view_model.dart';
import 'package:flutter_hotel_booking/product/constant/app_padding.dart';
import 'package:flutter_hotel_booking/product/constant/app_strings.dart';
import 'package:flutter_hotel_booking/product/theme/pin_theme.dart';
import 'package:gen/gen.dart';
import 'package:pinput/pinput.dart';
import 'package:widgets/widgets.dart';

class EnterOtpView extends StatefulWidget {
  const EnterOtpView({
    required this.params,
    super.key,
  });

  final OtpParams params;
  @override
  State<EnterOtpView> createState() => _EnterOtpViewState();
}

class _EnterOtpViewState extends EnterOtpViewModel {
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
                text: AppStrings.enterOtp,
                titleColor: ColorName.greyscale4,
                descriptionColor: ColorName.greyscale4,
                description: AppStrings.emailHint,
              ),
              Text(widget.params.email),
              Pinput(
                controller: pinController,
                validator: validatePin,
                onCompleted: print,
                focusNode: FocusNode(),
                enabled: enabledPinput,
                defaultPinTheme: AppPinTheme.defaultPinTheme,
                focusedPinTheme: AppPinTheme.focusedPinTheme,
                submittedPinTheme: AppPinTheme.submittedPinTheme,
                errorPinTheme: AppPinTheme.errorPinTheme,
                disabledPinTheme: AppPinTheme.disabledPinTheme,
              ),

              AppCustomElevatedButton(
                text: AppStrings.signIn,
                onPressed: continueButton,
              ),

              CustomRichText(
                text1: AppStrings.resendCode,
                text2: AppStrings.resendCode2,
                fontWeight1: FontWeight.w400,
                fontWeight2: FontWeight.w600,
                color2: ColorName.greyscale4,
                onTap: resendCodeButton,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
