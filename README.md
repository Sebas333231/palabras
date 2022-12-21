# palabras
Este es un proyecto el cual genera diez palabras cuando vas bajando, estas palabras pueden ser seleccionadas atravez de un corazón, estas palabras al ser seleccionadas se mandan a otra pestaña donde se forma una lista con estas palabras, este proyecto tambien trae un nav bar con una animacion de curved para este nav bar utilice la siguiente libreria:

![image](https://user-images.githubusercontent.com/110652225/208938563-1baeb79e-6355-47d8-81b4-b2dce7418190.png)

curved_navigation_bar: ^1.0.3

![image](https://user-images.githubusercontent.com/110652225/208937482-d6d03db7-ece4-45b3-8bab-dfbec17193ad.png)

para generar las palabras en ingles utilice la libreria:

english_words: ^4.0.0
Un paquete que contiene la mayoría de las ~5000 palabras en inglés usadas y algunas funciones de utilidad.
Impresión de los 50 sustantivos más usados ​​en el idioma inglés:
import 'package:english_words/english_words.dart';

main() {
  nouns.take(50).forEach(print);
}

