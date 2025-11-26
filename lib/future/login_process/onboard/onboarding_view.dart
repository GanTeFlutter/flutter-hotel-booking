import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hotel_booking/future/login_process/onboard/onboarding_template.dart';
import 'package:flutter_hotel_booking/product/constant/strings/navigation/navigation_strings.dart';
import 'package:flutter_hotel_booking/product/constant/strings/views/onboarding_strings.dart';
import 'package:flutter_hotel_booking/product/extension/show_snackbar.dart';
import 'package:flutter_hotel_booking/product/service/service_locator.dart';
import 'package:flutter_hotel_booking/product/state/bloc/auth/auth_bloc.dart';
import 'package:flutter_hotel_booking/product/state/cubit/onboarding/onboarding_cubit.dart';
import 'package:gen/gen.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:widgets/widgets.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late final PageController _pageController;
  late final OnboardingCubit _cubit;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _cubit = OnboardingCubit()..pageController = _pageController;
  }

  @override
  void dispose() {
    _pageController.dispose();
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: BlocBuilder<OnboardingCubit, int>(
        builder: (context, currentPage) {
          return Scaffold(
            body: Stack(
              children: [
                PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    context.read<OnboardingCubit>().setPage(index);
                  },
                  children: const [
                    _OnboardingView1(),
                    _OnboardingView2(),
                    _OnboardingView3(),
                  ],
                ),
                if (currentPage < 2)
                  Positioned(
                    bottom: MediaQuery.of(context).size.height * 0.15,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: SmoothPageIndicator(
                        controller: _pageController,
                        count: 3,
                        effect: WormEffect(
                          dotHeight: 8,
                          dotWidth: 8,
                          activeDotColor: ColorName.primary500,
                          dotColor: ColorName.greyscale400.withValues(
                            alpha: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Onboard Pages

final class _OnboardingView1 extends StatelessWidget {
  const _OnboardingView1();

  @override
  Widget build(BuildContext context) {
    return OnboardingViewTemplate(
      backgroundImage: Assets.image.obStep1,
      title: OnboardingStrings.step1Title,
      description: OnboardingStrings.step1Description,
      buttonText: OnboardingStrings.buttonContinue,
      onButtonPressed: () {
        if (context.mounted) {
          context.read<OnboardingCubit>().nextPage();
        }
      },
    );
  }
}

final class _OnboardingView2 extends StatelessWidget {
  const _OnboardingView2();

  @override
  Widget build(BuildContext context) {
    return OnboardingViewTemplate(
      backgroundImage: Assets.image.obStep2,
      title: OnboardingStrings.step2Title,
      description: OnboardingStrings.step2Description,
      buttonText: OnboardingStrings.buttonContinue,
      onButtonPressed: () {
        if (context.mounted) {
          context.read<OnboardingCubit>().nextPage();
        }
      },
    );
  }
}

final class _OnboardingView3 extends StatelessWidget {
  const _OnboardingView3();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          context.goNamed(NavigationStrings.homeView);
        } else if (state is AuthError) {
          context.showSnackBar(
            'Anonim giriş başarısız: ${state.message}',
            isError: true,
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is AuthLoading;

        return OnboardingViewTemplate(
          backgroundImage: Assets.image.obStep3,
          title: OnboardingStrings.step3Title,
          description: OnboardingStrings.step3Description,
          buttonText: OnboardingStrings.buttonContinue,
          onButtonPressed: isLoading
              ? null
              : () {
                  context.read<AuthBloc>().add(AuthAnonymousSignInRequested());
                },
          showIndicatorSpace: false,
          bottomWidget: isLoading
              ? const AppProgressIndicator()
              : CustomRichText(
                  text1: OnboardingStrings.newAccount,
                  text2: OnboardingStrings.register,
                  fontWeight1: FontWeight.w400,
                  fontWeight2: FontWeight.w600,
                  color1: ColorName.greyscale0,
                  color2: ColorName.primary800,
                  onTap: () async {
                    await locator.spService.setOnboardingCompleted(
                      isCompleted: true,
                    );
                    if (context.mounted) {
                      context.goNamed(NavigationStrings.signInView);
                    }
                  },
                ),
        );
      },
    );
  }
}
