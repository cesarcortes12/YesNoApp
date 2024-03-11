import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {
//esta son los argumentos que va a necesitar el constructor
  final Message message;

  //y este es el constructor quien va a recibir esos parametros
  const MyMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    // vamos a buscar el tema dentro del contexto para cuadrar colores
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            
              color: colors
                  .primary, //esta tomando el color primario del theme que nosotros definimos arriba y que lo traemos de app_theme.dart
              borderRadius: BorderRadius.circular(20)),
            child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}
