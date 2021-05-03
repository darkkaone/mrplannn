import 'package:flutter/material.dart';
import 'package:mrplan/services/database_services.dart';
import 'package:mrplan/src/models/todo.dart';
import 'package:mrplan/src/pages/todolist.dart';
import 'package:mrplan/src/widgets/appbar.dart';
import 'package:mrplan/src/widgets/radialprogress.dart';
class GraficasCirculares extends StatefulWidget {

  @override
  _GraficasCircularesState createState() => _GraficasCircularesState();
}

class _GraficasCircularesState extends State<GraficasCirculares> {
 

  @override
  Widget build(BuildContext context) {
    
setState(() {
  
});  final double valorporcentaje = Percentage().percentage;

    return Scaffold(
      

      
      appBar: AppBar(elevation: 0, backgroundColor: Colors.white, toolbarHeight: 35, title: Center(child: Text('Mr. Plan', textAlign: TextAlign.center, style: TextStyle(color: Colors.black)))),
      
      body: Stack (children: [


Tareas(),


// Barradetareas(),

        Container(
      decoration: BoxDecoration(
        boxShadow: [
          new BoxShadow(color: Colors.white,
          offset: Offset(0, 15.0),
          blurRadius: 10.0)],
        color: Colors.white,
      ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.3,
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(top: 40),
          child: CustomRadialProgress(porcentaje: valorporcentaje , color: Colors.blue[800],))
          ,
      
      ],)
    );
    
  }
}
// ignore: must_be_immutable
class CustomRadialProgress extends StatefulWidget {

  final Color color;

  CustomRadialProgress({
    @required this.porcentaje,
    @required this.color,
  });

  double porcentaje = Percentage().percentage;

  @override
  _CustomRadialProgressState createState() => _CustomRadialProgressState();
}

class _CustomRadialProgressState extends State<CustomRadialProgress> {
  @override
  Widget build(BuildContext context) {

    return Container(
    width: 150.0,
    height: 150.0,
    child: RadialProgress(porcentaje: porcentaje,
    colorprimario: this.widget.color,
    colorsecundario: Colors.grey[350],
    grosorsecundario: 4,
    grosorprimario: 10,),
    );
  }
}

  
  
  double porcentaje = 0.0;
  double nuevoPorcentaje = 0.0;
  int valorinicial = 0;
  int nuevovalorinicial = 0;








