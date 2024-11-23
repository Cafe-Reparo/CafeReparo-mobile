// ignore_for_file: prefer_const_constructors

import 'package:cafe_reparo_mobile/widget/Buttons/purple_button.dart' as purple;
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../themes/colors.dart';
import '../widget/Backgrounds/bg.dart';
import '../widget/Cards/custom_big_card.dart';
import '../widget/Inputs/custom_dropdown.dart';
import '../widget/header.dart';

class CreateServiceScreen extends StatefulWidget {
  const CreateServiceScreen({super.key, String? selectedItem});

  @override
  State<CreateServiceScreen> createState() => _CreateServiceScreenState();
}

class _CreateServiceScreenState extends State<CreateServiceScreen> {
  String? selectedItem;
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
                    Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                  color: Color(0xFF5060FF),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(PhosphorIcons.storefront,
                                    color: Colors.white, size: 25),
                              ),
                              SizedBox(width: 10),
                              Container(
                                height: 2,
                                width: 20,
                                color: Color(0xFF5060FF),
                              ),
                              SizedBox(width: 4),
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: Color(0xFF5060FF),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: 4),
                              Container(
                                height: 2,
                                width: 20,
                                color: Color(0xFF5060FF),
                              ),
                              SizedBox(width: 10),
                              Container(
                                padding: EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                  color: Color(0xFFE3E6FF),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(PhosphorIcons.phone,
                                    color: Color(0xFF5060FF), size: 25),
                              ),
                              SizedBox(width: 10),
                              Container(
                                height: 2,
                                width: 20,
                                color: Color(0xFF5060FF),
                              ),
                              SizedBox(width: 4),
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: Color(0xFF5060FF),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: 4),
                              Container(
                                height: 2,
                                width: 20,
                                color: Color(0xFF5060FF),
                              ),
                              SizedBox(width: 10),
                              Container(
                                padding: EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                  color: Color(0xFFE3E6FF),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(PhosphorIcons.mapPin,
                                    color: Color(0xFF5060FF), size: 25),
                              ),
                            ],
                          ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Básico',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .titleLarge
                          ?.copyWith(
                            color: MyColors.primary500,
                          ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextField(
                        decoration: InputDecoration(
                          labelText: 'Serviço',
                          prefixIcon: Icon(PhosphorIcons.storefront),
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomDropdown(
                      value: selectedItem,
                      prefixIcon: (PhosphorIcons.sparkle),
                      hintText: 'Especialidade (Opcional)',
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
                    TextField(
                        maxLines: 4,
                        decoration: InputDecoration(
                          labelText: 'Escreva sua descrição aqui...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 400,
                      height: 35,
                      child: purple.PurpleButton(
                        onPressed: () => {
                          Navigator.pushNamed(context, '/contacts')
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
