import 'package:flutter/material.dart';

import '../../themes/colors.dart';
import '../Cards/custom_big_card.dart';

class Bg extends StatelessWidget {
  final Widget child;
  final double padding;

  const Bg({
    required this.child,
    this.padding = 24,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 45,
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  MyColors.primary550, // Cor inicial do gradiente
                  MyColors.primary400, // Cor final do gradiente
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'background.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 45,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [CustomBigCard(padding: padding, child: child)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
