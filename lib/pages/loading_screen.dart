import 'package:app_chat_socket/pages/users_screen.dart';
import 'package:app_chat_socket/services/authservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Loading Screen')),
      body: FutureBuilder(
        future: checkAuthentication(context),
        builder: (context, snapshot) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 20),
                Text('Checking authentication...'),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> checkAuthentication(BuildContext context) async {
    final authService = Provider.of<AuthService>(context, listen: false);
    final authenticated = await authService.isLogeedIn();
    if (authenticated) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => UsersScreen(),
          transitionDuration: const Duration(milliseconds: 0),
        ),
      );
    } else {
      Navigator.pushReplacementNamed(context, 'login');
    }
  }
}
