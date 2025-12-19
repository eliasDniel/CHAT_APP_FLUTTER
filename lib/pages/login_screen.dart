import 'package:app_chat_socket/helpers/mostraralerta.dart';
import 'package:app_chat_socket/services/authservice.dart';
import 'package:app_chat_socket/widgets/custom_bottom.dart';
import 'package:app_chat_socket/widgets/input_widget.dart';
import 'package:app_chat_socket/widgets/labels_widget.dart';
import 'package:app_chat_socket/widgets/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Logo(message: 'Login'),
                _Form(),
                Labels(ruta: 'register', message: 'Crear una cuenta ahora!'),
                Text(
                  'Términos y condiciones de uso',
                  style: TextStyle(fontWeight: FontWeight.w200),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  const _Form();

  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Container(
      margin: EdgeInsets.only(bottom: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.mail_outline,
            hintText: 'Email',
            textController: emailController,
            keyboardType: TextInputType.emailAddress,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            hintText: 'Password',
            textController: passwordController,
            isPassword: true,
          ),

          CustomBottom(
            onPressed: authService.autenticando
                ? null
                : () async {
                    FocusScope.of(context).unfocus();

                    final loginOk = await authService.login(
                      emailController.text.trim(),
                      passwordController.text.trim(),
                    );
                    if (loginOk) {
                      Navigator.pushReplacementNamed(context, 'users');
                    } else {
                      mostrarAlerta(context, 'Login incorrecto', 'Revise sus credenciales');
                    }
                  },
            text: 'Ingresa',
          ),
        ],
      ),
    );
  }
}
