import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgGetter extends StatelessWidget {
  final String source;
  const SvgGetter({required this.source});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(source);
  }
}
