
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hotel_booking/future/views/home/home_state/bloc/recommended_category_bloc.dart';
import 'package:flutter_hotel_booking/future/views/home/widget/home_sections/best_popular_section.dart';
import 'package:flutter_hotel_booking/future/views/home/widget/index.dart';
import 'package:flutter_hotel_booking/future/views/map/map_view.dart';
import 'package:flutter_hotel_booking/product/constant/design/app_padding.dart';
import 'package:flutter_hotel_booking/product/constant/design/app_shadow.dart';
import 'package:flutter_hotel_booking/product/service/service_locator.dart';
import 'package:flutter_hotel_booking/product/state/hotels/top_picks/top_picks_cubit.dart';
import 'package:gen/gen.dart';

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
        onRefresh: () async {
          context.read<RecommendedCategoryBloc>().add(
            const RecommendedCategoryEvent.started(),
          );
          await context.read<TopPicksCubit>().loadTopPicks();
        },
        child: CustomScrollView(
          slivers: [
            CustomHomeAppBar(
              userName: 'John Doe',
              userImageUrl: 'https://i.pravatar.cc/150?img=12',
              onNotificationPressed: () {},
              onSearchPressed: () {},
            ),

            SilverSectionBoxAdapter(
              sectionTitleText: 'Most Popular',
              children: const [
                MostPopularHotelCard(),
              ],
              onSeeAllPressed: () {},
            ),

            SilverSectionBoxAdapter(
              sectionTitleText: 'Recommended for you',
              children: const [
                RecommendedSection(),
                     ],
              onSeeAllPressed: () {},
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => const MapView(),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.2,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/maps.jpg'),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SilverSectionBoxAdapter(
              sectionTitleText: 'Best Today 🔥',
              children: const [
                BestTodayCard(),
                SizedBox(height: 10),
              ],
              onSeeAllPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
