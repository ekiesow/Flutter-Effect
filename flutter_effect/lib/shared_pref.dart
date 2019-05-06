import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_effect/global_scaffold.dart';


class SharedPref {
  SharedPref();


  updateBackgroundColorPref() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("backgroundColor", GlobalScaffold.backgroundColorInt);
  }

  getBackgroundColorPref() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    GlobalScaffold.backgroundColorInt = prefs.getInt("backgroundColor");
  }

}