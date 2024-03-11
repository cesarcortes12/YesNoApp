import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infraestructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  final _dio =
      Dio(); //el baseoptions es para enviar la base url ,headers o parametros por defecto  pero en esete caso no la utilizamos

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');

    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    //este return viene del modelo que fue el encargadp
    return yesNoModel.toMessageEntity();
  }
}

/*TEORIA:
  en primer lugar la peticion la hicimos con dio entonces en la trespuesta llega un mapa
  la cual viene con una estrucutura. y por eso clreamos un modelo que nos va a ayudar 
  a trabajr con una implemtentacion de la respuesta. entonces el modelo genera como una capa
  que nos retorna el message el cual podemos utilizar a los largo de la app
  em el modelo tenemos un metodo que nos va a crear la instancia ya con la estrucutura lista para trabajarla 
   
 */
