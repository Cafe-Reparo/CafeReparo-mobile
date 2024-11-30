import 'package:cafe_reparo_mobile/widget/Backgrounds/bg.dart';
import 'package:cafe_reparo_mobile/widget/Buttons/purple_button.dart' as purple;
import 'package:cafe_reparo_mobile/widget/Buttons/red_button.dart';
import 'package:cafe_reparo_mobile/widget/header.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../themes/colors.dart';
import '../../widget/Inputs/custom_date_picker.dart';

bool dateError = false;

class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({super.key, String? selectedItem});

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  String? dateError;
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: Bg(
        minusSizedBoxHeight: 516,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Editar conta',
                style: Theme.of(context).primaryTextTheme.titleLarge?.copyWith(
                      color: MyColors.primary500,
                    ),
              ),
              const SizedBox(
                height: 32,
              ),
              const SizedBox(
                width: 400,
                child: TextField(
                  style: TextStyle(fontWeight: FontWeight.w600),
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    prefixIcon: Icon(PhosphorIconsRegular.envelope),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 400,
                child: CustomDatePicker(
                  // Seletor de data para data de lançamento
                  initialDate: selectedDate,
                  errorText: dateError ?? '',
                  buttonText: "Data de nascimento",
                  onDateSelected: (date) {
                    setState(() {
                      selectedDate = date;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                width: 400,
                child: TextField(
                  style: TextStyle(fontWeight: FontWeight.w600),
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    prefixIcon: Icon(PhosphorIconsRegular.user),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 400,
                child: purple.PurpleButton(
                  onPressed: () =>
                      {Navigator.pushNamed(context, '/change-password')},
                  text: "Alterar senha",
                  icon: PhosphorIconsRegular.lock,
                  type: purple.ButtonType.outline,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 400,
                child: RedButton(
                  onPressed: () =>
                      {Navigator.pushNamed(context, '/change-password')},
                  text: "Sair da conta",
                  icon: PhosphorIconsRegular.signOut,
                  type: ButtonType.outline,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                width: 400,
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
    );
  }
}
