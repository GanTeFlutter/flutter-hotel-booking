import 'package:flutter/material.dart';

final class CartDetailAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const CartDetailAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leadingWidth: 72,
      leading: Container(
        margin: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Text(
          'Detail',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      centerTitle: true,
      actions: [
        Container(
          margin: const EdgeInsets.only(top: 8, bottom: 8),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert, color: Colors.white),
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
