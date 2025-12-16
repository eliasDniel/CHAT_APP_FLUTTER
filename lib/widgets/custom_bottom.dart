import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const CustomBottom({super.key, required this.onPressed, this.text = 'Ingrese'});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: StadiumBorder(),
          elevation: 5,
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
