import 'package:flutter/material.dart';
import 'colors.dart';

class DSBorders {
  const DSBorders._();

  static const BorderSide card = BorderSide(
    color: DSColors.borders,
    width: 1.0,
  );

  static const BorderSide input = BorderSide(
    color: DSColors.borders,
    width: 1.5,
  );

  static final BorderSide active = BorderSide(
    color: DSColors.tealMain,
    width: 2.0,
  );
}