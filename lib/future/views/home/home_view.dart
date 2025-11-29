import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hotel_booking/product/state/cubit/theme/theme_cubit.dart';

import 'package:widgets/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            elevation: 0,
            scrolledUnderElevation: 4,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.transparent,
            toolbarHeight: 80,
            shadowColor: Colors.black, // Bu satırı ekle

            title: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue.shade400,
                        Colors.purple.shade400,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: const CircleAvatar(
                    radius: 24,
                    backgroundImage: NetworkImage(
                      'https://i.pravatar.cc/150?img=12',
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Welcome back 👋',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'John Doe',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: Badge(
                    smallSize: 9,
                    backgroundColor: Colors.red,
                    child: Icon(
                      Icons.notifications_outlined,
                      color: Colors.grey.shade800,
                      size: 26,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 16),
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search_rounded,
                    color: Colors.grey.shade800,
                    size: 26,
                  ),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: size.height * 0.1),
                  Container(
                    width: 100,
                    height: 300,
                    color: Colors.red,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: 100,
                    height: 300,
                    color: Colors.red,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: 100,
                    height: 300,
                    color: Colors.red,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: 100,
                    height: 300,
                    color: Colors.red,
                  ),
                  const SizedBox(height: 20),
                  AppCustomElevatedButton(
                    onPressed: () => context.read<ThemeCubit>().toggleTheme(),
                    text: 'Change Theme',
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
