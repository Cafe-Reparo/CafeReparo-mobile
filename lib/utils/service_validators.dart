class Validators {
  static String? validateNameService(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nome de serviço é obrigatório';
    }
    return null;
  }

  static String? validateDescription(String? value) {
    if (value == null || value.isEmpty) {
      return 'Descrição é obrigatória';
    }
    return null;
  }

  static String? validateWhatsapp(String? value) {
    final RegExp phoneRegExp = RegExp(r'^[1-9]{2}9[0-9]{4}[0-9]{4}$');
    if (value == null || value.isEmpty) {
      return null;
    }

    if (!phoneRegExp.hasMatch(value)) {
      return 'Insira um número de WhatsApp válido';
    }

    return null;
  }

  static String? validateCity(String? value) {
    if (value == null || value.isEmpty) {
      return 'Cidade é obrigatório';
    }
    RegExp letterRegex = RegExp(r'^[a-zA-Z]+$');
    if (!letterRegex.hasMatch(value)) {
      return 'Cidade deve conter apenas letras';
    }
    return null;
  }

  static String? validateStreet(String? value) {
    if (value == null || value.isEmpty) {
      return 'Rua é obrigatório';
    }
    RegExp letterRegex = RegExp(r'^[a-zA-Z]+$');
    if (!letterRegex.hasMatch(value)) {
      return 'Rua deve conter apenas letras';
    }
    return null;
  }

  static String? validateNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Rua é obrigatório';
    }
    // Regex to check if the value contains only digits
    final numericRegex = RegExp(r'^\d+$');
    if (!numericRegex.hasMatch(value)) {
      return 'A rua deve conter apenas números';
    }
    return null;
  }
}
