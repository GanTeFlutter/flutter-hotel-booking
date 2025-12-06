import 'package:common/common.dart';
import 'package:flutter/material.dart';

final class ProjectNetworkImage extends StatelessWidget {
  const ProjectNetworkImage({
    required this.url,
    this.boxFit = BoxFit.fill,
    super.key,
  });

  final String? url;
  final BoxFit boxFit;

  @override
  Widget build(BuildContext context) {
    return CustomNetworkImage(
      imageUrl: url,
      boxFit: boxFit,
    );
  }
}
