import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String message;
  final String ruta;
  const Labels({super.key, required this.ruta, required this.message});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          if (message != '¿Ya tienes una cuenta?') ...[
            Text(
              'No tienes cuenta?',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 10),
          ],
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, ruta);
            },
            child: Text(
              message,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
