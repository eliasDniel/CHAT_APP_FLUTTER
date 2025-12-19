import 'dart:io';

class Enviroment {
  static String apiUrl = Platform.isAndroid
      ? "http://192.168.1.11:3000/api"
      : "http://localhost:3000/api";
}
