//TODO:28 1st step to use shared preferences

import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{

  static SharedPreferences sharedPreferences;

  static init()async{
    sharedPreferences =await SharedPreferences.getInstance();
  }
  void getData(){}
}