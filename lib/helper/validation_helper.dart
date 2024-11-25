class ValidationHelper {
  static Future logOut() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.clear();
  }

  static String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return "Required";
    } else if (value.isNotEmpty && !regExp.hasMatch(value)) {
      return "Invalid Email!";
    }
    return "";
  }

  static String validateRequired(String value) {
    if (value.isEmpty) {
      return "Required!";
    }
    return "";
  }

  static String validateCNIC(String value) {
    if (value.isEmpty) {
      return "Required!";
    } else if (value.length != 13) {
      return "CNIC must be 13 numbers";
    }
    return "";
  }

  static String validateName(String value, String name) {
    String pattern =
        r'(^[a-zA-Z\u0600-\u06FF\u0750-\u077F\uFB50-\uFDFF\uFE70‌​-\uFEFF ]*$)';
    RegExp regExp = RegExp(pattern);
    if (value.length < 3) {
      return "Required!";
    } else if (!regExp.hasMatch(value)) {
      return "$name can only contains letters";
    }
    return "";
  }

  static String validateQuantity(String value) {
    String pattern =
        r'(^[a-zA-Z\u0600-\u06FF\u0750-\u077F\uFB50-\uFDFF\uFE70‌​-\uFEFF ]*$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return "Required!";
    } else if (!regExp.hasMatch(value)) {
      return "Numbers Only";
    }
    return "";
  }

  static String validateAmount(String value, String name) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = RegExp(pattern);
    if (value.length < 3) {
      return "Required!";
    } else if (!regExp.hasMatch(value)) {
      return "$name can only contains letters";
    }
    return "";
  }

  static String validatePassword(String value,
      {bool isConfirm = false, String password = ""}) {
    if (value.isEmpty) {
      return "Required!";
    } else if (value.length < 6) {
      return "Password must be minimum 6 characters long";
    } else if (isConfirm && value != password) {
      return "Password does not match!";
    }
    return "";
  }

  static String validateMobileNumber(String value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return "Required!";
    } else if (value.length < 10) {
      return "Invalid Mobile #!";
    } else if (value.length > 10) {
      return "Invalid Mobile #!";
    } else if (value.startsWith("۰")) {
      return "Please use English to insert number.";
    } else if (!regExp.hasMatch(value)) {
      return "Mobile Number must be digits 0-9";
    }
    return "";
  }
}
