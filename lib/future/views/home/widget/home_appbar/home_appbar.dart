import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking/product/service/service_locator.dart';
import 'package:flutter_hotel_booking/product/widget/project_network_image.dart';
import 'package:gen/gen.dart';

final class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({
    super.key,
    this.onNotificationPressed,
    this.onSearchPressed,
    this.onLocationPressed,
    this.hasNotification = true,
  });

  final VoidCallback? onNotificationPressed;
  final VoidCallback? onSearchPressed;
  final VoidCallback? onLocationPressed;
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
      title: FutureBuilder<UserModel?>(
        future: locator.firebaseAuthService.currentUser,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _buildLoadingSkeleton();
          }

          final user = snapshot.data;
          final isGuest = user?.isGuest ?? true;

          return _buildUserInfo(context, user, isGuest);
        },
      ),
      actions: _buildActions(),
    );
  }

  Widget _buildLoadingSkeleton() {
    return Row(
      spacing: 13,
      children: [
        Container(
          width: 54,
          height: 54,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.shade200,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 100,
              height: 16,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(height: 4),
            Container(
              width: 140,
              height: 12,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildUserInfo(BuildContext context, UserModel? user, bool isGuest) {
    return Row(
      spacing: 13,
      children: [
        _buildAvatar(user, isGuest),
        Expanded(
          child: _buildGreeting(context, user, isGuest),
        ),
      ],
    );
  }

  Widget _buildAvatar(UserModel? user, bool isGuest) {
    // Misafir ise boş avatar
    if (isGuest) {
      return Container(
        width: 54,
        height: 54,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.shade200,
          border: Border.all(
            color: Colors.grey.shade300,
            width: 2,
          ),
        ),
        child: Icon(
          Icons.person_outline,
          color: Colors.grey.shade400,
          size: 28,
        ),
      );
    }

    // Normal kullanıcı avatarı
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
          child: ProjectNetworkImage(
            url: user?.photoUrl ?? '',
          ),
        ),
      ),
    );
  }

  Widget _buildGreeting(BuildContext context, UserModel? user, bool isGuest) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          isGuest ? 'Misafir' : (user?.fullName ?? 'Kullanıcı'),
          style: Theme.of(context).textTheme.titleMedium,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 2),
        _buildLocation(context, user, isGuest),
      ],
    );
  }

  Widget _buildLocation(BuildContext context, UserModel? user, bool isGuest) {
    if (isGuest) {
      return GestureDetector(
        onTap: onLocationPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.location_on_outlined,
              size: 16,
              color: Colors.orange.shade700,
            ),
            const SizedBox(width: 4),
            Flexible(
              child: Text(
                'Konumunuzu belirleyin',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.orange.shade700,
                      fontWeight: FontWeight.w500,
                    ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.location_on_sharp, size: 17, color: Colors.grey),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            user?.email ?? 'San Diego, CA',
            style: Theme.of(context).textTheme.bodySmall,
            overflow: TextOverflow.ellipsis,
          ),
        ),
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