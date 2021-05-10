import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mrplan/loading.dart';
import 'package:mrplan/screens/calendar_page.dart';


import 'package:mrplan/src/bloc/provider.dart';
import 'package:mrplan/src/pages/graficas_circulares_page.dart';
import 'package:mrplan/src/pages/labs/login_page.dart';
import 'package:mrplan/src/pages/registro_page.dart';
import 'package:mrplan/src/pages/todolist.dart';
import 'package:mrplan/src/preferencias/preferencias_usuario.dart';
 
void main() async {
WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();

  runApp(MyApp());

}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    

    
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if(snapshot.hasError){
          return Scaffold(
            body: Center(child: Text(snapshot.error.toString()),
            )
          );
        }
        if(snapshot.connectionState == ConnectionState.waiting){
          return Loading();
        }
        return Provider(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Material App',
            initialRoute: 'calendar',
            routes: {
              'login'    : ( BuildContext context ) => LoginPage(),
              'registro' : ( BuildContext context ) => RegistroPage(),
              'graficas' : ( BuildContext context ) => GraficasCirculares(),
              'todolist' : ( BuildContext context ) => Todolist(),
              'calendar' : (BuildContext context ) => CalendarPage()
            },
            theme: ThemeData(
              primaryColor: Colors.blue[800],
            ),
          ),
        );
      }
    );
      
  }
}