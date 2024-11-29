import 'package:cafe_reparo_mobile/widget/Cards/custom_card.dart';
import 'package:cafe_reparo_mobile/widget/Inputs/search_field.dart';
import 'package:cafe_reparo_mobile/widget/header.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../data/services.dart';
import '../themes/colors.dart';
import '../widget/Buttons/icon_purple_button.dart';

class SearchPage extends StatefulWidget {
  final String? query; // Permite passar a query via construtor

  const SearchPage({super.key, required this.query});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    // Inicializa o controlador com a query passada
    searchController = TextEditingController(text: widget.query ?? '');
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SearchField(
                  onPressed: () {
                    setState(() {
                      // Lógica opcional ao interagir com o campo
                    });
                  },
                  width: 300,
                  controller: searchController,
                ),
                const SizedBox(width: 8),
                IconPurpleButton(
                  onPressed: () {
                    // Navegação interna para atualizar a pesquisa
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
            ),
            const SizedBox(height: 32),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(0),
                itemCount: services.length,
                itemBuilder: (context, index) {
                  final service = services[index];
                  return CustomCard(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            service['title'],
                            style: Theme.of(context)
                                .primaryTextTheme
                                .titleSmall
                                ?.copyWith(
                                  color: MyColors.primary550,
                                ),
                          ),
                          Text(
                            service['location'],
                            style: Theme.of(context)
                                .primaryTextTheme
                                .bodySmall
                                ?.copyWith(
                                  color: MyColors.white100,
                                ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            service['description'],
                            style: Theme.of(context)
                                .primaryTextTheme
                                .labelMedium
                                ?.copyWith(
                                  color: MyColors.secondary100,
                                ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 16),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                service['expertise'].length,
                                (chipIndex) => Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: Chip(
                                    label: Text(
                                      service['expertise'][chipIndex],
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .labelLarge
                                          ?.copyWith(
                                            color: MyColors.secondary200,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
