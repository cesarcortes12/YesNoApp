//QUICK TYPE: en la pagina quiktype.io podemos convertir el json a dart
/* todo este codigo ha sido generado a travez de quick tipe solo le pegamos el json
y la pagina genera esto  que va a ser nuestro modelo */

import 'dart:convert';

import 'package:yes_no_app/domain/entities/message.dart';

/* esto no lo necesitamos  
YesNoModel yesNoModelFromJson(String str) =>
    YesNoModel.fromJson(json.decode(str));

String yesNoModelToJson(YesNoModel data) => json.encode(data.toJson());*/

class YesNoModel {
  final String answer;
  final bool forced;
  final String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

//podemos utilizar este metodo que es de tipo message  para crear una instancia de message
//este mapper es el que realmente vamos a utilizar
  Message toMessageEntity() => Message(
      text: answer == 'yes' ? 'Si' : 'No',
      fromWho: FromWho.hers,
      imageUrl: image
      );

//es es para hacer el opuesto , con el mapa  hacer el mapa
/*PERO NO LO NECESITAMOS EN ESTE CASO 
  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };*/
}


/*TEORIA:
  en primer lugar la peticion la hicimos con dio entonces en la trespuesta llega un mapa
  la cual viene con una estrucutura. y por eso clreamos un modelo que nos va a ayudar 
  a trabajr con una implemtentacion de la respuesta. entonces el modelo genera como una capa
  que nos retorna el message el cual podemos utilizar a los largo de la app
  em el modelo tenemos un metodo que nos va a crear la instancia ya con la estrucutura lista para trabajarla 
   
 */