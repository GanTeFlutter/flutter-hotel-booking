import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hotel_booking/future/views/home/home_bloc_selectors/most_popular_section.dart';

import 'package:flutter_hotel_booking/future/views/home/widget/home_appbar.dart';
import 'package:flutter_hotel_booking/future/views/home/widget/section_text.dart';
import 'package:flutter_hotel_booking/product/state/hotels/top_picks/top_picks_cubit.dart';

class HomeProvider extends StatelessWidget {
  const HomeProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TopPicksCubit()..loadTopPicks(),

      child: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator.adaptive(
        onRefresh: () => context.read<TopPicksCubit>().loadTopPicks(),
         child: CustomScrollView(
          slivers: [
            CustomHomeAppBar(
              userName: 'John Doe',
              userImageUrl: 'https://i.pravatar.cc/150?img=12',
              onNotificationPressed: () {},
              onSearchPressed: () {},
            ),

            //Most Popular Hotel Section
            const SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionText(),
                  MostPopularSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
