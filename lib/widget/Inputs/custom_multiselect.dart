import 'package:cafe_reparo_mobile/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CustomMultiSelect extends StatefulWidget {
  final List<String> selectedItems;
  final List<String> items;
  final ValueChanged<List<String>> onChanged;
  final String hintText;
  final IconData prefixIcon;
  final bool hasError;
  final String errorText;
  final double? width;

  const CustomMultiSelect({
    super.key,
    required this.selectedItems,
    required this.items,
    required this.onChanged,
    this.hintText = 'Selecione ou pesquise itens',
    this.prefixIcon = Icons.person,
    this.hasError = false,
    this.errorText = 'Este campo é obrigatório',
    this.width,
  });

  @override
  CustomMultiSelectState createState() => CustomMultiSelectState();
}

class CustomMultiSelectState extends State<CustomMultiSelect> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Autocomplete<String>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            return widget.items.where((String item) {
              return item
                  .toLowerCase()
                  .contains(textEditingValue.text.toLowerCase());
            });
          },
          onSelected: (String selection) {
            if (!widget.selectedItems.contains(selection)) {
              setState(() {
                widget.selectedItems.add(selection);
              });
              widget.onChanged(widget.selectedItems);
            }
            _textController.clear(); // Limpa o campo após a seleção
          },
          fieldViewBuilder: (
            BuildContext context,
            TextEditingController textEditingController,
            FocusNode focusNode,
            VoidCallback onFieldSubmitted,
          ) {
            _textController = textEditingController;
            return Padding(
              padding:
                  const EdgeInsets.only(bottom: 4.0), // Espaçamento de 4 pixels
              child: TextFormField(
                controller: _textController,
                focusNode: focusNode,
                style: Theme.of(context).primaryTextTheme.bodyMedium,
                decoration: InputDecoration(
                  errorText: widget.hasError ? widget.errorText : null,
                  filled: true,
                  hintText: widget.hintText,
                  hintStyle: const TextStyle(color: MyColors.primary400),
                  prefixIcon:
                      Icon(widget.prefixIcon, color: MyColors.primary400),
                ),
              ),
            );
          },
          optionsViewBuilder: (
            BuildContext context,
            AutocompleteOnSelected<String> onSelected,
            Iterable<String> options,
          ) {
            return Align(
              alignment: Alignment.topLeft,
              child: Material(
                color: MyColors.primary100,
                elevation: 4.0,
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  width:
                      widget.width ?? MediaQuery.of(context).size.width * 0.9,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 225.0, // Defina a altura máxima aqui
                    ),
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      shrinkWrap: true,
                      itemCount: options.length,
                      itemBuilder: (BuildContext context, int index) {
                        final String option = options.elementAt(index);
                        return ListTile(
                          title: Text(
                            option,
                            style: TextStyle(
                              fontWeight: widget.selectedItems.contains(option)
                                  ? FontWeight.w600 // Negrito se já selecionado
                                  : FontWeight
                                      .normal, // Normal se não selecionado
                              color: widget.selectedItems.contains(option)
                                  ? MyColors.primary550
                                  : MyColors.primary400,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              if (widget.selectedItems.contains(option)) {
                                widget.selectedItems
                                    .remove(option); // Remover da seleção
                              } else {
                                widget.selectedItems
                                    .add(option); // Adicionar à seleção
                              }
                            });
                            widget.onChanged(widget.selectedItems);
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        // Exibição dos chips para os itens selecionados
        if (widget.selectedItems.isNotEmpty) ...[
          const SizedBox(height: 10), // Espaço antes dos chips
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: widget.selectedItems.map((item) {
              return Chip(
                backgroundColor: MyColors.primary400,
                label: Text(
                  item,
                  style:
                      Theme.of(context).primaryTextTheme.labelLarge?.copyWith(
                            color: MyColors.primary100,
                          ),
                ),
                deleteIcon: const Icon(
                  PhosphorIconsRegular.x,
                  color: MyColors.primary300,
                ),
                onDeleted: () {
                  setState(() {
                    widget.selectedItems.remove(item);
                  });
                  widget.onChanged(widget.selectedItems);
                },
              );
            }).toList(),
          ),
        ],
      ],
    );
  }
}
