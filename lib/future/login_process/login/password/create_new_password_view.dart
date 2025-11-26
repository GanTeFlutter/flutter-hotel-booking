import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hotel_booking/future/login_process/login/password/view_model/create_new_password_view_model.dart';
import 'package:flutter_hotel_booking/product/constant/design/app_padding.dart'
    show ProjectPadding;
import 'package:flutter_hotel_booking/product/constant/strings/key/app_keys.dart';

import 'package:flutter_hotel_booking/product/constant/strings/views/auth_strings.dart';
import 'package:flutter_hotel_booking/product/extension/show_snackbar.dart';
import 'package:flutter_hotel_booking/product/service/services/service_validator.dart';
import 'package:flutter_hotel_booking/product/state/bloc/auth/auth_bloc.dart';
import 'package:gen/gen.dart';
import 'package:widgets/widgets.dart';

class CreateNewPasswordView extends StatefulWidget {
  const CreateNewPasswordView({super.key});

  @override
  State<CreateNewPasswordView> createState() => _CreateNewPasswordViewState();
}

class _CreateNewPasswordViewState extends CreateNewPasswordViewModel {
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
          } else if (state is AuthPasswordForgotSuccess) {}
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              padding: ProjectPadding.horizontalLarge,
              child: Form(
                key: AppKeys.createNewPasswordFormKey,
                child: Column(
                  spacing: 30,
                  children: [
                    SizedBox(height: size.height * 0.05),
                    const AppTitleDescriptionText(
                      text: 'Create a\n New Password',
                      description: 'Enter your new password',
                      titleColor: ColorName.greyscale4,
                      descriptionColor: ColorName.greyscale4,
                    ),
                    AppMultiTextfield(
                      title: AuthStrings.emailHint,
                      textField: CustomTextField(
                        controller: emailController,
                        hintText: AuthStrings.emailLabel,
                        validator: AppValidators.email,
                        onChanged: (value) {},
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    AppMultiTextfield(
                      title: AuthStrings.passwordHint,
                      textField: CustomTextField(
                        controller: newPasswordController,
                        hintText: AuthStrings.passwordLabel,
                        validator: AppValidators.password,
                        onChanged: (value) {},
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),

                    AppCustomElevatedButton(
                      text: AuthStrings.next,
                      onPressed: () {},
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
