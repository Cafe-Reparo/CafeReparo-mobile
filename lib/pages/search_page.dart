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
  List<Map<String, dynamic>> filteredServices = [];
  String? errorText;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController(text: widget.query ?? '');
    filteredServices = services;
    _filterServices(searchController.text);
  }

  void _filterServices(String query) {
    // Realiza a busca apenas se o texto tiver pelo menos 3 caracteres
    setState(() {
      errorText = null; // Limpa a mensagem de erro
      filteredServices = services.where((service) {
        return service['title'].toLowerCase().contains(query.toLowerCase()) ||
            service['description'].toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
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
      body: Column(
        children: [
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchField(
                errorText: errorText,
                onChanged: (query) {
                  setState(() {
                    errorText = null;
                  });
                },
                onPressed: () {},
                width: 300,
                controller: searchController,
              ),
              const SizedBox(width: 8),
              IconPurpleButton(
                onPressed: () {
                  // Realiza o filtro ao pressionar o botão
                  _filterServices(searchController.text);
                },
                icon: PhosphorIconsRegular.arrowRight,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Expanded(
            child: filteredServices.isEmpty // Verifica se não há serviços
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        PhosphorIconsRegular.empty,
                        size: 100,
                        color: MyColors.primary300,
                      ),
                      Text(
                        "Nenhum serviço encontrado",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: MyColors.secondary200,
                            ),
                      ),
                    ],
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    itemCount: filteredServices.length, // Usa a lista filtrada
                    itemBuilder: (context, index) {
                      final service = filteredServices[index];
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
    );
  }
}
