import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking/product/widget/project_network_image.dart';

final class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({
    required this.userName,
    required this.userImageUrl,
    super.key,
    this.onNotificationPressed,
    this.onSearchPressed,
    this.hasNotification = true,
  });

  final String userName;
  final String userImageUrl;
  final VoidCallback? onNotificationPressed;
  final VoidCallback? onSearchPressed;
  final bool hasNotification;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      elevation: 0,
      scrolledUnderElevation: 4,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      toolbarHeight: 80,
      shadowColor: Colors.black,
      title: _buildUserInfo(context),
      actions: _buildActions(),
    );
  }

  Widget _buildUserInfo(BuildContext context) {
    return Row(
      spacing: 13,
      children: [
        _buildAvatar(),
        _buildGreeting(context),
      ],
    );
  }

  Widget _buildAvatar() {
    return Container(
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
      child: ClipOval(
        child: SizedBox(
          width: 48,
          height: 48,
          child: ProjectNetworkImage(url: userImageUrl),
        ),
      ),
    );
  }

  Widget _buildGreeting(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(userName, style: Theme.of(context).textTheme.titleMedium),
        Row(
          children: [
            const Icon(Icons.location_on_sharp, size: 17, color: Colors.grey),
            Text('San Diego, CA', style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
        const SizedBox(height: 4),
      ],
    );
  }

  List<Widget> _buildActions() {
    return [
      _ActionButton(
        icon: Badge(
          smallSize: 9,
          backgroundColor: Colors.red,
          isLabelVisible: hasNotification,
          child: Icon(
            Icons.notifications_outlined,
            color: Colors.grey.shade800,
            size: 26,
          ),
        ),
        onPressed: onNotificationPressed,
        marginRight: 10,
      ),
      _ActionButton(
        icon: Icon(
          Icons.search_rounded,
          color: Colors.grey.shade800,
          size: 26,
        ),
        onPressed: onSearchPressed,
        marginRight: 16,
      ),
    ];
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    this.onPressed,
    this.marginRight = 0,
  });

  final Widget icon;
  final VoidCallback? onPressed;
  final double marginRight;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: marginRight),
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: icon,
        onPressed: onPressed,
      ),
    );
  }
}
