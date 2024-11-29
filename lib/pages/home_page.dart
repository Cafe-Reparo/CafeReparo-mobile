import 'package:cafe_reparo_mobile/themes/colors.dart';
import 'package:cafe_reparo_mobile/widget/Backgrounds/bg_wave.dart';
import 'package:cafe_reparo_mobile/widget/Buttons/purple_button.dart';
import 'package:cafe_reparo_mobile/widget/header.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../widget/Buttons/icon_purple_button.dart';
import '../widget/Inputs/custom_autocomplete.dart';
import '../widget/Inputs/search_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedRepair;

  final TextEditingController searchController = TextEditingController();

  void filter() {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) => AlertDialog(
            insetPadding: const EdgeInsets.all(8),
            content: SingleChildScrollView(
              child: SizedBox(
                width: 300,
                child: Column(
                  children: [
                    CustomAutocomplete(
                      width: 300,
                      hintText: 'Reparo',
                      value: selectedRepair,
                      items: const ['Pintura', 'Hidráulica', 'Elétrica'],
                      onChanged: (value) {
                        setState(() {
                          selectedRepair = value;
                        });
                      },
                      prefixIcon: PhosphorIconsRegular.storefront,
                    ),
                    const SizedBox(height: 8),
                    CustomAutocomplete(
                        width: 300,
                        hintText: 'Especialidade',
                        value: selectedRepair,
                        items: const ['Pintura', 'Hidráulica', 'Elétrica'],
                        onChanged: (value) {
                          setState(() {
                            selectedRepair = value;
                          });
                        },
                        prefixIcon: PhosphorIconsRegular.sparkle),
                    const SizedBox(height: 8),
                    CustomAutocomplete(
                      width: 300,
                      hintText: 'Localização',
                      value: selectedRepair,
                      items: const ['Pintura', 'Hidráulica', 'Elétrica'],
                      onChanged: (value) {
                        setState(() {
                          selectedRepair = value;
                        });
                      },
                      prefixIcon: PhosphorIconsRegular.mapTrifold,
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              SizedBox(
                width: double.infinity,
                child: PurpleButton(
                  onPressed: () {
                    Navigator.pop(context); // Fecha o diálogo ao cancelar
                  },
                  text: "Aplicar flitro",
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: BgWave(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Olá Ana,',
                        style: Theme.of(context)
                            .primaryTextTheme
                            .titleMedium
                            ?.copyWith(color: MyColors.primary500)),
                    Text('O que vamos reparar hoje?',
                        style: Theme.of(context)
                            .primaryTextTheme
                            .titleMedium
                            ?.copyWith(color: MyColors.primary500)),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SearchField(
                      onPressed: () => filter(),
                      controller: searchController,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    IconPurpleButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/search-page',
                          arguments: searchController
                              .text, // Passa o valor atual do campo
                        );
                      },
                      icon: PhosphorIconsRegular.arrowRight,
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
