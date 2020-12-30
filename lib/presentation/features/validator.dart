class Validator {
  static String pass;
  static String validateEmail(String val) {
    Pattern pattern = "[A-Z0-9a-z._%+]+@[A-Za-z0-9.]+\\.[A-Za-z]{2,4}";
    RegExp regex = new RegExp(pattern);

    if (val.trim().isNotEmpty && !regex.hasMatch(val)) {
      return "Email address is not valid!";
    }
    return null;
  }

  static String validateListingTitle(String v) {
    if (v.trim().isEmpty) return "Please enter the title";
    if (v.trim().length < 10) return "Please enter at least 10 characters";
    return null;
  }

  static String validateListingDescription(String v) {
    if (v.trim().isEmpty) return "Please enter the description";
    if (v.trim().length < 10) return "Please enter at least 10 characters";
    return null;
  }

  static String validateMinPrice(String v) {
    if (v.trim().isEmpty) return "Please enter the price!";
    try {
      double.parse(v);
    } catch (e) {
      return "Price can only contain digits!";
    }
    return null;
  }

  static String validateMobile(String v) {
    if (v.trim().isEmpty) return "Please enter contact number!";
    Pattern pattern = "[0-9]{8,10}";
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(v)) {
      return "Contact number is not valid!";
    }
    return null;
  }

  static String validateFirstName(String val) {
    if (val.trim().isEmpty) return "Enter your first name!";
    if (val.trim().length < 2) return "First name is not valid!";
    return null;
  }

  static String validateLastName(String val) {
    if (val.trim().isEmpty) return "Enter your last name!";
    return null;
  }

  static String validatePassword(String val) {
    if (val.trim().isEmpty) return "Enter your password!";
    if (val.trim().length < 8) return "Please enter at least 8 characters!";
    pass = val;
    return null;
  }

  static String validateConfirmPassword(String val) {
    if (val.trim().isEmpty) return "Enter your confirmation password!";
    if (val.trim().length != pass.trim().length)
      return "Your password and confirmation password do not match!";
    return null;
  }
}
