class PasswordValidator {
  static bool isValidPassword(String? password) {
    if (password == null) return false;
    final regex = RegExp(
        r"""^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\^$*.\[\]{}()?!"!@#%&/\\,><':;|_~`=+-]).*$""");

    return regex.hasMatch(password);
  }
}
