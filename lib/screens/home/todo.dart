import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List todos = <String>[];
  String todoTile="";
  createTodos()
  {
    DocumentReference documentReferencence=FirebaseFirestore.instance.collection("MyTodos").doc(todoTile);
    Map<String,String> todos={
      "todoTile":todoTile
    };
    documentReferencence.set(todos).whenComplete(() {
      print("input created");
  });
  }
  deleteTodos(item)
  {
    DocumentReference documentReferencence=FirebaseFirestore.instance.collection("MyTodos").doc(item);
    documentReferencence.delete().whenComplete(() {
      print("deleted");}
    );
  }
  @override
  void initState(){
    super.initState();

  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text('To-Do List'),
        backgroundColor: Color.fromRGBO(92, 104, 211, .5),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context,builder: ( BuildContext context){
            return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                 title: Text("Add Task"),
              content: TextField(
                onChanged: (String value)
                {
                  todoTile=value;
                },
              ),
              actions:<Widget> [
                FlatButton(onPressed: () {
                  createTodos();
                  Navigator.of(context).pop();
                }, child:Text("Add"))
              ],
            );
    });
    },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: StreamBuilder(stream: FirebaseFirestore.instance.collection("MyTodos").snapshots(), builder: (context, AsyncSnapshot snapshots)
      {
         return ListView.builder(
          itemCount: snapshots.data?.docs.length,
          itemBuilder: (context, index) {
            DocumentSnapshot documentSnapshot=snapshots.data.docs[index];
            return Dismissible(
              onDismissed: (direction) {
                deleteTodos(documentSnapshot["todoTile"]);
              },
                key: Key(documentSnapshot["todoTile"]),
                child: Card(
                  elevation: 5,
                  margin: EdgeInsets.all(5),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  child: ListTile(
                    title: Text(documentSnapshot["todoTile"]),
                    trailing: IconButton(
                      icon:Icon(
                      Icons.delete,
                      color: Colors.blue,
                    ),
                      onPressed: () {
                       deleteTodos(documentSnapshot["todoTile"]);
                      }
                  ),
                )
                  )
                  );
          });
      })      );
  }
}
