import 'package:cafe_reparo_mobile/themes/colors.dart';
import 'package:cafe_reparo_mobile/themes/custom_themes.dart';
import 'package:cafe_reparo_mobile/widget/Backgrounds/bg.dart';
import 'package:cafe_reparo_mobile/widget/Buttons/custom_circle_avatar.dart';
import 'package:cafe_reparo_mobile/widget/Buttons/icon_purple_button.dart';
import 'package:cafe_reparo_mobile/widget/Buttons/link_button.dart';
import 'package:cafe_reparo_mobile/widget/Buttons/purple_button.dart' as purple;
import 'package:cafe_reparo_mobile/widget/Buttons/red_button.dart' as red;
import 'package:cafe_reparo_mobile/widget/Cards/custom_big_card.dart';
import 'package:cafe_reparo_mobile/widget/Cards/custom_card.dart';
import 'package:cafe_reparo_mobile/widget/Inputs/custom_date_picker.dart';
import 'package:cafe_reparo_mobile/widget/Inputs/custom_dropdown.dart';
import 'package:cafe_reparo_mobile/widget/Inputs/password_field.dart';
import 'package:cafe_reparo_mobile/widget/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Café Reparo',
      theme: CustomThemes().defaultTheme,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
      home: const MyHomePage(title: 'Café Reparo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? selectedItem;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
                    const CustomDatePicker(),
                    const SizedBox(
                      height: 20,
                    ),
                    const PasswordField(
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
                      '$_counter',
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
        onPressed: _incrementCounter,
        child: const Icon(PhosphorIcons.plus),
      ),
    );
  }
}
