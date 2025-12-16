import 'package:app_chat_socket/pages/chat_screen.dart';
import 'package:app_chat_socket/pages/loading_screen.dart';
import 'package:app_chat_socket/pages/login_screen.dart' show LoginScreen;
import 'package:app_chat_socket/pages/register_screen.dart';
import 'package:app_chat_socket/pages/users_screen.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'users': (_) => UsersScreen(),
  'login': (_) => LoginScreen(),
  'register': (_) => RegisterScreen(),
  'chat': (_) => ChatScreen(),
  '/': (_) => LoadingScreen(),
};
