class ValidatorsApp {
  static bool isEmail(String email) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(email);
  }

  static bool isValidPassword(String password) {
    return password.length > 6;
  }

  static bool isValidFirstName(String name) {
    return name.length > 2;
  }

  static bool isValidUserLogin(String login) {
    return login.length > 4;
  }
}
