import 'package:flutter/material.dart';

class ColorGradients {
  static Widget blueGradient() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: <Color>[
            Color(0xFF3eadcf),
            Color(0xFF83eaf1),
            Color(0xFFabe9cd),
          ],
        ),
      ),
    );
  }
}
