import 'package:cafe_reparo_mobile/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CustomCircleAvatar extends StatelessWidget {
  final String? text;
  final ImageProvider? backgroundImage;
  final VoidCallback? onTap;

  const CustomCircleAvatar({
    super.key,
    this.text,
    this.backgroundImage,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = (text != null && text!.isNotEmpty)
        ? MyColors.primary500
        : MyColors.primary300;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: CircleAvatar(
          radius: 20,
          backgroundColor: backgroundImage == null ? backgroundColor : null,
          backgroundImage: backgroundImage,
          child: (text != null && text!.isNotEmpty)
              ? Text(
                  text!,
                  style:
                      Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
                            color: MyColors.primary100,
                          ),
                )
              : const Icon(
                  PhosphorIconsRegular.user,
                  size: 24,
                  color: MyColors.primary500,
                ),
        ),
      ),
    );
  }
}
