import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/colors.dart';
import 'package:to_do_app/todo_model.dart';

class todo1 extends StatelessWidget {
  final todo m;
  final onToDoChanged;
  final onDeleteItem;


  const todo1({super.key, required this.m, this.onToDoChanged, this.onDeleteItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
      onTap: () {
        onToDoChanged(m);
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),

      ),
      tileColor: Colors.white ,
      leading: Icon(m.isDone ? Icons.check_box : Icons.check_box_outline_blank ,color: Tblue),
      title: Text(m.todoText!,style: TextStyle(fontSize: 16,color : Tblack,decoration: m.isDone? TextDecoration.lineThrough : null,),),
      trailing: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          color: Tred,
          borderRadius: BorderRadius.circular(20),

        ),
          child : IconButton(onPressed:() {onDeleteItem(m.id);}, icon:Icon(Icons.delete),iconSize: 18,color: Twhite,)
      ),
    ),);
  }

  static todoList() {}
}
