// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SearchField extends StatefulWidget {
  final String label;
  final String? errorText;
  final TextEditingController controller;
  final VoidCallback? onPressed;
  final VoidCallback? onSubmitted;
  final double width;
  final Function(String)? onChanged;

  const SearchField({
    super.key,
    this.onSubmitted,
    this.errorText,
    this.label = 'Search',
    this.width = 280,
    this.onChanged,
    required this.onPressed,
    required this.controller,
  });

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: TextField(
        onChanged: widget.onChanged,
        controller: widget.controller,
        style: const TextStyle(fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          errorText: widget.errorText,
          labelText: widget.label, // Usar o parâmetro label aqui
          suffixIcon: Container(
            width: 50,
            height: 50,
            child: IconButton(
              icon: const Icon(PhosphorIcons.funnel),
              onPressed: (widget.onPressed),
            ),
          ),
          prefixIcon: const Icon(PhosphorIcons.magnifyingGlass),
        ),
      ),
    );
  }
}
