import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:mrplan/src/models/todo.dart';
import 'package:mrplan/src/widgets/radialprogress.dart';

class GraficasCirculares extends StatefulWidget {

  @override
  _GraficasCircularesState createState() => _GraficasCircularesState();
}

class _GraficasCircularesState extends State<GraficasCirculares> {
 
@override
void initState() { 
  super.initState();
  initializeDateFormatting();
}
  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = "es_ES";
    var now = new DateTime.now();
    var formatter = new DateFormat.EEEE().addPattern(',').add_yMMMMd();
    String formattedDate = formatter.format(now);
setState(() {
  
});  
// final int valorporcentaje = porcentaje;

    return Scaffold(
      

      
      appBar: AppBar(elevation: 0, backgroundColor: Colors.white, toolbarHeight: 35, title: Center(child: Text('Mr. Plan', textAlign: TextAlign.center, style: TextStyle(color: Colors.black)))),
      
      body: Stack (children: [





// Barradetareas(),

        Column(
          children: [
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
              )),
          
          AppBar(
            title: Text(formattedDate, style: TextStyle(color: Colors.black),),
            elevation: 0,
            backgroundColor: Colors.white,
            leading: ElevatedButton(
              style: ButtonStyle(backgroundColor:MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        return Colors.white; // Use the component's default.
      },
    ),),
              onPressed: ()=>Navigator.pushNamed(context, 'calendar'),
              child: Icon(Icons.calendar_today, color: Colors.blue[800],)),
          )],
        )
          ,
      Tareas(),
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








