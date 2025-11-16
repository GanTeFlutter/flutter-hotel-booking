import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking/future/login_process/onboard/onboarding_end_screen.dart';
import 'package:flutter_hotel_booking/future/login_process/onboard/onboarding_template.dart';
import 'package:flutter_hotel_booking/product/constant/app_strings.dart';
import 'package:flutter_hotel_booking/product/service/service_locator.dart';
import 'package:flutter_hotel_booking/product/service/services/sesvice_shared_preferences.dart';
import 'package:gen/gen.dart';
import 'package:go_router/go_router.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            children: [
              _buildPage1(),
              _buildPage2(),
              _buildPage3(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPage1() {
    return OnboardingTemplate(
      buttonText: AppStrings.onBoardingButtonContinue,
      backgroundImage: Assets.image.obStep1,
      title: AppStrings.onBoardingStep1Title,
      description: AppStrings.onBoardingStep1Description,
      onContinue: _nextPage,
      showPageIndicator: true,
      pageIndicator: SmoothPageIndicator(
        controller: _pageController,
        count: 2,
        effect: WormEffect(
          dotHeight: 8,
          dotWidth: 8,
          activeDotColor: Colors.blue,
          dotColor: Colors.grey.withValues(alpha: 0.5),
        ),
      ),
    );
  }

  Widget _buildPage2() {
    return OnboardingTemplate(
      buttonText: AppStrings.onBoardingButtonContinue,
      backgroundImage: Assets.image.obStep2,
      title: AppStrings.onBoardingStep2Title,
      description: AppStrings.onBoardingStep2Description,
      onContinue: _nextPage,
      showPageIndicator: true,
      pageIndicator: SmoothPageIndicator(
        controller: _pageController,
        count: 2,
        effect: WormEffect(
          dotHeight: 8,
          dotWidth: 8,
          activeDotColor: Colors.blue,
          dotColor: Colors.grey.withValues(alpha: 0.5),
        ),
      ),
    );
  }

  // OnboardingTemplate sayesinde tekrarlayan kodlardan kurtulduk. yeni ekranlar kolayca eklenebilir.

  Widget _buildPage3() {
    return OnBoardinEndView(
      backgroundImage: Assets.image.obStep3,
      buttonText: AppStrings.onBoardingButtonGetStarted,
      title: AppStrings.onBoardingStep3Title,
      description: AppStrings.onBoardingStep3Description,
      onContinue: () => _shortening(AppStrings.routerHomeView),
      onRegister: () => _shortening(AppStrings.routerRegisterView),
    );
  }

  void _shortening(String path) {
    locator<SharedPreferencesService>().setBool(
      key: AppStrings.spkOnboardCompleted,
      value: true,
    );
    context.goNamed(path);
  }
}
