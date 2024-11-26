import 'package:cafe_reparo_mobile/widget/Buttons/purple_button.dart' as purple;
import 'package:cafe_reparo_mobile/widget/Buttons/red_button.dart' as red;
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../themes/colors.dart';
import '../widget/Backgrounds/bg.dart';
import '../widget/Buttons/custom_circle_avatar.dart';
import '../widget/Buttons/icon_purple_button.dart';
import '../widget/Buttons/link_button.dart';
import '../widget/Cards/custom_big_card.dart';
import '../widget/Cards/custom_card.dart';
import '../widget/Inputs/custom_date_picker.dart';
import '../widget/Inputs/custom_dropdown.dart';
import '../widget/Inputs/password_field.dart';
import '../widget/header.dart';

class Design extends StatefulWidget {
  const Design({super.key, String? selectedItem});

  @override
  State<Design> createState() => _DesignState();
}

bool dateError = false;

class _DesignState extends State<Design> {
  String? selectedItem;
  DateTime? selectedDate;

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
                    const SizedBox(
                      height: 20,
                    ),
                    const Chip(label: Text("Texto")),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomCard(
                      width: 200,
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Custom Card'),
                          Text('Custom Card'),
                          Text('Custom Card'),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    LinkButton(text: "text", onPressed: () => {}),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 400,
                      child: CustomDatePicker(
                        // Seletor de data para data de lançamento
                        initialDate: selectedDate,
                        errorText: "Release date is required",
                        buttonText: "Select a release date",
                        onDateSelected: (date) {
                          setState(() {
                            selectedDate = date;
                            dateError = date == null;
                          });
                        },
                        hasError: dateError,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PasswordField(
                      controller: TextEditingController(),
                      label: 'Senha',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomCircleAvatar(
                      onTap: null,
                    ),
                    const SizedBox(height: 20),
                    IconPurpleButton(
                      type: ButtonType.outline,
                      icon: PhosphorIcons.plus,
                      onPressed: () => {},
                    ),
                    const SizedBox(height: 20),
                    const CustomCircleAvatar(
                      onTap: null,
                      text: 'CR',
                      backgroundImage: null,
                    ),
                    Text(
                      'titulo',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .titleLarge
                          ?.copyWith(
                            color: MyColors.primary500,
                          ),
                    ),
                    const SizedBox(height: 20),
                    CustomDropdown(
                      value: selectedItem,
                      items: const [
                        DropdownMenuItem(
                          value: 'Item 1',
                          child: Text('Item 1'),
                        ),
                        DropdownMenuItem(
                          value: 'Item 2',
                          child: Text('Item 2'),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedItem = value;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(
                      width: 400,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Digite algo',
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    IconButton(
                        onPressed: () => {},
                        icon: const Icon(PhosphorIcons.plus)),
                    const SizedBox(height: 20),
                    purple.PurpleButton(
                        onPressed: () => {},
                        text: "Continuar",
                        type: purple.ButtonType.fill),
                    const SizedBox(height: 20),
                    purple.PurpleButton(
                        onPressed: () => {},
                        text: "text",
                        type: purple.ButtonType.outline),
                    const SizedBox(height: 20),
                    red.RedButton(
                      onPressed: () => {},
                      text: "text",
                      type: red.ButtonType.outline,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Quantidade de vezes que você apertou o botão:',
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Exemplo',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(PhosphorIcons.plus),
      ),
    );
  }
}
