import 'package:flutter/material.dart';

class Photo extends StatelessWidget {
  const Photo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://www.cieplice.pl/atrakcje/m33_staw.jpg",
      fit: BoxFit.cover,
    );
  }
}
