import 'dart:math';
import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:mrplan/src/pages/graficas_circulares_page.dart';
import 'package:mrplan/src/pages/todolist.dart';
import 'package:mrplan/src/widgets/appbar.dart';


class RadialProgress extends StatefulWidget {

  final porcentaje;
  final Color colorprimario;
  final Color colorsecundario;
  final double grosorsecundario;
  final double grosorprimario;

  RadialProgress({
  @required this.porcentaje, 
  this.colorprimario = Colors.blue,
  this.colorsecundario = Colors.grey,
  this.grosorsecundario = 4, 
  this.grosorprimario = 10
  });

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin{

  AnimationController controller;
  double porcentajeanterior;
  

  @override
  void initState() {
    porcentajeanterior = porcentaje;

    controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
    
  }
  @override
  Widget build(BuildContext context) {
    setState(() {
      
    });
    controller.forward(from: 0.0);






    final diferenciaAnimar = porcentaje - porcentajeanterior;
    porcentajeanterior = porcentaje;
    



    return Stack(
      children: [         
        
        Container(
      padding: EdgeInsets.all(5),
            width: 150,
            height: 150,
            child: Center(child: Container(alignment: Alignment.center, width: 40,
            height: 25,
              child: Countup(
              begin: (porcentaje - diferenciaAnimar),
              end: porcentaje,
              duration: Duration(milliseconds: 200),
              separator: ',',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            
              )
              
              )
              ),


      AnimatedBuilder(
        
        animation: controller,
        builder: (BuildContext context, Widget child) {
          return Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MiRadialProgress(
              (porcentaje - diferenciaAnimar) + (diferenciaAnimar * controller.value),
              widget.colorprimario,
              widget.colorsecundario,
              widget.grosorsecundario,
              widget.grosorprimario)
            ),
          // child: Text('${widget.porcentaje}'),
        );
        
         
        },
      ),
        
      ],
    );
  }


}



class _MiRadialProgress extends CustomPainter{

    final porcentaje;
    final colorprimario;
    final colorsecundario;
    final double grosorsecundario;
    final double grosorprimario;

  _MiRadialProgress(
    
    this.porcentaje, 
    this.colorprimario,
    this.colorsecundario,
    this.grosorsecundario, 
    this.grosorprimario
    
    );
  @override
  void paint(Canvas canvas, Size size) {


    // Circulo completado
      final paint = new Paint()
      ..strokeWidth = grosorsecundario
      ..color = colorsecundario
      ..style = PaintingStyle.stroke;

      final center = new Offset(size.width * 0.5, size.height * 0.5);
      final radio = min(size.width * 0.5, size.height * 0.5);

      canvas.drawCircle(center, radio, paint);

      //arco 
      final paintArco = new Paint()
      ..strokeWidth = grosorprimario
      ..color = colorprimario
      ..style = PaintingStyle.stroke;


      //parte que se debe ir llenando
      double arcAngle = 2* pi * (porcentaje / 100);
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radio), 
        -pi / 2 , 
        arcAngle, 
        false, 
        paintArco);
    }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate)=> true;

}

class Barradetareas extends StatefulWidget {
  @override
  _BarradetareasState createState() => _BarradetareasState();
}

class _BarradetareasState extends State<Barradetareas> {
TextEditingController todoTitleController = TextEditingController();
  


  @override
  Widget build(BuildContext context) {
        setState(() {
      
    });
    final _screensize = MediaQuery.of(context).size;
    return 
    Container(alignment: Alignment.bottomCenter,
                        child: BottomAppBar(
                          elevation: 0,
                          child: Row(
                            children: [
                              Container(
                                
                              padding: EdgeInsets.all(7.0),
                                height: _screensize.height * 0.065,
                                width: _screensize.height * 0.41,
                                child: TextField(
                                  textAlignVertical: TextAlignVertical(y: 1),
                                  
            decoration: InputDecoration(
              hintText: 'Nueva Tarea',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
                ),
          ),
                              )
                            ,
                            
                              ElevatedButton(onPressed: () => anadir(context),
        
        style: ElevatedButton.styleFrom(primary: Colors.blue[500]),
          child: Icon(Icons.add, color: Colors.black,))
                            ],
                          )
                          )
    );
  }
}
  // BarraInf(screensize:MediaQuery.of(context).size);

  class Tareas extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      final _screensize = MediaQuery.of(context).size;
      return Container(
        alignment: Alignment.bottomCenter, child: Container(
    height: _screensize.height * 0.65, 
    width: double.infinity,
    child: Stack(
      children: [
        Todolist(),
        Appbar()
      ],
    ),)
    );
    }
  }

//   void anadir(context){
//     if (todoTitleController.text.isNotEmpty){
// print(todoTitleController.text);

//   }
//      porcentaje += 10;
//                   if(porcentaje > 100){
//                     porcentaje = 0;}
//     // ignore: missing_required_param
                
//          }