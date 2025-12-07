part of '../home_view.dart';

final class SilverSectionBoxAdapter extends StatelessWidget {
  const SilverSectionBoxAdapter({
    required this.sectionTitleText,
    required this.children ,
    this.sectionTextButton = 'See All',
    super.key,
  });

  final String sectionTitleText;
  final String sectionTextButton;
  final List<Widget?> children ;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: ProjectPadding.allMedium,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  sectionTitleText,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(sectionTextButton),
                ),
              ],
            ),
          ),

          ...children.whereType<Widget>(),
        ],
      ),
    );
  }
}
