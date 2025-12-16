import 'package:app_chat_socket/widgets/custom_bottom.dart';
import 'package:app_chat_socket/widgets/input_widget.dart';
import 'package:app_chat_socket/widgets/labels_widget.dart';
import 'package:app_chat_socket/widgets/logo_widget.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                Logo(message: 'Registro'),
                _Form(),
                Labels(ruta: 'login', message: '¿Ya tienes una cuenta?'),
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
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.person_outline,
            hintText: 'Nombre',
            textController: nameController,
          ),
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
            onPressed: () {
              print(emailController.text);
              print(passwordController.text);
            },
            text: 'Crear cuenta',
          ),
        ],
      ),
    );
  }
}
