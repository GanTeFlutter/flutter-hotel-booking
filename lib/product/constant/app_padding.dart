import 'package:flutter/material.dart';

final class ProjectPadding {
  const ProjectPadding._();

  static const double xSmall = 1;
  static const double small = 8;
  static const double medium = 16;
  static const double large = 32;
  static const double xLarge = 82;

  static const EdgeInsets allSmall = EdgeInsets.all(small);
  static const EdgeInsets allMedium = EdgeInsets.all(medium);
  static const EdgeInsets allLarge = EdgeInsets.all(large);

  static const EdgeInsets horizontalXSmall = EdgeInsets.symmetric(
    horizontal: xSmall,
  );
  static const EdgeInsets horizontalSmall = EdgeInsets.symmetric(
    horizontal: small,
  );
  static const EdgeInsets horizontalMedium = EdgeInsets.symmetric(
    horizontal: medium,
  );
  static const EdgeInsets horizontalLarge = EdgeInsets.symmetric(
    horizontal: large,
  );
  static const EdgeInsets horizontalXLarge = EdgeInsets.symmetric(
    horizontal: xLarge,
  );
  static const EdgeInsets verticalSmall = EdgeInsets.symmetric(vertical: small);
  static const EdgeInsets verticalMedium = EdgeInsets.symmetric(
    vertical: medium,
  );
  static const EdgeInsets verticalLarge = EdgeInsets.symmetric(
    vertical: large,
  );
  static const EdgeInsets verticalXLarge = EdgeInsets.symmetric(
    vertical: xLarge,
  );
}
