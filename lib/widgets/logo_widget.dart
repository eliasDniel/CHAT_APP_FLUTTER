import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final String message;
  const Logo({super.key, required this.message  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 170,
        margin: EdgeInsets.only(top: 30, bottom: 20),
        child: Column(
          children: [
            Image(image: AssetImage('assets/tag-logo.png')),
            SizedBox(height: 20),
            Text(message, style: TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}