import 'package:flutter/material.dart';
import 'package:mrplan/src/pages/tareas_provider.dart';

class FormularioPage extends StatefulWidget {

static final nombrePagina = "formulario";

  _FormularioPageState createState() => _FormularioPageState();
}

class _FormularioPageState extends State<FormularioPage> {

Map<String, dynamic> tarea;

  final idForm = GlobalKey<FormState>();

  Map<String, dynamic> nuevaTarea ={};

  @override
  Widget build(BuildContext context) {

 tarea = ModalRoute.of(context).settings.arguments;



    return Scaffold(
      appBar: AppBar(
      title: Text("Formulario"),
      ),
      body: SingleChildScrollView(
              child: Container(
          margin: EdgeInsets.all(20.0),
          child: Form(
            key: idForm,
            child: Column(
              children: <Widget>[
                _crearInputNombre(),
                _crearInputDescripcion(),
                _crearBotonAgregar(context) 
                
                

              ],
            ),
          ),
        ),
      ),
      
    );
  }

  _crearInputNombre(){
    return 
                TextFormField(
                  initialValue: tarea['nombre'],
                  onSaved: (valor){
                    nuevaTarea['nombre']=valor;
                  },
                  decoration: InputDecoration(
                    hintText: "Nombre de la tarea"
                  ),
                );
  }

  _crearInputDescripcion(){
    return Container(
                  margin: EdgeInsets.only(
                    top: 20.0
                  ),
                
                child: TextFormField(
                  initialValue: tarea['descripcion'],
                  onSaved: (valor){
                    nuevaTarea['descripcion']=valor;
                  },
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: "Descripcion de la tarea"
                  ),
                ),
                );
  }
  _crearBotonAgregar(BuildContext context){
    return Container(
                  margin: EdgeInsets.only(
                    top:20.0
                  ),
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    onPressed: (){
                      idForm.currentState.save();
                      nuevaTarea['estado']=false;

                      TareasProvider().agregarTarea(nuevaTarea);

                      Navigator.pop(context);

                    },
                    child: Text("crear tarea"),
                  ),
                );
  }
}