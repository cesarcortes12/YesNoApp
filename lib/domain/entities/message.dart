//ENTIDADES

/* las entidades es lo mas puro que necesita mi app para trabajar va dentro de domain 
no son widgets ni graficas de pantalla ,tampoco es apaegado al backend
en este caso es puro codigo de dart .
es para tipar los objetos y como se van  a usar recibir a lo largo de la app
  */


enum FromWho {me, hers}

class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;

  Message({
  required this.text,
  this.imageUrl,
  required this.fromWho});



}


