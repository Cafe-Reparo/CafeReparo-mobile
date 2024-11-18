import 'package:cafe_reparo_mobile/widget/Backgrounds/bg.dart';
import 'package:cafe_reparo_mobile/widget/Buttons/purple_button.dart' as purple;
import 'package:cafe_reparo_mobile/widget/Cards/custom_big_card.dart';
import 'package:cafe_reparo_mobile/widget/header.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../themes/colors.dart';
import '../widget/Inputs/custom_date_picker.dart';


class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({super.key, String? selectedItem});

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
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
                      'Editar conta',
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
                          labelText: 'E-mail',
                          prefixIcon: Icon(PhosphorIcons.envelope),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const CustomDatePicker(),
                    const SizedBox(
                      height: 15,
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
                      height: 15,
                    ),
                    SizedBox(
                      width: 400,
                      height: 35,
                      child: purple.PurpleButton(
                        onPressed: () => {
                          Navigator.pushNamed(context, '/changepassword')
                        },
                        text: "Alterar senha",
                        icon: PhosphorIcons.lock,
                        type: purple.ButtonType.outline,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 400,
                      height: 35,
                      child: purple.PurpleButton(
                        onPressed: () => {},
                        text: "Salvar",
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