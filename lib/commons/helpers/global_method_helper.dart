class GlobalMethodHelper {
  static bool? _cachedHasSecondaryDisplay;

  static bool isEmpty(text) {
    if (text == "" || text == null || text == "null") {
      return true;
    } else {
      return false;
    }
  }

  static bool isEmptyWithDash(text) {
    if (text == "" || text == null || text == "null" || text == "-") {
      return true;
    } else {
      return false;
    }
  }

  static bool isZeroValue(text) {
    if (text is String) {
      text = removeTrailingZero(text);
      return text == "0" ? true : false;
    } else {
      return text > 0 || text < 0 ? false : true;
    }
  }

  static bool isNotNullandZeroValue(text) {
    if (text != null &&
        text != "" &&
        text != "0" &&
        text != "0.0" &&
        text != "null") {
      return true;
    } else {
      return false;
    }
  }

  static String formatNumberToString(String? text,
      {String defaultValue = "0"}) {
    if (GlobalMethodHelper.isEmpty(text)) {
      return defaultValue;
    }
    return int.parse(double.parse(text!).toStringAsFixed(0)).toString();
  }

  static bool isZeroValueDecimal(text) {
    if (text is String) {
      return text == "0" ||
              text == "0.0" ||
              text == null ||
              text == "null" ||
              text == ""
          ? true
          : false;
    } else {
      return text > 0 || text < 0 ? false : true;
    }
  }

  static String formatNumberToKilo(String text, {String defaultValue = "0"}) {
    if (GlobalMethodHelper.isEmpty(text)) {
      return defaultValue;
    }
    return (double.parse(text) / 1000).toStringAsFixed(0) + "K";
  }

  static int formatTextNumberToInt(String? text, {int defaultValue = 0}) {
    if (GlobalMethodHelper.isEmpty(text)) {
      return defaultValue;
    }
    return int.parse(double.parse(text!).toStringAsFixed(0));
  }

  static double formatTextNumberToDouble(String? text,
      {double defaultValue = 0}) {
    if (GlobalMethodHelper.isEmpty(text)) {
      return defaultValue;
    }
    return double.parse(text!);
  }

  static bool isEmptyList(Iterable<dynamic>? list) {
    if (list == null) {
      return true;
    } else if (list.length == 0) {
      return true;
    } else {
      return false;
    }
  }

  static String removeTrailingZero(String text) {
    ///NOTE: round to 3 number after comas
    String _roundthreedecimal = (double.parse(text)).toStringAsFixed(3);

    ///NOTE: add zero remover for 3.000 -> 3.0, 3.27000 -> 3.27, and round to 3 number after comas
    String _removeLongerDecimal = double.parse(_roundthreedecimal).toString();

    ///NOTE: remove zero after comas including its comas, ex: 3.0 -> 3, 2.2 -> 2.2
    return _removeLongerDecimal.replaceAll(RegExp(r"([.]*0)(?!.*\d)"), "");
  }

  static int validateNumber(String? valueInput) {
    int value = 0;
    if (valueInput != null && valueInput != "null" && valueInput != "") {
      value = double.parse(valueInput).round();
    }
    return value;
  }

  static double validateNumberDouble(String? valueInput) {
    double value = 0;
    if (valueInput != null && valueInput != "null" && valueInput != "") {
      value = double.parse(valueInput);
    }
    return value;
  }

  static bool? validateBoolean(bool? valueInput) {
    bool? value = false;
    if (!isEmpty(valueInput.toString())) {
      value = valueInput;
    }
    return value;
  }

  static String? validateEmail(String? value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern as String);
    if (value!.isEmpty)
      return 'Email Tidak Boleh Kosong';
    else if (!regex.hasMatch(value))
      return 'Masukkan Email yang valid';
    else
      return null;
  }

  static String? validatePassword(String value) {
    Pattern pattern =
        r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[*@!∆¶×÷π√•|`~£¢€¥^°=}{✓™®©%<>%@#$_&\-+()/?!;:\"/\]/\[/.,\u0027]).{8,}$';
    RegExp regex = new RegExp(pattern as String);
    if (value.isEmpty) {
      return 'Password tidak boleh kosong';
    } else if (value.contains(' ')) {
      return 'Password tidak boleh menggunakan karakter spasi';
    } else if (value.length < 8) {
      return 'Kata sandi diisi minimal 8 karakter';
    } else if (value.isNotEmpty && !regex.hasMatch(value)) {
      return 'Kata sandi harus berisi huruf, angka, dan simbol.';
    } else {
      return null;
    }
  }

  static int formatPriceMinusToZero(int value) {
    int result = 0;
    if (!isEmpty(value)) {
      if (value < 0) {
        result = 0;
      } else {
        result = value;
      }
      ;
    }
    return result;
  }

  // static String parseHtmlContentToString(String? htmlString) {
  //   final document = parse(htmlString);
  //   final String parsedString =
  //       parse(document.body!.text).documentElement!.text;
  //
  //   return parsedString;
  // }
  //
  // static String removeNullParams(String params) {
  //   params = params.replaceAll('\\\"null\\\"', '\\\"\\\"');
  //   params = params.replaceAll('\"null\"', '\"\"');
  //   return params;
  // }
  //
  // static openTerm() async {
  //   String url = ConstantUrlHelper.URL_TERM_AND_CONDITION;
  //   launch(url);
  // }
  //
  // static openPrivacy() {
  //   String url = ConstantUrlHelper.URL_PRIVACY_POLICY;
  //   launch(url);
  // }

  static emailMask(String mail) {
    String _result = '';
    List<String> _splited = mail.split("@");
    if (_splited[0].length > 4) {
      _result = _splited[0].substring(0, 2);
      for (int i = 0; i < _splited[0].length - 4; i++) {
        _result += '*';
      }
      _result += _splited[0].substring(_splited[0].length - 2);
    } else {
      for (int i = 0; i < _splited[0].length; i++) {
        _result += '*';
      }
    }

    return _result + '@' + _splited[1];
  }

  // static void screenUtilsInitTablet(BuildContext context,
  //     [double width = ConstantNameHelper.SCREEN_WIDTH,
  //       double height = ConstantNameHelper.SCREEN_HEIGHT]) {
  //   ScreenUtil.init(
  //       BoxConstraints(
  //           maxWidth: MediaQuery.of(context).size.width,
  //           maxHeight: MediaQuery.of(context).size.height),
  //       designSize: Size(width, height),
  //       orientation: Orientation.landscape);
  //   setLandscapeOrientation();
  // }
  //
  // static void screenUtilsInitSmartphone(BuildContext context,
  //     [double width = ConstantNameHelper.SCREEN_WIDTH_SP,
  //       double height = ConstantNameHelper.SCREEN_HEIGHT_SP]) {
  //   ScreenUtil.init(
  //       BoxConstraints(
  //           maxWidth: MediaQuery.of(context).size.width,
  //           maxHeight: MediaQuery.of(context).size.height),
  //       designSize: Size(width, height),
  //       orientation: Orientation.portrait);
  // }
  //
  // static bool checkIsTablet(BuildContext context) {
  //   List<SpecialDevice> specialDevices;
  //   SpecialDevice? specialDevice;
  //   try {
  //     var json = jsonDecode(
  //         App().remoteConfig.getString(ConstantNameHelper.SPECIAL_DEVICE));
  //     final currentDevice = App().sharedPreferences.getString("current_device");
  //
  //     specialDevices =
  //         (json as List).map((data) => SpecialDevice.fromJson(data)).toList();
  //
  //     specialDevice = specialDevices
  //         .singleWhere((element) => element.device_name == currentDevice);
  //   } catch (e) {
  //     print("error check tablet $e");
  //   }
  //
  //   if (specialDevice != null) {
  //     if (specialDevice.is_tablet) {
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } else {
  //     if (MediaQuery.of(context).size.width >= 600) {
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   }
  // }

  static String AlertLimitChar(String obj, String limit) {
    return "$obj tidak boleh melebihi $limit karakter";
  }

  static String AlertCantBeEmpty(String obj) {
    return "$obj tidak boleh kosong";
  }

  // static Future<bool> hasSecondaryDisplay() async {
  //   if (_cachedHasSecondaryDisplay != null) return _cachedHasSecondaryDisplay!;
  //
  //   DisplayManager displayManager = DisplayManager();
  //   List<Display> displays = (await displayManager.getDisplays())!;
  //   _cachedHasSecondaryDisplay = displays.length > 1;
  //   return _cachedHasSecondaryDisplay!;
  // }

  // static Future<void> setLandscapeOrientation() async {
  //   if (!(await hasSecondaryDisplay())) {
  //     SystemChrome.setPreferredOrientations(
  //         [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  //   }
  // }
  //
  // static Future<void> setPortraitOrientation() async {
  //   if (!(await hasSecondaryDisplay())) {
  //     await SystemChrome.setPreferredOrientations([
  //       DeviceOrientation.portraitUp,
  //     ]);
  //   }
  // }
  //
  // static Future<void> setSystemUIOverlayStyle() async {
  //   if (!(await hasSecondaryDisplay())) {
  //     SystemChrome.setSystemUIOverlayStyle(
  //         SystemUiOverlayStyle(statusBarColor: KloposColors.statusBarColor));
  //   }
  // }
}
