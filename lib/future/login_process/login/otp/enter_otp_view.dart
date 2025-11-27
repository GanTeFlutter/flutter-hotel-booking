import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hotel_booking/future/login_process/login/otp/enter_otp_view_model.dart';
import 'package:flutter_hotel_booking/product/constant/design/app_padding.dart';

import 'package:flutter_hotel_booking/product/constant/strings/views/auth_strings.dart';
import 'package:flutter_hotel_booking/product/constant/strings/views/onboarding_strings.dart';
import 'package:flutter_hotel_booking/product/extension/show_snackbar.dart';
import 'package:flutter_hotel_booking/product/state/cubit/countdown/countdown_cubit.dart';
import 'package:flutter_hotel_booking/product/theme/theme_companent/pin_theme.dart';
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
                text: AuthStrings.enterOtp,
                titleColor: ColorName.greyscale4,
                descriptionColor: ColorName.greyscale4,
                description: AuthStrings.emailHint,
              ),

              Text(widget.params.email),

              Pinput(
                controller: pinController,
                onCompleted: continueButton,
                focusNode: FocusNode(),
                enabled: enabledPinput,
                forceErrorState: hasError,
                defaultPinTheme: AppPinTheme.defaultPinTheme,
                focusedPinTheme: AppPinTheme.focusedPinTheme,
                submittedPinTheme: AppPinTheme.submittedPinTheme,
                errorPinTheme: AppPinTheme.errorPinTheme,
                disabledPinTheme: AppPinTheme.disabledPinTheme,
              ),

              AppCustomElevatedButton(
                text: OnboardingStrings.buttonContinue,
                onPressed: isLoading
                    ? null
                    : () => continueButton(pinController.text),
              ),

              BlocConsumer<CountdownCubit, CountdownState>(
                listener: (context, state) {
                  if (state is CountdownFinished) {
                    context.showSnackBar(
                      'Kod süresi doldu, lütfen tekrar gönderin.',
                      isError: true,
                    );
                    setState(() {
                      codeSent = false;
                    });
                  }
                },
                builder: (context, state) {
                  if (state is CountdownRunning) {
                    return Text(state.time);
                  }
                  if (state is CountdownFinished) {
                    return CustomRichText(
                      text1: AuthStrings.resendCode,
                      text2: AuthStrings.resendCode2,
                      fontWeight1: FontWeight.w400,
                      fontWeight2: FontWeight.w600,
                      color2: ColorName.greyscale4,
                      onTap: () {
                        sendCode();
                        context.read<CountdownCubit>().start();
                      },
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
