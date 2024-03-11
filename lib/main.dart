//mateapp snippet para crear importacion de marerial y configuraxcion de my app

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:yes_no_app/config/theme/app_theme.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/screens/chat/chat_sreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider( //con el multiprovider podemos tener multiples providers
    //NOTA  al tener el multiproviders en la parte mas alta osea el main abarcamos todo el codigo
      providers: [
        //aqui vamos a crear un providery le definimos el que ya creamos 
        ChangeNotifierProvider(create: (_)=> ChatProvider()) //eñ guion bajo es para omitir ese argumento ya que no lo necesitamos
      ],
      child: MaterialApp(
        title: 'Yes no App',
        debugShowCheckedModeBanner: false,
        //aqui vamos a regresar el theme de la clase que creamos  en config theme
        theme: Apptheme(selectedColor: 1).theme(),
        home: const ChatScreen(),
      ),
    );
  }
}
