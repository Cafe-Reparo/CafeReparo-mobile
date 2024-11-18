import 'package:cafe_reparo_mobile/widget/Buttons/purple_button.dart' as purple;
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../themes/colors.dart';
import '../widget/Backgrounds/bg.dart';
import '../widget/Cards/custom_big_card.dart';
import '../widget/header.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key, String? selectedItem});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
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
                      'Esqueceu a senha?',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .titleLarge
                          ?.copyWith(
                            color: MyColors.primary500,
                            fontSize: 33,
                          ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Center(
                      child: Text(
                        'Insira seu e-mail para enviarmos o código de verificação',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
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
                      height: 25,
                    ),
                    SizedBox(
                      width: 400,
                      height: 35,
                      child: purple.PurpleButton(
                        onPressed: () => {
                          Navigator.pushNamed(context, '/verifyemail')
                        },
                        text: "Avançar",
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
