// ignore_for_file: prefer_const_constructors

import 'package:cafe_reparo_mobile/widget/Buttons/icon_purple_button.dart'
    as icon_button;
import 'package:cafe_reparo_mobile/widget/Buttons/purple_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../models/service_data.dart';
import '../../themes/colors.dart';
import '../../utils/service_validators.dart';
import '../../widget/Backgrounds/bg.dart';
import '../../widget/header.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key, String? selectedItem});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  ServiceData? serviceData;
  TextEditingController whatsappController = TextEditingController();
  TextEditingController instagramController = TextEditingController();
  TextEditingController linkedinController = TextEditingController();
  TextEditingController facebookController = TextEditingController();
  String? whatsappError;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments as ServiceData?;
    if (args != null) {
      setState(() {
        serviceData = args;
      });
    }
  }

  void _onSave() {
    setState(() {
      whatsappError = Validators.validateWhatsapp(whatsappController.text);
    });
    if (whatsappError != null) {
      return;
    }

    // Cria a lista de contatos a partir dos dados preenchidos
    List<Contact> updatedContacts = [
      if (whatsappController.text.isNotEmpty)
        Contact(platform: 'WhatsApp', link: whatsappController.text),
      if (instagramController.text.isNotEmpty)
        Contact(platform: 'Instagram', link: instagramController.text),
      if (linkedinController.text.isNotEmpty)
        Contact(platform: 'LinkedIn', link: linkedinController.text),
      if (facebookController.text.isNotEmpty)
        Contact(platform: 'Facebook', link: facebookController.text),
    ];
    ServiceData updatedServiceData = ServiceData(
      serviceName: serviceData?.serviceName,
      expertise: serviceData?.expertise,
      description: serviceData?.description,
      contacts: updatedContacts,
    );
    Navigator.pushNamed(context, '/adress', arguments: updatedServiceData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: Bg(
        minusSizedBoxHeight: 492,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Contato e redes ',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .titleMedium
                        ?.copyWith(
                          color: MyColors.primary550,
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      '(opcional)',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .titleSmall
                          ?.copyWith(
                            color: MyColors.primary400,
                          ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 28,
              ),
              SizedBox(
                width: 400,
                child: TextField(
                  controller: whatsappController,
                  style: TextStyle(fontWeight: FontWeight.w600),
                  decoration: InputDecoration(
                    errorText: whatsappError,
                    labelText: 'WhatsApp (Número de celular)',
                    prefixIcon: Icon(PhosphorIconsRegular.phone),
                  ),
                  keyboardType: TextInputType.number, // Only numeric keyboard
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly, // Only allow digits
                  ],
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 400,
                child: TextField(
                  controller: instagramController,
                  style: TextStyle(fontWeight: FontWeight.w600),
                  decoration: InputDecoration(
                    labelText: 'Link do Instagram',
                    prefixIcon: Icon(PhosphorIconsRegular.instagramLogo),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 400,
                child: TextField(
                  controller: linkedinController,
                  style: TextStyle(fontWeight: FontWeight.w600),
                  decoration: InputDecoration(
                    labelText: 'Link do Linkedin',
                    prefixIcon: Icon(PhosphorIconsRegular.linkedinLogo),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 400,
                child: TextField(
                  controller: facebookController,
                  style: TextStyle(fontWeight: FontWeight.w600),
                  decoration: InputDecoration(
                    labelText: 'Link do Facebook',
                    prefixIcon: Icon(PhosphorIconsRegular.facebookLogo),
                  ),
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
                          {Navigator.pushNamed(context, '/create-service')},
                      type: icon_button.ButtonType.outline,
                      icon: PhosphorIconsRegular.arrowBendUpLeft,
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: PurpleButton(
                        onPressed: _onSave,
                        text: "Avançar",
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
