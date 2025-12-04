import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking/future/views/home/widget/home_appbar.dart';
import 'package:flutter_hotel_booking/future/views/home/widget/hotel_card_widget.dart';
import 'package:flutter_hotel_booking/future/views/home/widget/hotel_compacktcard.dart';
import 'package:flutter_hotel_booking/future/views/home/widget/hotel_model.dart';
import 'package:flutter_hotel_booking/future/views/home/widget/recomenddet_foryou.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HotelModel hotel = const HotelModel(
    id: '1',
    name: 'Grand Royal Hotel',
    location: 'New York, USA',
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/hotel-a07ef.firebasestorage.app/o/hotels1%20(1).jpg?alt=media&token=2407ac9e-9d04-4766-a5dd-485a34ccc5c2',
    rating: 4.5,
    pricePerNight: 150,
    isAssetImage: false,
  );
  final String imageurl =
      'https://firebasestorage.googleapis.com/v0/b/hotel-a07ef.firebasestorage.app/o/hotels1%20(2).jpg?alt=media&token=7c664e70-fa1d-4e2a-9e56-fe05e1f1d0af';
  Future<void> _onRefresh() async {
    await Future<void>.delayed(const Duration(seconds: 2));
    setState(() {
      // Veriyi yenile
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        edgeOffset: 30,
        displacement: 20,
        backgroundColor: Colors.red,
        color: Colors.cyanAccent,
        child: CustomScrollView(
          slivers: [
            CustomHomeAppBar(
              userName: 'John Doe',
              userImageUrl: 'https://i.pravatar.cc/150?img=12',
              onNotificationPressed: () {},
              onSearchPressed: () {},
            ),

            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Most Popular',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('See All'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.3,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: HotelCard(
                            hotel: hotel,
                            width: size.width * 0.43,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recommended for you',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('See All'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: 6, // "All" butonu dahil
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                              ),
                              child: const Text('All'),
                            ),
                          );
                        }

                        // Diğer kategoriler
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.villa, size: 18),
                            label: Text('Villas $index'),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            SliverList.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return HotelListCard(
                  hotel: hotel,
                  onTap: () {
                    // Detay sayfasına git
                  },
                );
              },
            ),

            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Hotel  Near You',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Open Map'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: size.height * 0.25,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Best Today 🔥',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('See All'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(left: 16),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return HotelCompactCard(
                          hotel: hotel,
                          onTap: () {
                            // Detay sayfasına git
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
