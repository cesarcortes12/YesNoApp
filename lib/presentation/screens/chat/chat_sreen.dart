import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/share/mesage_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 85, 174, 198),
        leading: const Padding(
          padding: EdgeInsets.all(5.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://pbs.twimg.com/profile_images/1187167749774204928/x6aYEeCB_400x400.jpg'),
          ),
        ),
        title: const Text('Sheldon Cooper'),
      ),
      body: _ChatView(),
    );
  }
}

//CHAT VIEW WIDGET

//en body en un coantainer clic derecho extraer view lo nombramos y no creo esto de aboajo
class _ChatView extends StatelessWidget {
  const _ChatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //esto hace parte del provider y va a estar pemdiente a los cambios en charprovider
    //para estarlo redibujando
    final chatprovider = context.watch<
        ChatProvider>(); //aqui le decimos que la instancia chatprovider cambie lo escuche

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    //nota todo elemento que tenga un scroll tendra un ontroller para darle manejo
                    //vamos a controlar cuando los mensajes llegue se desplace hacia abajo el scrll
                    controller: chatprovider
                        .chatScrollController, //el controllr se amarra a cualquier controlador que nosotoros queramos en este caso se amarra con el de chat provider
                    itemCount: chatprovider.messageList.length,
                    itemBuilder: (context, index) {
                      /*tecnica para alternar entre uno y otro mensaje
                return (index % 2 == 0)
                    ? const herMessageBubble()
                    : const MyMessageBubble();*/

                      final message = chatprovider.messageList[index];
                      return (message.fromWho == FromWho.hers)
                          ? HerMessageBubble(message: message)
                          : MyMessageBubble(message: message);
                    })),
            //retornamos caja de texto personalizada en la carpeta share
            MessageFieldBox(
              onValue: (value) => chatprovider.sendMessage(value),
            ),
          ],
        ),
      ),
    );
  }
}
