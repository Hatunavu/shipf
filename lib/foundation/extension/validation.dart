extension ValidationInput on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp =
        RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  // bool get isValidPassword {
  //   final passwordRegExp = RegExp(
  //       r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
  //   return passwordRegExp.hasMatch(this);
  // }

  bool get isValidPassword {
    final passwordRegExp = RegExp(r'^.{6,}$');
    return passwordRegExp.hasMatch(this);
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^(0)[0-9]{9}$");
    //^(?:[+0]9)?[0-9]{10}$
    return phoneRegExp.hasMatch(this);
  }
}
