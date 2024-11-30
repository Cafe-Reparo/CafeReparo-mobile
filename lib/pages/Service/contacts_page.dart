// ignore_for_file: prefer_const_constructors

import 'package:cafe_reparo_mobile/widget/Buttons/icon_purple_button.dart'
    as iconButton;
import 'package:cafe_reparo_mobile/widget/Buttons/purple_button.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../themes/colors.dart';
import '../../widget/Backgrounds/bg.dart';
import '../../widget/header.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key, String? selectedItem});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: Bg(
        minusSizedBoxHeight: 550,
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
                'Contato e redes',
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
                  labelText: 'E-mail',
                  prefixIcon: Icon(PhosphorIconsRegular.envelopeSimple),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                style: TextStyle(fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                  labelText: 'Whatsapp',
                  prefixIcon: Icon(PhosphorIconsRegular.phone),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                style: TextStyle(fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                  labelText: 'Link do Instagram',
                  prefixIcon: Icon(PhosphorIconsRegular.instagramLogo),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                style: TextStyle(fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                  labelText: 'Link do Linkedin',
                  prefixIcon: Icon(PhosphorIconsRegular.linkedinLogo),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                style: TextStyle(fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                  labelText: 'Link do Facebook',
                  prefixIcon: Icon(PhosphorIconsRegular.facebookLogo),
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              Row(
                children: [
                  iconButton.IconPurpleButton(
                    onPressed: () =>
                        {Navigator.pushNamed(context, '/create-service')},
                    type: iconButton.ButtonType.outline,
                    icon: PhosphorIconsRegular.arrowBendUpLeft,
                  ),
                  SizedBox(width: 20),
                  SizedBox(
                    width: 237,
                    child: PurpleButton(
                      onPressed: () =>
                          {Navigator.pushNamed(context, '/adress')},
                      text: "Avançar",
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
