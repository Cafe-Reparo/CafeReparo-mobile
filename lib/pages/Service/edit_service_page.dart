// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../themes/colors.dart';
import '../../../widget/Backgrounds/bg.dart';
import '../../../widget/Buttons/purple_button.dart';
import '../../../widget/header.dart';
import '../../widget/Buttons/red_button.dart';

class EditServicePage extends StatelessWidget {
  const EditServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: Bg(
        minusSizedBoxHeight: 550,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: MyColors.primary100,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(
                        PhosphorIconsRegular.camera,
                        color: MyColors.primary400,
                        size: 40,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Serviço de Pintura",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: MyColors.primary500),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text(
                "Localização",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                "Jaraguá do Sul - Rua: Wally Emilia Mohr, 300",
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 16),
              Text(
                "Descrição",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                "Oferecemos serviços de pintura para residências e comércios",
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  Chip(
                    label: Text("Pintura"),
                    backgroundColor: MyColors.primary100,
                  ),
                  Chip(
                    label: Text("Expertise"),
                    backgroundColor: MyColors.primary100,
                  ),
                  Chip(
                    label: Text("Expertise"),
                    backgroundColor: MyColors.primary100,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                "Reparador",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                "Usuário",
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              SizedBox(
                width: 56,
                height: 48,
                child: RedButton(
                  onPressed: () {},
                  text: "",
                  icon: PhosphorIconsRegular.trash,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: SizedBox(
                  height: 48,
                  child: PurpleButton(
                    onPressed: () {},
                    text: "Editar",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
