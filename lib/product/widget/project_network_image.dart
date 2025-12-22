import 'package:common/common.dart';
import 'package:flutter/material.dart';

final class ProjectNetworkImage extends StatelessWidget {
  const ProjectNetworkImage({
    required this.url,
    this.boxFit = BoxFit.fill,
    super.key,
    this.size,
  });

  final String? url;
  final BoxFit boxFit;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    return CustomNetworkImage(
      imageUrl: url,
      boxFit: boxFit,
      size: size,
    );
  }
}
