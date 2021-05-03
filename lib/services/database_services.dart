import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mrplan/src/models/todo.dart';
import 'package:mrplan/src/pages/graficas_circulares_page.dart';



class DatabaseService{
  CollectionReference todosCollection = 
  FirebaseFirestore.instance.collection("Todos");
  CollectionReference percentcollection = 
  FirebaseFirestore.instance.collection("Percent");




  Future createNewTodo(String title) async{
    await todosCollection.add({
      "title":title,
      "isComplet": false,
      "ivalue": 10,
    });

    await percentcollection.doc('percentage').update({

"value": porcentaje
    });
  }
    
    
  Future completTask(uid) async {
    await todosCollection.doc(uid).update({
      "isComplet": true
            });
    percentcollection.doc('percentage').update({

"value": porcentaje -= 10
    });

  }
  Future uncompletTask(uid) async {
    await todosCollection.doc(uid).update({"isComplet": false});

    await percentcollection.doc('percentage').update({

"value": porcentaje += 10
    });
  }


  Future removeTodo(uid) async {
  await todosCollection.doc(uid).delete();
  await percentcollection.doc('percentage').update({

"value": porcentaje -= 10
    });
  
  }

  List<Todo> todoFromFirestore(QuerySnapshot snapshot){
    if (snapshot != null){
      return snapshot.docs.map((e){
        return Todo(
          isComplet: e.data()["isComplet"],
          title: e.data()["title"],
          uid: e.id,
          ivalue: e.data()["ivalue"]
        );
      }).toList();
    }else{
      return null;
    }

  }

   percentagevalue(QuerySnapshot snapshot){
    if (snapshot != null){
      return snapshot.docs.map((e){
        return 
        Percentage(
          percentage: e.data()['value']
        );

      });
    }else{
      return null;
    }

  }

  Stream<List<Todo>> listTodos(){
    


    
   return todosCollection.snapshots().map(todoFromFirestore);
   
  }

  
}


