import 'package:flutter/cupertino.dart';

import 'WidgetUtils.dart';

class ValidationUtils {
  static WidgetUtils widgetUtils = WidgetUtils();
  String errorMessage = "One or more fields required";

  void setWidgetUtils(WidgetUtils instance) {
    widgetUtils = instance;
  }

  void setErrorMessage(String errorMessage) {
    this.errorMessage = errorMessage;
  }

  bool isValidEmailAddress(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  bool isValidPhone(String phone) {
    return RegExp(r"^(?:[+0])?[0-9]{10}").hasMatch(phone);
  }

  String getStringData(TextEditingController editingController) {
    return editingController.text.toString().trim();
  }

  bool validateEntry(TextEditingController entry) {
    if (getStringData(entry).isEmpty) {
      widgetUtils.showErrorSnackBar(errorMessage);
      return false;
    }
    return true;
  }

  bool validateEntryFocus(TextEditingController entry, FocusNode focusNode) {
    if (getStringData(entry).isEmpty) {
      widgetUtils.showErrorSnackBar(errorMessage);
      focusNode.requestFocus();
      return false;
    }
    return true;
  }

  bool validateEntryPhone(TextEditingController entry) {
    if (!isValidPhone(getStringData(entry))) {
      widgetUtils.showErrorSnackBar("Please enter a valid phone number.");
      return false;
    }
    return true;
  }

  bool validateEntryPhoneFocus(
      TextEditingController entry, FocusNode focusNode) {
    if (!isValidPhone(getStringData(entry))) {
      widgetUtils.showErrorSnackBar("Please enter a valid phone number.");
      focusNode.requestFocus();
      return false;
    }
    return true;
  }

  bool validateEntryEmail(TextEditingController entry) {
    if (getStringData(entry).isNotEmpty) {
      if (!isValidEmailAddress(getStringData(entry))) {
        widgetUtils.showErrorSnackBar("Please enter a valid email address.");
        return false;
      }
    }
    return true;
  }

  bool validateEntryEmailFocus(
      TextEditingController entry, FocusNode focusNode) {
    if (getStringData(entry).isNotEmpty) {
      if (!isValidEmailAddress(getStringData(entry))) {
        widgetUtils.showErrorSnackBar("Please enter a valid email address.");
        focusNode.requestFocus();
        return false;
      }
    }
    return true;
  }

  bool validatePasswords(
      TextEditingController password, TextEditingController confirmPassword) {
    errorMessage = "Password required";
    bool isValid = validateEntry(password);
    if (isValid) {
      if (getStringData(password) != getStringData(confirmPassword)) {
        widgetUtils.showErrorSnackBar("Passwords do not match.");
        isValid = false;
      } else {
        isValid = true;
      }
    }
    return isValid;
  }

  bool validateTermsAndCondition(bool isTermsConditionsChecked) {
    if (!isTermsConditionsChecked) {
      widgetUtils.showErrorSnackBar(
          "Please you need to agree to Prime Terms And Conditions.");
      return false;
    }
    return true;
  }
}
