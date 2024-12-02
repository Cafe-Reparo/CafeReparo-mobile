import 'package:cafe_reparo_mobile/widget/Backgrounds/bg.dart';
import 'package:cafe_reparo_mobile/widget/Buttons/purple_button.dart' as purple;
import 'package:cafe_reparo_mobile/widget/Buttons/red_button.dart';
import 'package:cafe_reparo_mobile/widget/Inputs/custom_date_picker_show_date.dart';
import 'package:cafe_reparo_mobile/widget/header.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../services/api_service.dart';
import '../../themes/colors.dart';
import '../../utils/user_validators.dart';

bool dateError = false;

class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({super.key, String? selectedItem});

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  String? dateError;
  DateTime? selectedDate;
  String? nameError;
  String? surnameError;
  DateTime? initialDate;

  @override
  void initState() {
    super.initState();
    // Chama a função para buscar os dados do usuário assim que a tela for carregada
    getUser();
  }

  Future<void> getUser() async {
    try {
      // Espera a resposta da função readOneUser
      final userDetails = await ApiService().readOneUser();

      setState(() {
        nameController.text = userDetails['name'];
        surnameController.text = userDetails['surname'];
        initialDate = DateTime.tryParse(userDetails['birthday']);
      });
    } catch (e) {
      if (kDebugMode) {
        print('Erro ao buscar dados do usuário: $e');
      }
    }
  }

  Future<void> _saveUserDetails() async {
    setState(() {
      nameError = Validators.validateName(nameController.text);
      surnameError = Validators.validateSurname(surnameController.text);
      dateError = Validators.validateAge(selectedDate);
    });

    if ([nameError, surnameError, dateError].any((error) => error != null)) {
      return;
    }

    try {
      final updatedData = {
        "name": nameController.text,
        "surname": surnameController.text,
        "birthday": selectedDate!.toString(),
      };

      await ApiService().updateUserDetails(updatedData);

      if (kDebugMode) {
        print('Dados atualizados com sucesso!');
      }
      // Redireciona para outra tela ou exibe uma mensagem
    } catch (e) {
      if (kDebugMode) {
        print('Erro ao atualizar dados: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: Bg(
        minusSizedBoxHeight: 501,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Editar conta',
                style: Theme.of(context).primaryTextTheme.titleLarge?.copyWith(
                      color: MyColors.primary500,
                    ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: 400,
                child: TextField(
                  textCapitalization: TextCapitalization.sentences,
                  controller: nameController,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                  decoration: InputDecoration(
                    errorText: nameError,
                    labelText: 'Nome',
                    prefixIcon: const Icon(PhosphorIconsRegular.user),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 400,
                child: TextField(
                  textCapitalization: TextCapitalization.sentences,
                  controller: surnameController,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                  decoration: InputDecoration(
                    errorText: surnameError,
                    labelText: 'Sobrenome',
                    prefixIcon: const Icon(PhosphorIconsRegular.user),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 400,
                child: CustomDatePickerShowDate(
                  errorText: dateError ?? '',
                  text: "Data de nascimento",
                  onDateSelected: (date) {
                    setState(() {
                      selectedDate = date;
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 400,
                child: purple.PurpleButton(
                  onPressed: _saveUserDetails,
                  text: "Salvar",
                  type: purple.ButtonType.fill,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 400,
                child: purple.PurpleButton(
                  onPressed: () => {Navigator.pushNamed(context, '/verify')},
                  text: "Alterar senha",
                  icon: PhosphorIconsRegular.lock,
                  type: purple.ButtonType.outline,
                ),
              ),
              const SizedBox(height: 28),
              SizedBox(
                width: 400,
                child: RedButton(
                  onPressed: () async {
                    try {
                      await ApiService().signout();
                      Navigator.pushNamed(context, '/');
                    } catch (e) {
                      if (kDebugMode) {
                        print('Erro ao sair: $e');
                      }
                    }
                  },
                  text: "Sair da conta",
                  icon: PhosphorIconsRegular.signOut,
                  type: ButtonType.outline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
