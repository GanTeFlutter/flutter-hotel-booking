import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hotel_booking/future/login_process/login/sigin/sig_in_view_model.dart';
import 'package:flutter_hotel_booking/product/constant/design/app_padding.dart';
import 'package:flutter_hotel_booking/product/constant/strings/key/app_keys.dart';

import 'package:flutter_hotel_booking/product/constant/strings/navigation/navigation_strings.dart';
import 'package:flutter_hotel_booking/product/constant/strings/views/auth_strings.dart';
import 'package:flutter_hotel_booking/product/extension/show_snackbar.dart';
import 'package:flutter_hotel_booking/product/service/services/service_validator.dart';
import 'package:flutter_hotel_booking/product/state/bloc/auth/auth_bloc.dart';
import 'package:gen/gen.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets/widgets.dart';

class SignView extends StatefulWidget {
  const SignView({super.key});

  @override
  State<SignView> createState() => _SignViewState();
}

class _SignViewState extends SigInViewModel {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          context.pushNamed(
            NavigationStrings.enterOtpView,
            extra: OtpParams(
              email: emailController.text,
              tempUserId: state.user.id,
              fullName: '',
              password: '',
            ),
          );
        } else if (state is AuthError) {
          context.showSnackBar(state.message);
        }
      },
      builder: (context, state) {
        final isLoading = state is AuthLoading;
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: ProjectPadding.horizontalLarge,
              child: Form(
                key: AppKeys.signInFormKey,
                child: Column(
                  spacing: 30,
                  children: [
                    SizedBox(height: size.height * 0.1),

                    const AppTitleDescriptionText(
                      text: AuthStrings.loginTitle,
                      titleColor: ColorName.greyscale4,
                      descriptionColor: ColorName.greyscale4,
                      description: AuthStrings.loginSubtitle,
                    ),

                    AppMultiTextfield(
                      title: AuthStrings.emailLabel,
                      textField: CustomTextField(
                        controller: emailController,
                        validator: AppValidators.email,
                        hintText: AuthStrings.emailHint,
                        keyboardType: TextInputType.emailAddress,
                        enabled: !isLoading,
                      ),
                    ),

                    AppMultiTextfield(
                      title: AuthStrings.passwordLabel,
                      textField: ValueListenableBuilder<bool>(
                        valueListenable: obscurePassword,
                        builder: (context, isObscure, _) {
                          return CustomTextField(
                            controller: passwordController,
                            validator: AppValidators.password,
                            hintText: AuthStrings.passwordHint,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: isObscure,
                            suffixIcon: IconButton(
                              icon: Icon(
                                isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () => obscurePassword.value =
                                  !obscurePassword.value,
                            ),
                            enabled: !isLoading,
                          );
                        },
                      ),
                    ),
                    
                    IgnorePointer(
                      ignoring: isLoading,
                      child: RememberMeForgotPassword(
                        onRememberMeChanged: (value) {},
                        onForgotPasswordTap: () {
                          context.pushNamed(
                            NavigationStrings.forgotPasswordView,
                          );
                        },
                        rememberMeText: AuthStrings.rememberMe,
                        forgotPasswordText: AuthStrings.forgotPassword,
                      ),
                    ),

                    if (isLoading)
                     const AppProgressIndicator()
                    else
                      AppCustomElevatedButton(
                        text: AuthStrings.signIn,
                        onPressed: signInButton,
                      ),

                    IgnorePointer(
                      ignoring: isLoading,
                      child: CustomRichText(
                        text1: AuthStrings.noAccount1,
                        text2: AuthStrings.noAccount3,
                        fontWeight2: FontWeight.w900,
                        onTap: () {
                          context.pushNamed(NavigationStrings.signUpView);
                        },
                      ),
                    ),

                    const DividerWithText(
                      text: AuthStrings.orSignInWith,
                      textColor: ColorName.greyscale2,
                      thickness: 2,
                      horizontalPadding: 50,
                      textHorizontalPadding: 20,
                    ),

                    IgnorePointer(
                      ignoring: isLoading,
                      child: MultiSocialLoginButton(
                        width: MediaQuery.of(context).size.width,
                        onGoogleTap: () {},
                        onFacebookTap: () {
                          context.pushNamed(NavigationStrings.enterOtpView);
                        },
                        onAppleTap: () {
                          context.pushNamed(
                            NavigationStrings.createNewPasswordView,
                          );
                        },
                      ),
                    ),

                    IgnorePointer(
                      ignoring: isLoading,
                      child: CustomRichText(
                        text1: AuthStrings.termsAgreement,
                        text2: AuthStrings.termsAgreement2,
                        fontWeight1: FontWeight.w400,
                        fontWeight2: FontWeight.w600,
                        color2: ColorName.greyscale4,
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
