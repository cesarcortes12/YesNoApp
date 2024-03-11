import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';

//el provider siemrpe extiende de change notifier
class ChatProvider extends ChangeNotifier {
//este es el provider que va a manejar la lista de mensajes
//y tambien va a manejar el envio de mensajes

//esto espara pasarle al chat screen y es quien le va a decir cuando hacer scroll
  final ScrollController chatScrollController = ScrollController();

  //cremamos la instancia de la pticion http
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: 'hola', fromWho: FromWho.me),
    Message(text: 'ya regresate a casa?', fromWho: FromWho.me),
  ];

/*este metodo lo que va a hacer es que cuando enviemos 
un mensaje este metodo lo va a recibir  y luego va a
enviarlo a la lista */

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if (text.endsWith('?')) {
      herReplay();
    }

    // asi como en un statefull widget utilizamos el state para maneja el estado aqui para manejar
    //los cambios utilizamos el notifyListeners

    notifyListeners();
    moveScrollToBotton();
  }

  //con esta funcion vamos a hacer la animacion cuando se mande un mensaje la pantalla baje
  /*void moveScrollToBotton() {
    chatScrollController.animateTo(
      //el animated pide trees cosas
      chatScrollController.position.maxScrollExtent, //la posicion
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut, //el el tipo de animacion
    );
  }*/

//NOTA : BASICMAENTE ES LA MISMA FUNCION DE ARRIBA SOLO QUE ESTE ES ASINCRONO Y ES MEJOR ASI
  Future<void> moveScrollToBotton() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
      //el animated pide trees cosas
      chatScrollController.position.maxScrollExtent, //la posicion
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut, //el el tipo de animacion
    );
  }

  Future<void> herReplay() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();

    moveScrollToBotton();
  }
}





/**
 TEORIA 

 PETICIONES HTTP:
en config se meten los helpper como por ejemplo los gets y los posts
 una peticion es un future que va retornar algo en este caso una instancia de un mensaje
 se utiliza dio o http que son las librerias , entonces en los heplrs crearemos las instancia que nos treara la 
 peticion, la cual se envia a una url, recordar que siempre es una peticion asincrona
 en el helper solo es la peticion que es una clase

 luego en chat provider creamos un metodo tambien future que es asincrono con el vual 
 tomaremos la respuesta que viene de helpers antes del metodo arriba definimos al variable de tipo get para poderla utlizar en 
 el metodo.
 la data siempre viene un mapa o un objeto el cual siempre se tiene que mappear


 MAPPERS:
 la data llega en un objeto que debe ser mappedo

en el future del helpper retornamos la instancia del menssaje con la smismas propiedades y valores
que vienen en la respuesta 

despues en el provider en el metodo herReplay en una variable obtenemos
la respuesta y la agragamos a la lista de mensajes sin embargo aun falta algo para mostrarlo en pantalla

INFRESTRUCUTRA: esta caprta es el punto intermedio entre dominnio y presentacion
es aqui van los modelos que es donde definimos la estructura que llega la peticion

y se define un constructor que va a poder recibir el mapa
IMPORTANTE: definimos un factory que basicamente es el encargado de construir una nueva instancia
con los nuevos datos y con la estructra definida por nosotros.

entonces el modelo finalemnte es una estructurade tipo YesNoModel la cual tiene como objetivo 
mapear la respuesta y cuando se reciba la respuesta crea una instancia con notacion de punto p
para acceder a cada una de las propiedades del map.

ya con esto en el helper podemos definir una variable que trae el mapa
y en el retorno del future ya podemos utilizar la notacion de punto para acceder a las propiedades 




 */