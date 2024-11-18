import 'package:cafe_reparo_mobile/themes/colors.dart';
import 'package:flutter/material.dart';

class CustomBigCard extends StatelessWidget {
  final Widget child;
  final double? height;

  const CustomBigCard({
    super.key,
    required this.child,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.80,
      decoration: BoxDecoration(
        color: MyColors.white0,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1C2BCC).withOpacity(0.12),
            offset: const Offset(0, 0),
            blurRadius: 32,
            spreadRadius: 0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: child,
      ),
    );
  }
}
