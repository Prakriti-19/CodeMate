// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:task/models/notes.dart';
// import 'package:task/provider/todos.dart';
//
// import '../../widget/todo_form_widge.dart';
//
//
// class EditTodoPage extends StatefulWidget {
//   final Todo todo;
//
//   const EditTodoPage({required Key key, required this.todo}) : super(key: key);
//
//   @override
//   _EditTodoPageState createState() => _EditTodoPageState();
// }
//
// class _EditTodoPageState extends State<EditTodoPage> {
//   final _formKey = GlobalKey<FormState>();
//
//   late String title;
//   late String description;
//
//   @override
//   void initState() {
//     super.initState();
//
//     title = widget.todo.title;
//     description = widget.todo.description;
//   }
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     appBar: AppBar(
//       title: Text('Edit Todo'),
//       actions: [
//         IconButton(
//           icon: Icon(Icons.delete),
//           onPressed: () {
//             final provider =
//             Provider.of<TodosProvider>(context, listen: false);
//             provider.removeTodo(widget.todo);
//
//             Navigator.of(context).pop();
//           },
//         )
//       ],
//     ),
//     body: Padding(
//       padding: EdgeInsets.all(16),
//       child: Form(
//         key: _formKey,
//         child: TodoFormWidget(
//           title: title,
//           description: description,
//           onChangedTitle: (title) => setState(() => this.title = title),
//           onChangedDescription: (description) =>
//               setState(() => this.description = description),
//           onSavedTodo: saveTodo, key: null,
//         ),
//       ),
//     ),
//   );
//
//   void saveTodo() {
//     final isValid = _formKey.currentState?.validate();
//
//     if (!isValid) {
//       return;
//     } else {
//       final provider = Provider.of<TodosProvider>(context, listen: false);
//
//       provider.updateTodo(widget.todo, title, description);
//
//       Navigator.of(context).pop();
//     }
//   }
// }