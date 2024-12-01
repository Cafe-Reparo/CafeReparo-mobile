import 'package:cafe_reparo_mobile/widget/Buttons/purple_button.dart' as purple;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../services/api_service.dart';
import '../../themes/colors.dart';
import '../../widget/Backgrounds/bg.dart';
import '../../widget/Inputs/password_field.dart';
import '../../widget/header.dart';

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
        minusSizedBoxHeight: 349,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Alterar Senha',
                style: Theme.of(context).primaryTextTheme.titleLarge?.copyWith(
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
              PasswordField(
                label: 'Confirmar senha',
                controller: TextEditingController(),
              ),
              const SizedBox(
                height: 35,
              ),
              SizedBox(
                width: 400,
                child: purple.PurpleButton(
                    onPressed: () async {
                      try {
                        await ApiService().signout();
                        Navigator.pushNamed(context, '/sign-in');
                      } catch (e) {
                        if (kDebugMode) {
                          print('Erro ao sair: $e');
                        }
                      }
                    },
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
    );
  }
}
