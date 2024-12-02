import 'package:cafe_reparo_mobile/widget/Buttons/purple_button.dart';
import 'package:cafe_reparo_mobile/widget/Cards/custom_card.dart';
import 'package:cafe_reparo_mobile/widget/Inputs/search_field.dart';
import 'package:cafe_reparo_mobile/widget/header.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../data/services.dart';
import '../../themes/colors.dart';
import '../../widget/Buttons/icon_purple_button.dart';

class MyRepairsPage extends StatefulWidget {
  final String? query; // Parâmetro opcional

  const MyRepairsPage({super.key, this.query});

  @override
  State<MyRepairsPage> createState() => _MyRepairsPageState();
}

class _MyRepairsPageState extends State<MyRepairsPage> {
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
    setState(() {
      errorText = null;
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
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Reparos criados",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: MyColors.primary400,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchField(
                width: 270,
                errorText: errorText,
                onChanged: (query) {
                  setState(() {
                    errorText = null;
                  });
                },
                onPressed: () {},
                controller: searchController,
              ),
              const SizedBox(width: 8),
              IconPurpleButton(
                onPressed: () {
                  _filterServices(searchController.text);
                },
                icon: PhosphorIconsRegular.arrowRight,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Expanded(
            child: filteredServices.isEmpty
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
                        "Você não possui pontos de reparos criados ainda",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: MyColors.secondary200,
                            ),
                      ),
                      const SizedBox(height: 16),
                      PurpleButton(
                          onPressed: () =>
                              {Navigator.pushNamed(context, '/create-service')},
                          text: "Criar ponto de reparo"),
                    ],
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    itemCount: filteredServices.length,
                    itemBuilder: (context, index) {
                      final repair = filteredServices[index];
                      return CustomCard(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                repair['title'],
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .titleSmall
                                    ?.copyWith(
                                      color: MyColors.primary550,
                                    ),
                              ),
                              Text(
                                repair['location'],
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: MyColors.white100,
                                    ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                repair['description'],
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
                                    repair['expertise'].length,
                                    (chipIndex) => Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: Chip(
                                        label: Text(
                                          repair['expertise'][chipIndex],
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/create-service');
        },
        backgroundColor: MyColors.primary550,
        child: const Icon(
          PhosphorIconsRegular.plus,
          color: MyColors.white0,
        ),
      ),
    );
  }
}
