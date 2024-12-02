import 'package:cafe_reparo_mobile/services/api_service.dart';
import 'package:cafe_reparo_mobile/widget/Buttons/purple_button.dart' as purple;
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../themes/colors.dart';
import '../../widget/Backgrounds/bg.dart';
import '../../widget/Buttons/link_button.dart';
import '../../widget/Inputs/password_field.dart';
import '../../widget/header.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? emailError;
  String? passwordError;
  bool hasShownSnackbar = false;

  void validateSignin() async {
    String? authError = await ApiService()
        .signin(email: emailController.text, password: passwordController.text);

    if (authError != null) {
      setState(
        () {
          if (authError == 'E-mail inválido') {
            emailError = 'E-mail inválido';
          } else if (authError == 'Senha inválida') {
            passwordError = 'Senha inválida';
          }
        },
      );
    }
    if (authError == null) {
      Navigator.pushNamed(context, '/');
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as String?;

    if (args != null && !hasShownSnackbar) {
      hasShownSnackbar =
          true; // Garante que a Snackbar seja exibida uma única vez
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              args,
              style: const TextStyle(color: MyColors.primary100),
            ),
            backgroundColor: MyColors.red100,
            duration: const Duration(seconds: 3),
          ),
        );
      });
    }
    return Scaffold(
      appBar: const Header(showRepairButton: false, showAvatar: false),
      body: Bg(
        minusSizedBoxHeight: 403,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Entrar',
                style: Theme.of(context).primaryTextTheme.titleLarge?.copyWith(
                      color: MyColors.primary500,
                    ),
              ),
              const SizedBox(
                height: 28,
              ),
              SizedBox(
                width: 400,
                child: TextField(
                  style: const TextStyle(fontWeight: FontWeight.w600),
                  controller: emailController,
                  decoration: InputDecoration(
                    errorText: emailError,
                    labelText: 'E-mail',
                    prefixIcon: const Icon(PhosphorIconsRegular.envelope),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              PasswordField(
                errorText: passwordError,
                controller: passwordController,
                label: 'Senha',
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: 400,
                child: Row(
                  children: [
                    LinkButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/forgot-password');
                      },
                      text: 'Esqueceu a Senha?',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              SizedBox(
                width: 400,
                child: purple.PurpleButton(
                    onPressed: validateSignin,
                    text: "Entrar",
                    type: purple.ButtonType.fill),
              ),
              const SizedBox(
                height: 28,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Não possui conta? ',
                    style: TextStyle(color: Colors.black),
                  ),
                  LinkButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/sign-up');
                    },
                    text: 'Criar Conta',
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
