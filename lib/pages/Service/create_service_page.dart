// ignore_for_file: prefer_const_constructors

import 'package:cafe_reparo_mobile/widget/Buttons/purple_button.dart' as purple;
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../themes/colors.dart';
import '../../widget/Backgrounds/bg.dart';
import '../../widget/Inputs/custom_autocomplete.dart';
import '../../widget/header.dart';

class CreateServiceScreen extends StatefulWidget {
  const CreateServiceScreen({super.key, String? selectedItem});

  @override
  State<CreateServiceScreen> createState() => _CreateServiceScreenState();
}

class _CreateServiceScreenState extends State<CreateServiceScreen> {
  String? selectedRepair;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: Bg(
        minusSizedBoxHeight: 521,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          MyColors.primary400,
                          MyColors.primary550,
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: Icon(
                      PhosphorIconsRegular.storefront,
                      color: MyColors.primary100,
                    ),
                  ),
                  Container(
                    height: 1,
                    width: 20,
                    color: Color(0xFF5060FF),
                  ),
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Color(0xFF5060FF),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    height: 1,
                    width: 20,
                    color: Color(0xFF5060FF),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xFFE3E6FF),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(PhosphorIconsRegular.phone,
                        color: Color(0xFF5060FF), size: 25),
                  ),
                  Container(
                    height: 1,
                    width: 20,
                    color: Color(0xFF5060FF),
                  ),
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Color(0xFF5060FF),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    height: 1,
                    width: 20,
                    color: Color(0xFF5060FF),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xFFE3E6FF),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(PhosphorIconsRegular.mapPin,
                        color: Color(0xFF5060FF), size: 25),
                  ),
                ],
              ),
              const SizedBox(
                height: 28,
              ),
              Text(
                'Básico',
                style: Theme.of(context).primaryTextTheme.titleMedium?.copyWith(
                      color: MyColors.primary500,
                    ),
              ),
              const SizedBox(
                height: 28,
              ),
              TextField(
                style: TextStyle(fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                  labelText: 'Serviço',
                  prefixIcon: Icon(PhosphorIconsRegular.storefront),
                ),
              ),
              const SizedBox(height: 10),
              CustomAutocomplete(
                  width: 315,
                  hintText: 'Especialidade (opcional)',
                  value: selectedRepair,
                  items: const ['Pintura', 'Hidráulica', 'Elétrica'],
                  onChanged: (value) {
                    setState(() {
                      selectedRepair = value;
                    });
                  },
                  prefixIcon: PhosphorIconsRegular.sparkle),
              const SizedBox(height: 10),
              TextField(
                style: TextStyle(fontWeight: FontWeight.w600),
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: 'Escreva sua descrição aqui...',
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              SizedBox(
                width: 400,
                child: purple.PurpleButton(
                    onPressed: () =>
                        {Navigator.pushNamed(context, '/contacts')},
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
    );
  }
}
