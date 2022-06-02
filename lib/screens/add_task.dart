import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_assignment_getx/controllers/task_controller.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TaskController controller = Get.put(TaskController());

  final textcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    textcontroller.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    textcontroller.dispose();
    super.dispose();
  }

  void _printLatestValue() {}
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.w500),
            ),
            TextField(
              textInputAction: TextInputAction.go,
              controller: textcontroller,
              autofocus: true,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.lightBlueAccent),
              onPressed: () {
                controller.addTask(textcontroller.text);
                Get.back();
              },
              child: Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            )),
      ),
    );
  }
}
