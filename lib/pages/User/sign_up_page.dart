import 'package:cafe_reparo_mobile/widget/Buttons/purple_button.dart' as purple;
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../services/api_service.dart';
import '../../themes/colors.dart';
import '../../utils/user_validators.dart';
import '../../widget/Backgrounds/bg.dart';
import '../../widget/Buttons/link_button.dart';
import '../../widget/Inputs/custom_date_picker.dart';
import '../../widget/Inputs/password_field.dart';
import '../../widget/header.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key, String? selectedItem});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPwController = TextEditingController();
  String? nameError;
  String? surnameError;
  String? emailError;
  String? passwordError;
  String? confirmPwError;
  String? dateError;
  DateTime? selectedDate;

  void createUser() async {
    setState(() {
      // Aplicar validações nos campos
      nameError = Validators.validateName(nameController.text);
      surnameError = Validators.validateSurname(surnameController.text);
      emailError = Validators.validateEmail(emailController.text);
      passwordError = Validators.validatePassword(passwordController.text);
      confirmPwError = Validators.validateConfirmPassword(
        passwordController.text,
        confirmPwController.text,
      );
      dateError = Validators.validateAge(selectedDate);
    });

    // Verificar se há algum erro
    if ([
      nameError,
      surnameError,
      emailError,
      passwordError,
      confirmPwError,
      dateError
    ].any((error) => error != null)) {
      return;
    }

    // Se não há erros, realizar o cadastro
    String? authError = await ApiService().signup(
      name: nameController.text,
      surname: surnameController.text,
      date: selectedDate!,
      email: emailController.text,
      password: passwordController.text,
    );

    if (authError != null) {
      setState(() {
        emailError = authError; // Exibir erro no campo de e-mail
      });
    }

    if (authError == null) {
      Navigator.pushNamed(context, '/'); // Navegar para a página inicial
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(showRepairButton: false, showAvatar: false),
      body: Bg(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                'Criar Conta',
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
                  textCapitalization: TextCapitalization.sentences,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                  controller: nameController,
                  decoration: InputDecoration(
                    errorText: nameError,
                    labelText: 'Nome',
                    prefixIcon: const Icon(PhosphorIconsRegular.user),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 400,
                child: TextField(
                  textCapitalization: TextCapitalization.sentences,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                  controller: surnameController,
                  decoration: InputDecoration(
                    errorText: surnameError,
                    labelText: 'Sobrenome',
                    prefixIcon: const Icon(PhosphorIconsRegular.user),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
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
              SizedBox(
                width: 400,
                child: CustomDatePicker(
                  errorText: dateError ?? '',
                  text: "Data de nascimento",
                  onDateSelected: (date) {
                    setState(() {
                      selectedDate = date;
                    });
                  },
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
                height: 10,
              ),
              PasswordField(
                  errorText: confirmPwError,
                  controller: confirmPwController,
                  label: 'Confirmar senha'),
              const SizedBox(
                height: 28,
              ),
              SizedBox(
                width: 400,
                child: purple.PurpleButton(
                  onPressed: createUser,
                  text: 'Criar',
                  type: purple.ButtonType.fill,
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Já possui conta? ',
                    style: TextStyle(color: Colors.black),
                  ),
                  LinkButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/sign-in');
                    },
                    text: 'Entrar',
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
