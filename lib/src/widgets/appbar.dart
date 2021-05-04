import 'package:flutter/material.dart';
import 'package:mrplan/src/pages/graficas_circulares_page.dart';




Future<int> quitarr() async =>

porcentaje -= 10;

Future<int> anadirr() async =>

porcentaje += 10;

void anadir(){
if (porcentaje >= 0){
anadirr();
}
else {
  porcentaje = 0;
}
}

void quitar(){
if (porcentaje >= 0){
quitarr();
}
else {
  porcentaje = 0;
}

}


