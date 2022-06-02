import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String Tasktitle;
  final Function(bool?)? checkboxcallback;
  final VoidCallback longpresscallback;

  TaskTile({
    required this.isChecked,
    required this.Tasktitle,
    required this.checkboxcallback,
    required this.longpresscallback,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longpresscallback,
      title: Text(
        Tasktitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxcallback,
      ),
    );
  }
}
