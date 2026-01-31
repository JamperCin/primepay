class NumberUtils {
  ///Parse money
  static String parseIntMoney(String source) {
    int value = 0;
    try {
      if (!source.contains(".")) {
        value = parseInt(source);
      } else {
        int index = source.indexOf(".");
        String temp = source.replaceAll(".", "");
        value = parseInt(temp);

        if (value == 0) {
          //return "0";
        }

        print("SRC $source == IND $index == TEM $temp == VSL $value");

        List<String> list = temp.split("");
        int i = 0;
        temp = "";
        for (String str in list) {
          temp = temp + str;
          if (i == index - 1) {
            temp = temp + ".";
          }
          i++;
        }
        return temp;
      }
    } catch (e) {
      print("Error $e");
    }
    return "$value";
  }

  static String moneyCurrencyFormat(dynamic price,
      {int dec = 0, String currency = "GHS"}) {
    if (price is String) {
      return "$currency ${moneyFormat(price, decPlace: dec)}";
    }

    if (price is double) {
      return "$currency ${moneyFormatDouble(price, decPlace: dec)}";
    }

    return "$currency 0.00";
  }

  static String moneyFormat(String? price, {int decPlace = 0}) {
    if (price == null || price.isEmpty) {
      return "0.00";
    }

    var value = price;
    double p = parseDouble(price);
    value = p.toStringAsFixed(decPlace);

    if (price.length > 2) {
      value = value.replaceAll(RegExp(r'\.D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
      return value;
    }
    return value;
  }

  static String moneyFormatDouble(double? price, {int decPlace = 0}) {
    if (price == null) {
      return "0.00";
    }

    var value = price.toStringAsFixed(decPlace);

    if (price.toString().length > 2) {
      value = value.replaceAll(RegExp(r'\.D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
      return value;
    }
    return value;
  }

  static double parseDouble(String amount) {
    double value = 0.0;
    try {
      value = double.parse(amount);
    } catch (e) {
      print("Error $e");
    }
    return value;
  }

  static int parseInt(String source) {
    int value = 0;
    try {
      value = int.parse(source);
    } catch (e) {
      print("Error $e");
    }
    return value;
  }

  static String cleanPhoneNumber(String phone) {
    return phone.trim().replaceAll("+", "").replaceAll(" ", "");
  }

  static String getCurrencyAmount(String amnt,
      {int dec = 0, String currency = "GHS"}) {
    return "$currency ${moneyFormat(amnt, decPlace: dec)}";
  }

  static String parseString(double val) {
    try {
      return val.toString();
    } catch (e) {
      return "";
    }
  }
}
