import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static SharedPreferences? _preferences;

  static Future<SharedPreferences?> getInstance() async {
    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
      return _preferences;
    }
    return _preferences;
  }

  //-------------- Add Data ---------------------

  static saveUserDataString(
      {required String variableName, required String variableValue}) async {
    await _preferences?.setString(variableName, variableValue);
  }

  static saveUserDataBool(
      {required String variableName, required bool variableValue}) async {
    await _preferences?.setBool(variableName, variableValue);
  }

  static saveUserDataInt(
      {required String variableName, required int variableValue}) async {
    await _preferences?.setInt(variableName, variableValue);
  }

  static saveUserDataStringList(
      {required String variableName,
      required List<String> variableValue}) async {
    await _preferences?.setStringList(variableName, variableValue);
  }

  static removeValueToSharedPref({required String variableName}) async {
    await _preferences?.remove(variableName);
  }

  // ---------------- Set Data -----------------------

  static String? getUserDataString({required String variableName}) {
    String? returnValue = _preferences?.getString(variableName);
    return returnValue;
  }

  static int? getUserDataInt({required String variableName}) {
    int? returnValue = _preferences?.getInt(variableName);
    return returnValue;
  }

  static bool? getUserDataBool({required String variableName}) {
    bool? returnValue = _preferences?.getBool(variableName);
    return returnValue;
  }

  static List<String>? getUserDataStringList({required String variableName}) {
    List<String>? returnValue = _preferences?.getStringList(variableName);
    return returnValue;
  }

/*
// Set Int DATA
  static Future<bool> saveUserDataInt({KeyName, value}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setInt(KeyName, value);
  }

// Get Int Data
  static Future getUserDataInt({KeyName}) async {
    return sharedPreferences.getInt(KeyName);
  }

// Set Bool DATA
  static Future<bool> saveUserDataBool({KeyName, value}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setBool(KeyName, true);
  }

// Get Bool Data
  static Future getUserDataBool({KeyName}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(KeyName);
  }

// Set String DATA
  static saveUserDataString({value, KeyName}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(KeyName, value).toString();
  }

// Get String Data
  static getUserDataString({KeyName}) {
    SharedPreferences sharedPreferences = SharedPreferences.getInstance();
    String? returnValue = sharedPreferences.getString(KeyName);
    return returnValue;
  }
*/

  static removeUserData() async {
    _preferences?.clear();
  }
}
