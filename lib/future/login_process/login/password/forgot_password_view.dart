import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hotel_booking/future/login_process/login/password/view_model/forgot_password_view_model.dart';
import 'package:flutter_hotel_booking/product/constant/design/app_padding.dart';
import 'package:flutter_hotel_booking/product/constant/strings/key/app_keys.dart';
import 'package:flutter_hotel_booking/product/constant/strings/views/auth_strings.dart';
import 'package:flutter_hotel_booking/product/extension/show_snackbar.dart';
import 'package:flutter_hotel_booking/product/service/services/service_validator.dart';
import 'package:flutter_hotel_booking/product/state/bloc/auth/auth_bloc.dart';
import 'package:gen/gen.dart';
import 'package:widgets/widgets.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends ForgotPasswordViewModel {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      resizeToAvoidBottomInset: true,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            context.showSnackBar(state.message);
          }
          if (state is AuthPasswordResetSuccess) {
            showSuccessDialog(context);
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              padding: ProjectPadding.horizontalLarge,
              child: Form(
                key: AppKeys.forgotPasswordFormKey,
                child: Column(
                  spacing: 30,
                  children: [
                    SizedBox(height: size.height * 0.05),
                    const AppTitleDescriptionText(
                      text: AuthStrings.forgotPassword,
                      description: AuthStrings.recoverPasswordSubtitle,
                      titleColor: ColorName.greyscale4,
                      descriptionColor: ColorName.greyscale4,
                    ),
                    AppMultiTextfield(
                      title: AuthStrings.emailHint,
                      textField: CustomTextField(
                        controller: emailController,
                        validator: AppValidators.email,
                        hintText: AuthStrings.emailLabel,
                        onChanged: (value) {},
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    if (state is AuthLoading)
                      const Center(child: AppProgressIndicator())
                    else
                      AppCustomElevatedButton(
                        text: AuthStrings.next,
                        onPressed: next,
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
