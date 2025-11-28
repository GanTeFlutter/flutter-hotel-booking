// main_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hotel_booking/future/views/home/home_view.dart';
import 'package:flutter_hotel_booking/future/views/message/message_view.dart';
import 'package:flutter_hotel_booking/future/views/my_booking/my_booking_view.dart';
import 'package:flutter_hotel_booking/future/views/profile/profile_view.dart';
import 'package:flutter_hotel_booking/product/state/cubit/bottom_nav_bar/bottom_nav_bar_cubit.dart';
import 'package:gen/gen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final NavigationCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = NavigationCubit();
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: BlocBuilder<NavigationCubit, int>(
        builder: (context, currentIndex) {
          return Scaffold(
            body: IndexedStack(
              index: currentIndex,
              children: const [
                HomeView(),
                MyBookingView(),
                MessageView(),
                ProfileView(),
              ],
            ),
            bottomNavigationBar: _BottomNavBar(
              currentIndex: currentIndex,
              onTap: _cubit.changeTab,
            ),
          );
        },
      ),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar({
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -10),
            color: Colors.black.withAlpha(25),
            blurRadius: 10,
          ),
        ],
      ),
      child: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: onTap,
        destinations: [
          _buildDestination(
            icon: Assets.icon.bottomNavigationBarIcon.bnHome,
            selectedIcon: Assets.icon.bottomNavigationBarIcon.bnHomeSelected,
            label: 'Home',
          ),
          _buildDestination(
            icon: Assets.icon.bottomNavigationBarIcon.bnDocument,
            selectedIcon:
                Assets.icon.bottomNavigationBarIcon.bnDocumentSelected,
            label: 'My Booking',
          ),
          _buildDestination(
            icon: Assets.icon.bottomNavigationBarIcon.bnChat,
            selectedIcon: Assets.icon.bottomNavigationBarIcon.bnChatSelected,
            label: 'Message',
          ),
          _buildDestination(
            icon: Assets.icon.bottomNavigationBarIcon.bnUser,
            selectedIcon: Assets.icon.bottomNavigationBarIcon.bnUserSelected,
            label: 'Profil',
          ),
        ],
      ),
    );
  }

  NavigationDestination _buildDestination({
    required AssetGenImage icon,
    required AssetGenImage selectedIcon,
    required String label,
  }) {
    return NavigationDestination(
      icon: icon.image(width: 24, height: 24, package: 'gen'),
      selectedIcon: selectedIcon.image(width: 24, height: 24, package: 'gen'),
      label: label,
    );
  }
}
