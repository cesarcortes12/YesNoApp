import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

//TextEditingController no da un control sobre el input al cual esta asociado
    final textController = TextEditingController();

//vamos amantener el foco sobre el input para que no se este cerrando
    final focusNode = FocusNode();

    /*vamos a utilizar otro metodo para decorar inputs lo  que 
    estamos haciendo es guardar las confifuraicones en una variable
    */
    final outlineInputBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: Color.fromARGB(0, 255, 0, 0)),
      borderRadius: BorderRadius.circular(20),
    );

    final inputDecoration = InputDecoration(
      hintText: 'End your message with a "?"',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true, //solo es un fondito
      suffixIcon: (IconButton(
        icon: const Icon(Icons.send),
        onPressed: () {
          //en la variable gsolicitamos por medio del controller los datos
          final textValue = textController.value.text;
          textController.clear();
          onValue(textValue);
        },
      )),
    );

    return TextFormField(
      controller: textController, //variable declarada arriba
      decoration: inputDecoration, //variable declarada arriba
      focusNode: focusNode, //variable declarada arriba
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      onFieldSubmitted: (values) {
        textController.clear();
        focusNode.requestFocus();
        onValue(values);

        //ESTO ES POR SI NECESITAMOS UNO A UNO EL VALOR DE CADA TECLEO
        // onChanged: (value) {
        //   print('change value: $value');
        // },
      },
    );
  }
}
