import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF5c11d4);

//vamos a crear una lista de colores
const List<Color> _colorthemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
];

class Apptheme {
//vamos a controlar una excepcion por que no podemos retornar _clortheme mas de 6 por que el arreglo solo tiene 6

  final int selectedColor; //clic derecho y generar constructor

  Apptheme({
    this.selectedColor = 0,
    //mediante una asercion vamos a validar que el color no sea mayor a 6
  }) : assert(selectedColor >= 0 && selectedColor <= _colorthemes.length - 1,
            'El color debe estar entre 0 y ${_colorthemes.length}');

//vamos a retornar algo de tipo themedata por que eso es lo que se espera desde el main
  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorthemes[selectedColor],
      //este es el tema oscuro
      //brightness: Brightness.dark
    );
  }
}
