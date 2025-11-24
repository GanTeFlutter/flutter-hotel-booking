import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hotel_booking/future/login_process/onboard/onboarding_template.dart';
import 'package:flutter_hotel_booking/product/constant/app_strings.dart';
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

final class _OnboardingView1 extends StatelessWidget {
  const _OnboardingView1();

  @override
  Widget build(BuildContext context) {
    return OnboardingViewTemplate(
      backgroundImage: Assets.image.obStep1,
      title: AppStrings.onBoardingStep1Title,
      description: AppStrings.onBoardingStep1Description,
      buttonText: AppStrings.onBoardingButtonContinue,
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
      title: AppStrings.onBoardingStep2Title,
      description: AppStrings.onBoardingStep2Description,
      buttonText: AppStrings.onBoardingButtonContinue,
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
          context.goNamed(AppStrings.routerHomeView);
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
          title: AppStrings.onBoardingStep3Title,
          description: AppStrings.onBoardingStep3Description,
          buttonText: AppStrings.onBoardingButtonContinue,
          onButtonPressed: isLoading
              ? null
              : () {
                  context.read<AuthBloc>().add(AuthAnonymousSignInRequested());
                },
          showIndicatorSpace: false,
          bottomWidget: isLoading
              ? const CircularProgressIndicator(
                  strokeWidth: 6,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    ColorName.primary500,
                  ),
                  backgroundColor: ColorName.greyscale200,
                )
              : CustomRichText(
                  text1: AppStrings.noAccount1,
                  text2: AppStrings.noAccount2,
                  fontWeight1: FontWeight.w400,
                  fontWeight2: FontWeight.w600,
                  color1: ColorName.greyscale0,
                  color2: ColorName.primary800,
                  onTap: () async {
                    await locator.spService.setOnboardingCompleted(
                      isCompleted: true,
                    );
                    if (context.mounted) {
                      context.goNamed(AppStrings.routerSignInView);
                    }
                  },
                ),
        );
      },
    );
  }
}
