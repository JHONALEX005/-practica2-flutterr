class FormValidators {

  static String? required(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obligatorio';
    }
    return null;
  }

  static String? minLength(String? value) {
    if (value == null || value.length < 3) {
      return 'Minimo 3 caracteres';
    }
    return null;
  }

  static String? onlyNumbers(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obligatorio';
    }
    final regex = RegExp(r'^\d+$');
    if (!regex.hasMatch(value)) {
      return 'Solo numeros permitidos';
    }
    return null;
  }
}
