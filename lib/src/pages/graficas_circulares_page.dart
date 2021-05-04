import 'package:cloud_firestore/cloud_firestore.dart';
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
  
});  
// final int valorporcentaje = porcentaje;

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
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('Percent').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
              return CustomRadialProgress(porcentaje: snapshot.data.docs[0]['value'] , color: Colors.blue[800],);
            }
          ))
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

  dynamic porcentaje = Percentage().percentage;

  @override
  _CustomRadialProgressState createState() => _CustomRadialProgressState();
}

class _CustomRadialProgressState extends State<CustomRadialProgress> {
  @override
  Widget build(BuildContext context) {

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Percent').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return SizedBox();
        return Container(
        width: 150.0,
        height: 150.0,
        child: RadialProgress(porcentaje: snapshot.data.docs[0]['value'],
        colorprimario: this.widget.color,
        colorsecundario: Colors.grey[350],
        grosorsecundario: 4,
        grosorprimario: 10,),
        );
      }
    );
  }
}

  
  
  dynamic porcentaje = 0;
  int nuevoPorcentaje = 0;
  int valorinicial = 0;
  int nuevovalorinicial = 0;








