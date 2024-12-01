import 'package:cafe_reparo_mobile/widget/Buttons/purple_button.dart' as purple;
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../themes/colors.dart';
import '../../widget/Backgrounds/bg.dart';
import '../../widget/header.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key, String? selectedItem});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(showRepairButton: true, showAvatar: true),
      body: Bg(
        minusSizedBoxHeight: 305,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Verifique seu e-mail',
                style: Theme.of(context).primaryTextTheme.titleLarge?.copyWith(
                      color: MyColors.primary550,
                    ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Center(
                child: Column(
                  children: [
                    Text(
                      'Enviamos um código de 5 dígitos para',
                      textAlign: TextAlign.center,
                      style: TextStyle(),
                    ),
                    Text(
                      'o seu e-mail',
                      textAlign: TextAlign.center,
                      style: TextStyle(),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const SizedBox(
                width: 400,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Código de verificação',
                    prefixIcon: Icon(PhosphorIconsRegular.lock),
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                width: 400,
                child: purple.PurpleButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/change-password');
                  },
                  text: "Avançar",
                  type: purple.ButtonType.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
