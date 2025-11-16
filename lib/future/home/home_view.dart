import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

import 'package:widgets/widgets.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home View'),
      ),
      body: Center(
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppTitleDescriptionText(
              text: 'Let’s Sign you in',
              titleColor: ColorName.greyscale4,
              descriptionColor: ColorName.greyscale4,
              description: 'Lorem ipsum dolor sit amet, consectetur',
            ),
            AppMultiTextfield(
              title: 'Email Address',
              textField: CustomTextField(
                labelText: 'Enter your email address',
                onChanged: (value) {},
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            AppMultiTextfield(
              title: 'Email Address',
              textField: CustomTextField(
                labelText: 'Enter your email address',
                onChanged: (value) {},
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            AppMultiTextfield(
              title: 'Email Address',
              textField: CustomTextField(
                labelText: 'Enter your email address',
                onChanged: (value) {},
                keyboardType: TextInputType.emailAddress,
              ),
            ),

            
          ],
        ),
      ),
    );
  }
}
