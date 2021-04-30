import 'package:flutter/material.dart';
import 'package:mrplan/src/pages/formulario.dart';


class DetallePage extends StatelessWidget{
  static final nombrePagina = "detalle";

  @override
  Widget build(BuildContext context){

    Map<String, dynamic> tarea = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text('Detalle'),
      ),
     
    body: Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: 20.0,
            bottom: 40.0,
          )
        ), 
      Text("${tarea['nombre']}", style: TextStyle(fontSize: 20.0),),
      SizedBox(height: 20.0,),
      Text("Descripción:"),
      Container(
        margin: EdgeInsets.only(
          top: 20.0,
          bottom: 40.0
        ),
        child: Text("${tarea['descripcion']}")),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:<Widget>[
        // ignore: deprecated_member_use
        RaisedButton(
          color: Colors.green,
          textColor: Colors.white,
          onPressed: ()=>{}, 
          child: Text("Terminar"),
          ),
          // ignore: deprecated_member_use
                  RaisedButton(
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: ()=>Navigator.pushNamed(context, FormularioPage.nombrePagina, arguments: tarea), 
          child: Text("Editar"),
          ),
          // ignore: deprecated_member_use
                  RaisedButton(
          color: Colors.red,
          textColor: Colors.white,
          onPressed: ()=>{}, 
          child: Text("Eliminar"),
          ),

      ],
      )
      ],
    ),
    );
  }
}