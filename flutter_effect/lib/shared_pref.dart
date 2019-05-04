import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  SharedPref();


  updateBackgroundColorPref(int backgroundColor) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("backgroundColor", backgroundColor);
  }

  getBackgroundColorPref(int backgroundColor) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    backgroundColor = prefs.getInt("backgroundColor");
  }

}