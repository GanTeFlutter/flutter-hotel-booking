import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hotel_booking/future/views/home/home_sections/most_popular_section.dart';
import 'package:flutter_hotel_booking/future/views/home/home_sections/recommended_category_section.dart';
import 'package:flutter_hotel_booking/future/views/home/home_state/bloc/recommended_category_bloc.dart';
import 'package:flutter_hotel_booking/future/views/home/widget/home_appbar.dart';
import 'package:flutter_hotel_booking/product/constant/design/app_padding.dart';
import 'package:flutter_hotel_booking/product/service/service_locator.dart';
import 'package:flutter_hotel_booking/product/state/hotels/top_picks/top_picks_cubit.dart';

part 'widget/custom_section.dart';

class HomeMultiBlocProvider extends StatelessWidget {
  const HomeMultiBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TopPicksCubit()..loadTopPicks(),
        ),
        BlocProvider(
          create: (context) => RecommendedCategoryBloc(
            hotelService: locator.firebaseHotelService,
          )..add(const RecommendedCategoryEvent.started()),
        ),
      ],
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
            const SilverSectionBoxAdapter(
              sectionTitleText: 'Most Popular',
              children: [
                MostPopularHotelCard(),
              ],
            ),

            const SilverSectionBoxAdapter(
              sectionTitleText: 'Recommended for you',
              children: [
                RecommendedSection(), // 👈 tek widget
                // hotel listesi (sonra yaparsın)
              ],
            ),

            const SilverSectionBoxAdapter(
              sectionTitleText: 'Most Popular',
              children: [
                MostPopularHotelCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
