import 'package:flutter/material.dart';

class DSShadows {
  const DSShadows._();

  static final List<BoxShadow> card = [
    const BoxShadow(
      color: Color(0x26000000), // 15% black
      blurRadius: 8.0,
      offset: Offset(0, 4),
    ),
  ];

  static final List<BoxShadow> elevated = [
    const BoxShadow(
      color: Color(0x26000000),
      blurRadius: 16.0,
      offset: Offset(0, 8),
    ),
  ];

  static final List<BoxShadow> hover = [
    const BoxShadow(
      color: Color(0x400D9488), // TealMain 25%
      blurRadius: 4.0,
      offset: Offset(0, 2),
    ),
  ];
}