import 'package:cafe_reparo_mobile/widget/Buttons/purple_button.dart' as purple;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../themes/colors.dart';
import '../../widget/Backgrounds/bg.dart';
import '../../widget/header.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key, String? selectedItem});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  String? selectedItem;
  List<TextEditingController> controllers =
      List.generate(5, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(showRepairButton: true, showAvatar: true),
      body: Bg(
        minusSizedBoxHeight: 307,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Verifique seu e-mail',
                style: Theme.of(context).primaryTextTheme.titleLarge?.copyWith(
                      color: MyColors.primary500,
                      fontSize: 33,
                    ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Center(
                child: Text(
                  'Enviamos um código de 5 dígitos para o seu e-mail',
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextField(
                      controller: controllers[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      decoration: const InputDecoration(
                        counterText: '',
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        if (value.length == 1 && index < 4) {
                          FocusScope.of(context).nextFocus();
                        } else if (value.isEmpty && index > 0) {
                          FocusScope.of(context).previousFocus();
                        }
                      },
                    ),
                  );
                }),
              ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                width: 400,
                child: purple.PurpleButton(
                  onPressed: () {
                    String code =
                        controllers.map((controller) => controller.text).join();
                    if (kDebugMode) {
                      print('Código inserido: $code');
                    }
                    Navigator.pushNamed(context, '/change-password');
                  },
                  text: "Avançar",
                  type: purple.ButtonType.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
