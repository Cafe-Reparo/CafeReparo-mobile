import 'package:flutter/material.dart';

import '../../themes/colors.dart';
import '../Cards/custom_big_card.dart';

class Bg extends StatelessWidget {
  final Widget child;
  final double padding;
  final double minusSizedBoxHeight;

  const Bg({
    required this.child,
    this.padding = 24,
    this.minusSizedBoxHeight = 595,
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height -
                      45 -
                      minusSizedBoxHeight, // Ajuste este valor conforme o tamanho do card
                ),
                CustomBigCard(padding: padding, child: child),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
