import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/colors.dart';
import 'package:to_do_app/todo.dart';
import 'package:to_do_app/todo_model.dart';

class home extends StatefulWidget {
   home({super.key,});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final todolist = todo.todoList();
  List<todo> foundtodo = [];
  final _todoController = TextEditingController();


  @override
  void initState() {
    foundtodo = todolist;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Twhite,
      appBar: AppBar(
        backgroundColor: Twhite,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.menu,color: Tblack,size: 30,),
            Container(
              height: 50,
              width : 50,
              child: ClipRRect(borderRadius: BorderRadius.circular(40),child: Icon(Icons.person),)
            )
          ],
        ),

      ),
      body:Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Container(

                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),

                  ),
                  child: TextField(
                    onChanged: (value) => _runFilter(value),
                    decoration: InputDecoration(
                      contentPadding:  EdgeInsets.all(0),
                      prefixIcon: Icon(
                          Icons.search,
                          color: Tblack,
                          size :20

                      ),
                      prefixIconConstraints: BoxConstraints(
                        maxHeight: 20,
                        maxWidth: 25,
                      ),
                      border: InputBorder.none,
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Tgrey),


                    ),
                  ),
                ),

                Expanded(child: ListView(
                  children: [
                    Container(

                      margin: EdgeInsets.only(top : 50,bottom:20),
                      child: Text("All Task",style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),),

                    ),
                    for( todo s in foundtodo)
                      todo1(m: s,onToDoChanged: _handleToDoChange,onDeleteItem: _ondeleteid,),





                  ],
                ))

              ],
            ),
          ),
          Align(
            alignment:Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(child: Container(
                    margin: EdgeInsets.only(bottom: 20,right:20 ,left:20),
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),

                    decoration: BoxDecoration(
                      color: Colors.white,boxShadow:const [BoxShadow(color :Colors.grey,offset: Offset(0.0, 0.0),spreadRadius: 0.0,blurRadius: 10.0)],
                      borderRadius: BorderRadius.circular(10),

                    ),
                    child: TextField(
                      controller: _todoController,
                      decoration:  InputDecoration( hintText: "Add new task",border:InputBorder.none),),
                  )),
                  Container(
                    margin: EdgeInsets.only(bottom: 20,right: 20),
                    child: ElevatedButton(onPressed: () { _addtoitem(_todoController.text);}, child: Text('+',style: TextStyle(fontSize: 40),)),

                  )
                ],
              ),
          )
        ],
      )
    );
  }


  //function to change state
  void _handleToDoChange(todo m)
  {
    setState(() {
      m.isDone = !m.isDone;
    });
  }

  //function to delete items
  void _ondeleteid(String m)
  {
    setState(() {
      todolist.removeWhere((item) => item.id == m);
    });
  }

  void _addtoitem(String m)
  {
    setState(() {
      todolist.add(todo(id: DateTime.now().millisecondsSinceEpoch.toString(),todoText : m));
    });

    _todoController.clear();
  }

  void _runFilter(String keyword)
  {
    List<todo> results = [];
    if(keyword.isEmpty)
      {
        results = todolist;
      }else
        {
          results = todolist.where((item) => item.todoText!.toLowerCase().contains(keyword.toLowerCase())).toList();
        }

    setState(() {
      foundtodo = results;
    });
  }
}

