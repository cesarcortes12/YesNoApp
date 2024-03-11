import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;

  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    // vamos a buscar el tema dentro del contexto para cuadrar colores
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors
                  .secondary, //esta tomando el color primario del theme que nosotros definimos arriba y que lo traemos de app_theme.dart
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 5),
        _ImageBubble(message.imageUrl!), //llamamos al widget _ImageBubble
        SizedBox(height: 10)
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {

  final String imageUrl;

  const _ImageBubble(this.imageUrl); //constructor

  @override
  Widget build(BuildContext context) {
    /*necesitamos saber el tamaño de la pantalla el media query nos regresa info de la pantalla del dispositivo
    que se encuentra en el arbol del widgets*/
    final size = MediaQuery.of(context).size;
    //print(size);
    return ClipRRect(
        //este widget se encarga de redondear los bordes
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          imageUrl,
          width: size.width * 0.7,
          height: 150,
          fit: BoxFit.cover,

          //vamos a cargar un texto como espera a que se cargue la imagen
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;

            return Container(
              width: size.width * 0.7,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Text('Cargando...'),
            );
          },
        ));
  }
}
