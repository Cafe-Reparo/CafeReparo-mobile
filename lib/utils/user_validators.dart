class Validators {
  //nome
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nome é obrigatório';
    }
    RegExp letterRegex = RegExp(r'^[a-zA-Z]+$');
    if (!letterRegex.hasMatch(value)) {
      return 'Nome deve conter apenas letras';
    }
    return null;
  }

  //sobrenome
  static String? validateSurname(String? value) {
    if (value == null || value.isEmpty) {
      return 'Sobrenome é obrigatório';
    }
    return null;
  }

  //email
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'E-mail é obrigatório';
    }
    // Regex pattern for basic email validation
    RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(value)) {
      return 'E-mail inválido';
    }
    return null;
  }

  //senha
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Senha é obrigatória';
    }
    if (value.length < 6) {
      return 'Senha deve ter pelo menos 6 caracteres';
    }
    RegExp regex = RegExp(r'^(?=.*[a-zA-Z])(?=.*\d).+$');
    if (!regex.hasMatch(value)) {
      return 'Senha deve conter pelo menos uma letra e um número';
    }
    return null;
  }

  //confirmar senha
  static String? validateConfirmPassword(String password, String? confirmPw) {
    if (confirmPw == null || confirmPw.isEmpty) {
      return 'Confirmar a senha é obrigatória';
    }
    if (password != confirmPw) {
      return 'As senhas não coincidem';
    }
    return null;
  }

  static String? validateAge(DateTime? birthDate) {
    if (birthDate == null) {
      return 'Data de nascimento é obrigatória';
    }
    final age = DateTime.now().year - birthDate.year;
    if (age < 18) {
      return 'Você deve ter mais de 18 anos';
    }
    return null; // Nenhum erro
  }
}
