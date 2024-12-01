import 'package:cafe_reparo_mobile/themes/colors.dart';
import 'package:flutter/material.dart';

class CustomAutocomplete extends StatelessWidget {
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final String hintText;
  final IconData prefixIcon;
  final bool hasError;
  final String errorText;
  final double? width;

  const CustomAutocomplete({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    this.hintText = 'Selecione ou pesquise um item',
    this.prefixIcon = Icons.person,
    this.hasError = false,
    this.errorText = 'Este campo é obrigatório',
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Autocomplete<String>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            return items.where((String item) {
              return item
                  .toLowerCase()
                  .contains(textEditingValue.text.toLowerCase());
            });
          },
          onSelected: (String selection) {
            onChanged(selection);
          },
          fieldViewBuilder: (
            BuildContext context,
            TextEditingController textEditingController,
            FocusNode focusNode,
            VoidCallback onFieldSubmitted,
          ) {
            return TextFormField(
              controller: textEditingController,
              focusNode: focusNode,
              style: Theme.of(context).primaryTextTheme.bodyMedium,
              decoration: InputDecoration(
                filled: true,
                hintText: hintText,
                hintStyle: const TextStyle(color: MyColors.primary400),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: hasError ? MyColors.red200 : Colors.transparent,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: hasError ? MyColors.red200 : Colors.transparent,
                  ),
                ),
                prefixIcon: Icon(prefixIcon, color: MyColors.primary400),
              ),
              onChanged: (value) {
                onChanged(null); // Reseta o valor selecionado ao editar.
              },
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
                color: Colors.white,
                elevation: 4.0,
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  width: width ?? MediaQuery.of(context).size.width * 0.9,
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
                            fontWeight: option == value
                                ? FontWeight.w600 // Negrito se selecionado
                                : FontWeight
                                    .normal, // Normal se não selecionado
                            color: MyColors.primary400,
                          ),
                        ),
                        onTap: () {
                          onSelected(option);
                        },
                      );
                    },
                  ),
                ),
              ),
            );
          },
        ),
        if (hasError) ...[
          const SizedBox(height: 4),
          Row(
            children: [
              const SizedBox(width: 10),
              Text(
                errorText,
                style: Theme.of(context).primaryTextTheme.labelMedium?.copyWith(
                      color: MyColors.red50,
                    ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
