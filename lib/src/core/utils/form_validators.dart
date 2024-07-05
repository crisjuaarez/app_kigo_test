class FormValidators {
  static bool email(String? value) {
    if (value == null) return false;
    final bool isValid = RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    ).hasMatch(value);
    return isValid;
  }

  static bool password(String? value) => (value != null && value.length >= 6);
}
