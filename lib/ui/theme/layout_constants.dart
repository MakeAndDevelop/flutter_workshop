import 'package:flutter/cupertino.dart';

class Insets {
  static const double padding16 = 16;
  static const double padding8 = 8;

  static const EdgeInsets all16 = EdgeInsets.all(padding16);
  static const EdgeInsets vertical16 = EdgeInsets.symmetric(vertical: padding16);
  static const EdgeInsets all8 = EdgeInsets.all(padding8);
}

class Spacing {
  SizedBox vertical(double vertical) => SizedBox(height: vertical);
  SizedBox horizontal(double horizontal) => SizedBox(width: horizontal);

  static const SizedBox vertical16 = SizedBox(height: Insets.padding16);
  static const SizedBox vertical8 = SizedBox(height: Insets.padding8);
  static const SizedBox horizontal16 = SizedBox(width: Insets.padding16);
  static const SizedBox horizontal8 = SizedBox(width: Insets.padding8);
}
