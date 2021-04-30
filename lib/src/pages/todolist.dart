import 'package:flutter/material.dart';
import 'package:mrplan/loading.dart';
import 'package:mrplan/services/database_services.dart';
import 'package:mrplan/src/models/todo.dart';
import 'package:mrplan/src/widgets/appbar.dart';



bool isComplet = false;
      TextEditingController todoTitleController = TextEditingController();
class Todolist extends StatefulWidget {

  @override
  _TodolistState createState() => _TodolistState();
}

class _TodolistState extends State<Todolist> {

double porcentajeq;

      bool isComplet = false;

      TextEditingController todoTitleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
setState(() {
      
    });
    
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<List<Todo>>(
          stream: DatabaseService().listTodos(),
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return Loading();
               
            }
            
           
            
              List<Todo> todos = snapshot.data;
               
if(todos.length == 0){
              return Center(child: Text('No hay tareas agregadas!'));
               
            }

            return Padding(
              padding:EdgeInsets.all(0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Expanded(
                    child: ListView.separated(
                      
                      separatorBuilder: (context, index)=> Divider(color: Colors.white),
                      shrinkWrap: true,
                      itemCount: todos.length,
                      itemBuilder: (context, index){
                      return Dismissible(
                        key: UniqueKey(),
                        background: Container(padding: EdgeInsets.only(left: 20),
                        alignment: Alignment.centerLeft,
                        child: Icon(Icons.delete),
                        color: Colors.red),
                        onDismissed: (direction) async {
                          await DatabaseService().removeTodo(todos[index].uid);
                        quitar(context);
                        },
                        
                        child: ListTile(
                          onTap: (){
                            isComplet = !isComplet;
if(isComplet)
                            DatabaseService().completTask(todos[index].uid);
             else DatabaseService().uncompletTask(todos[index].uid);               
                              
                            },

                          
                          leading: Container(
                            padding: EdgeInsets.all(2),
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              shape: BoxShape.circle
                            ),
                            child: todos[index].isComplet
                            ? Icon(
                              Icons.check, 
                              color: Colors.white,)
                              : Container(),
                          ),
                          title: Text(
                            todos[index].title,
                             
                          style: todos[index].isComplet 
                          ? TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Colors.red,
                            )
                          : TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            
                            decoration: null
                            ) 
                          ),

                        ),
                      );
                    }
                    ),
                  )
                ],
              ),
            );
          }
          
        )
        
      ),
    

          );
        }
      }
    
  
class Appbar extends StatefulWidget {
  @override
  _AppbarState createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  @override
  Widget build(BuildContext context) {
    bool isbuttondisabled = false;
    setState(() {
      
    });
    return StreamBuilder<Object>(
      stream: null,
      builder: (context, snapshot) {
        return Container(
          
          alignment: Alignment.bottomCenter,
          child: BottomAppBar(
            elevation: 0,
            child: Container(
              
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color:Colors.grey[100],
                      borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(5.0),
              )
            ),
                    
                    
                    height: MediaQuery.of(context).size.height,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                     width: MediaQuery.of(context).size.width * 0.835,
                     child: Center(
                       child: TextFormField(
                         controller: todoTitleController,
                         autofocus: true,
                         decoration: InputDecoration(
                           hintStyle: TextStyle(color: Colors.blue[800]),
                         hintText: "Inserte una tarea...",
                         border: InputBorder.none
                         ),
                         ),
                     ),
                       ),

                       TextButton(
                         
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                            child: Center(child: Icon(Icons.add))),
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                topRight: const Radius.circular(10.0),
                
                
              )
                            ),
                            backgroundColor: Theme.of(context).primaryColor
                            ),
                            onPressed: isbuttondisabled ? null : ()async {
                              
                              if(todoTitleController.text.isNotEmpty){
                                await DatabaseService().createNewTodo(todoTitleController.text.trim());
                                FocusScope.of(context).unfocus();
                        anadir(context);
                        todoTitleController.clear();
                          isComplet = !isComplet;



                            }

                          
                        
                      }
                       
                       
                       )
                                  ],
                                ),
            )
                              )
                              );
      }
    );
  }


}
  

