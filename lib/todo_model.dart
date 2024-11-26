class todo
{
  String? id;
  String? todoText;
  bool isDone;

  todo({
    required this.id,
    required this.todoText,
    this.isDone = false

});

  static List<todo> todoList() {
    return [
      todo(id: '01', todoText: 'Morning Exercise',isDone : true),
      todo(id: '02', todoText: 'Check Email',),
      todo(id: '03', todoText: 'Team Meeting',isDone: true),
      todo(id: '04', todoText: 'Dinner',),

    ];
  }
}