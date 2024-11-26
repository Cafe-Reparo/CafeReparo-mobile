import 'package:cafe_reparo_mobile/widget/Buttons/purple_button.dart' as purple;
import 'package:flutter/material.dart';

import '../themes/colors.dart';
import '../widget/Backgrounds/bg.dart';
import '../widget/Cards/custom_big_card.dart';
import '../widget/Inputs/password_field.dart';
import '../widget/header.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key, String? selectedItem});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  String? selectedItem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: Bg(
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            CustomBigCard(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Alterar Senha',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .titleLarge
                          ?.copyWith(
                            color: MyColors.primary500,
                          ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    PasswordField(
                      controller: TextEditingController(),
                      label: 'Senha',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const PasswordConfirmationField(
                      label: 'Confirmar senha',
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    SizedBox(
                      width: 400,
                      height: 35,
                      child: purple.PurpleButton(
                          onPressed: () => {},
                          text: "Confirmar",
                          type: purple.ButtonType.fill),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
