// ignore_for_file: prefer_const_constructors

import 'package:cafe_reparo_mobile/widget/Buttons/purple_button.dart' as purple;
import 'package:cafe_reparo_mobile/widget/Inputs/custom_multiselect.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../models/service_data.dart';
import '../../services/api_service.dart';
import '../../themes/colors.dart';
import '../../utils/service_validators.dart';
import '../../widget/Backgrounds/bg.dart';
import '../../widget/header.dart';

class CreateRepairPage extends StatefulWidget {
  const CreateRepairPage({super.key, String? selectedItem});

  @override
  State<CreateRepairPage> createState() => _CreateRepairPageState();
}

class _CreateRepairPageState extends State<CreateRepairPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  List<String> expertiseItems = [];
  List<String> selectedExpertise = [];
  String? nameError;
  String? descriptionError;

  @override
  void initState() {
    super.initState();
    fetchExpertiseItems();
  }

  void advance() {
    setState(() {
      nameError = Validators.validateNameService(nameController.text);
      descriptionError =
          Validators.validateDescription(descriptionController.text);
    });
    if ([
      nameError,
      descriptionError,
    ].any((error) => error != null)) {
      return;
    }

    final serviceData = ServiceData(
      serviceName: nameController.text,
      expertise: selectedExpertise,
      description: descriptionController.text,
    );
    Navigator.pushNamed(
      context,
      '/contacts',
      arguments: serviceData,
    );
  }

  Future<void> fetchExpertiseItems() async {
    try {
      final expertiseData =
          await ApiService().readTags(); // Call the API function to get tags
      setState(() {
        expertiseItems =
            expertiseData; // Assign the fetched data to expertiseItems
      });
    } catch (e) {
      setState(() {
        if (kDebugMode) {
          print("Error fetching expertise items: $e");
        }
      });
      // Handle error: show a message, retry, etc.
      if (kDebugMode) {
        print("Error fetching expertise items: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: Bg(
        minusSizedBoxHeight: 525,
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
              SizedBox(
                width: 400,
                child: TextField(
                  controller: nameController,
                  style: TextStyle(fontWeight: FontWeight.w600),
                  decoration: InputDecoration(
                    errorText: nameError,
                    labelText: 'Serviço',
                    prefixIcon: Icon(PhosphorIconsRegular.storefront),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 400,
                child: CustomMultiSelect(
                    width: 350,
                    selectedItems: selectedExpertise,
                    items: expertiseItems,
                    onChanged: (selectedExpertise) {
                      setState(() {
                        this.selectedExpertise =
                            selectedExpertise; // Atualiza a lista de itens selecionados
                      });
                    },
                    hintText: 'Especialidade (opcional)',
                    prefixIcon: PhosphorIconsRegular.sparkle),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 400,
                child: TextField(
                  controller: descriptionController,
                  style: TextStyle(fontWeight: FontWeight.w600),
                  maxLines: 4,
                  decoration: InputDecoration(
                    errorText: descriptionError,
                    labelText: 'Escreva sua descrição aqui...',
                    alignLabelWithHint: true,
                  ),
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              SizedBox(
                width: 400,
                child: purple.PurpleButton(
                    onPressed: (advance),
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
