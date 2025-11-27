// main_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                SearchView(),
                FavoritesView(),
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
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: onTap,
      backgroundColor: Colors.transparent,
      elevation: 0,
      indicatorColor: Colors.transparent,
      destinations: [
        _buildDestination(
          icon: Assets.icon.bottomNavigationBarIcon.bnHome,
          selectedIcon: Assets.icon.bottomNavigationBarIcon.bnHomeSelected,
          label: 'Home',
        ),
        _buildDestination(
          icon: Assets.icon.bottomNavigationBarIcon.bnDocument,
          selectedIcon: Assets.icon.bottomNavigationBarIcon.bnDocumentSelected,
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

// home_view.dart
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Anasayfa'));
  }
}

// search_view.dart
class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Arama Sayfası'));
  }
}

// favorites_view.dart
class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Favoriler Sayfası'));
  }
}

// profile_view.dart
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Profil Sayfası'));
  }
}
