import 'package:common/common.dart';
import 'package:flutter/material.dart';

final class ProjectNetworkImage extends StatelessWidget {
  const ProjectNetworkImage({required this.url, super.key});
  final String? url;
  @override
  Widget build(BuildContext context) {
    return CustomNetworkImage(
      imageUrl: url,
      // default shimmer loading animation
      // loadingWidget: Assets.lottie.animZombie.lottie(),
    );
  }
}
