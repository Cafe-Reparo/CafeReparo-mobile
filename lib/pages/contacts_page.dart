// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../themes/colors.dart';
import '../widget/Backgrounds/bg.dart';
import '../widget/header.dart';

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
                      color: Color(0xFF5060FF),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(PhosphorIcons.phone,
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
                    child: Icon(PhosphorIcons.mapPin,
                        color: Color(0xFF5060FF), size: 25),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                'Contato e redes',
                style: Theme.of(context).primaryTextTheme.titleLarge?.copyWith(
                      color: MyColors.primary500,
                    ),
              ),
              const SizedBox(
                height: 40,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  prefixIcon: Icon(PhosphorIcons.envelopeSimple),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Whatsapp',
                  prefixIcon: Icon(PhosphorIcons.phone),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Link do Instagram',
                  prefixIcon: Icon(PhosphorIcons.instagramLogo),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Link do Linkedin',
                  prefixIcon: Icon(PhosphorIcons.linkedinLogo),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Link do Facebook',
                  prefixIcon: Icon(PhosphorIcons.facebookLogo),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/createservice');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: BorderSide(color: Color(0xFF5060FF)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: Size(double.infinity, 50),
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: Color(0xFF5060FF),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    flex: 4,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/adress');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF5060FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: Size(double.infinity, 50),
                      ),
                      child: Text(
                        'Confirmar',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
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
