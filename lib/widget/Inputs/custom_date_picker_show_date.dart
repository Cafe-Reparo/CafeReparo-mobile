import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../themes/colors.dart';

class CustomDatePickerShowDate extends StatefulWidget {
  final String text; // Label flutuante
  final IconData? icon;
  final Function(DateTime?) onDateSelected;
  final String errorText;
  final DateTime? initialDate;

  const CustomDatePickerShowDate({
    super.key,
    this.text = 'Data de nascimento',
    this.icon = PhosphorIconsRegular.calendar,
    required this.onDateSelected,
    this.errorText = 'Date is required',
    this.initialDate,
  });

  @override
  CustomDatePickerStateShowDate createState() =>
      CustomDatePickerStateShowDate();
}

class CustomDatePickerStateShowDate extends State<CustomDatePickerShowDate> {
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    // Initialize selectedDate with the initialDate if available, otherwise use current date
    selectedDate = widget.initialDate ?? DateTime.now();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      locale: const Locale('pt', 'BR'),
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
      widget.onDateSelected(selectedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color textColor = MyColors.primary550;
    const FontWeight fontWeight = FontWeight.w600;
    final bool hasError = widget.errorText.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InputDecorator(
          decoration: InputDecoration(
            labelText: widget.text,
            labelStyle: TextStyle(
              color: hasError ? MyColors.red200 : MyColors.primary400,
              fontWeight: FontWeight.w500,
            ),
            errorText: hasError ? widget.errorText : null,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: MyColors.primary550,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: MaterialButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            elevation: 0,
            onPressed: () => _selectDate(context),
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
                  DateFormat('dd/MM/yyyy').format(selectedDate),
                  style:
                      Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
                            color: textColor,
                            fontWeight: fontWeight,
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
