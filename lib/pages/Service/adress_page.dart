// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../themes/colors.dart';
import '../../widget/Backgrounds/bg.dart';
import '../../widget/Buttons/icon_purple_button.dart' as icon_button;
import '../../widget/Buttons/purple_button.dart';
import '../../widget/header.dart';

class AdressScreen extends StatefulWidget {
  const AdressScreen({super.key, String? selectedItem});

  @override
  State<AdressScreen> createState() => _AdressScreenState();
}

class _AdressScreenState extends State<AdressScreen> {
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: Bg(
        minusSizedBoxHeight: 434,
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
                    child: Icon(PhosphorIconsRegular.storefront,
                        color: Colors.white, size: 25),
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
                    child: Icon(PhosphorIconsRegular.phone,
                        color: Colors.white, size: 25),
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
                    child: Icon(PhosphorIconsRegular.mapPin,
                        color: Color(0xFFE3E6FF), size: 25),
                  ),
                ],
              ),
              const SizedBox(
                height: 28,
              ),
              Text(
                'Endereço',
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
                  labelText: 'Cidade',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                style: TextStyle(fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                  labelText: 'Rua',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                style: TextStyle(fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                  labelText: 'Número',
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              Row(
                children: [
                  icon_button.IconPurpleButton(
                    onPressed: () =>
                        {Navigator.pushNamed(context, '/contacts')},
                    type: icon_button.ButtonType.outline,
                    icon: PhosphorIconsRegular.arrowBendUpLeft,
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    // Faz com que o botão ocupe o espaço restante
                    child: PurpleButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/read'); // Ajuste aqui
                      },
                      text: "Confirmar",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
