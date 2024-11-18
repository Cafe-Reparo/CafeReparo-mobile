import 'package:cafe_reparo_mobile/widget/Buttons/purple_button.dart' as purple;
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../themes/colors.dart';
import '../widget/Backgrounds/bg.dart';
import '../widget/Cards/custom_big_card.dart';
import '../widget/Inputs/custom_date_picker.dart';
import '../widget/Inputs/password_field.dart';
import '../widget/header.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key, String? selectedItem});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String? selectedItem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderWithLogo(),
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
                      'Criar Conta',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .titleLarge
                          ?.copyWith(
                            color: MyColors.primary500,
                          ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const SizedBox(
                      width: 400,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Nome',
                          prefixIcon: Icon(PhosphorIcons.user),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      width: 400,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'E-mail',
                          prefixIcon: Icon(PhosphorIcons.envelope),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const CustomDatePicker(),
                    const SizedBox(
                      height: 10,
                    ),
                    const PasswordField(
                      label: 'Senha',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const PasswordConfirmationField(
                      label: 'Confirmar senha',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: 400,
                      height: 35,
                      child: purple.PurpleButton(
                        onPressed: () => {},
                        text: "Continuar",
                        type: purple.ButtonType.fill),
                    ),
                      const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Já possui conta? ',
                          style: TextStyle(color: Colors.black),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/signin');
                          },
                          child: const Text(
                            'Entrar',
                            style: TextStyle(
                              color: Color.fromRGBO(80, 96, 255, 1.0),
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
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
