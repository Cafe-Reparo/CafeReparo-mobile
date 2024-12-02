// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../models/service_data.dart';
import '../../services/api_service.dart';
import '../../themes/colors.dart';
import '../../utils/service_validators.dart';
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
  TextEditingController cityController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController numberControle = TextEditingController();
  String? numberError;
  String? streetError;
  String? cityError;
  ServiceData? serviceData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments as ServiceData?;
    if (args != null) {
      setState(() {
        serviceData = args;
        if (kDebugMode) {
          print(serviceData);
        }
      });
    }
  }

  Future<void> sendData() async {
    setState(() {
      cityError = Validators.validateCity(cityController.text);
      streetError = Validators.validateStreet(streetController.text);
      numberError = Validators.validateNumber(numberControle.text);
    });
    if ([
      cityError,
      streetError,
      numberError,
    ].any((error) => error != null)) {
      return;
    }

    // Cria um novo ServiceData com os dados atualizados
    ServiceData updatedServiceData = ServiceData(
      serviceName: serviceData?.serviceName,
      expertise: serviceData?.expertise,
      description: serviceData?.description,
      contacts: serviceData?.contacts,
      location: Location(
        city: cityController.text,
        street: streetController.text,
        number: numberControle.text,
      ),
    );

    final repairData = updatedServiceData.toJson();

    // Passa os dados atualizados para a próxima tela
    Navigator.pushNamed(context, '/adress', arguments: updatedServiceData);

    try {
      // Chama a função createRepair da ApiService para enviar os dados
      final response = await ApiService().createRepair(repairData);

      // Lidar com a resposta da API, como exibir uma mensagem de sucesso
      if (kDebugMode) {
        print("Reparo criado com sucesso: $response");
      }

      // Navega para outra tela ou exibe uma mensagem de sucesso
      Navigator.pushNamed(context, '/success', arguments: response);
    } catch (e) {
      // Lidar com erro ao chamar a API
      if (kDebugMode) {
        print("Erro ao criar o reparo: $e");
      }
    }
  }

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
              SizedBox(
                width: 400,
                child: TextField(
                  controller: cityController,
                  style: TextStyle(fontWeight: FontWeight.w600),
                  decoration: InputDecoration(
                    labelText: 'Cidade',
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 400,
                child: TextField(
                  controller: streetController,
                  style: TextStyle(fontWeight: FontWeight.w600),
                  decoration: InputDecoration(
                    labelText: 'Rua',
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 400,
                child: TextField(
                  controller: numberControle,
                  style: TextStyle(fontWeight: FontWeight.w600),
                  decoration: InputDecoration(
                    labelText: 'Número',
                  ),
                  keyboardType: TextInputType.number, // Only numeric keyboard
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly, // Only allow digits
                  ],
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              SizedBox(
                width: 400,
                child: Row(
                  children: [
                    icon_button.IconPurpleButton(
                      onPressed: () =>
                          {Navigator.pushNamed(context, '/contacts')},
                      type: icon_button.ButtonType.outline,
                      icon: PhosphorIconsRegular.arrowBendUpLeft,
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: PurpleButton(
                        onPressed: (sendData),
                        text: "Confirmar",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
