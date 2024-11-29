import 'package:cafe_reparo_mobile/themes/colors.dart';
import 'package:cafe_reparo_mobile/widget/Backgrounds/bg_wave.dart';
import 'package:cafe_reparo_mobile/widget/Buttons/purple_button.dart';
import 'package:cafe_reparo_mobile/widget/Inputs/search_field.dart';
import 'package:cafe_reparo_mobile/widget/header.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../widget/Buttons/icon_purple_button.dart';

class SearchPage extends StatefulWidget {
  final String? query;

  const SearchPage({super.key, this.query});


  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController(text: widget.query);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: Column(
        children: [
          SearchField(
          onPressed: () {
    setState(() {
    // Opcional: adicionar lógica extra
    });
    },
      width: double.infinity,
      controller: searchController,
    ),
    ),
    const SizedBox(width: 8),
    IconPurpleButton(
    onPressed: () {
    // Ação ao clicar no botão (opcionalmente, iniciar uma nova busca)
    String newQuery = searchController.text;
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => SearchPage(query: newQuery),
    ),
    );
    },
    icon: PhosphorIcons.arrowRight,
    ),

        ],
      )
    );
  }
}
