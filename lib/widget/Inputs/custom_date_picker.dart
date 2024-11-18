import 'package:cafe_reparo_mobile/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart'; // Importa o pacote intl

class CustomDatePicker extends StatefulWidget {
  final String buttonText; // Propriedade para texto do botão
  final IconData? icon; // Propriedade para ícone opcional

  const CustomDatePicker({
    super.key,
    this.buttonText = 'Selecionar Data de Nascimento', // Texto padrão
    this.icon = PhosphorIcons.calendar, // Ícone opcional
  });

  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      locale: const Locale('pt', 'BR'),
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
      currentDate: selectedDate,
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked; // Atualiza a data selecionada
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MaterialButton(
          elevation: 0,
          height: 56,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: MyColors.primary300,
          onPressed: () => _selectDate(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              children: [
                if (widget.icon != null) ...[
                  Icon(
                    widget.icon,
                    size: 24,
                    color: MyColors.primary400,
                  ),
                  const SizedBox(width: 8),
                ],
                Text(
                  selectedDate != null
                      ? DateFormat('dd/MM/yyyy')
                          .format(selectedDate!) // Exibe a data formatada
                      : widget.buttonText,
                  style:
                      Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
                            color: MyColors.primary400,
                          ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
