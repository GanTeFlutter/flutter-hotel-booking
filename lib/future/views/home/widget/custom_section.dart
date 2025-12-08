part of '../home_view.dart';

final class SilverSectionBoxAdapter extends StatelessWidget {
  const SilverSectionBoxAdapter({
    required this.sectionTitleText,
    required this.children,
    this.sectionTextButton = 'See All',
    this.applyPaddingToChildren = true,
    this.onSeeAllPressed,
    super.key,
  });

  final String sectionTitleText;
  final String sectionTextButton;
  final List<Widget?> children;
  final bool applyPaddingToChildren;
  final VoidCallback? onSeeAllPressed;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: ProjectPadding.horizontalMedium,
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
                  onPressed: onSeeAllPressed,
                  child: Text(sectionTextButton),
                ),
              ],
            ),
          ),

          ...children.whereType<Widget>().map(
            (child) => applyPaddingToChildren
                ? Padding(
                    padding: ProjectPadding.horizontalMedium,
                    child: child,
                  )
                : child,
          ),
        ],
      ),
    );
  }
}
