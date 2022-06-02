import 'package:get/get.dart';
import '../models/task.dart';

class TaskController extends GetxController {
  final taskList = <Task>[].obs;

  void addTask(String name) {
    taskList.add(Task(name: name));
  }

  void deleteTask(Task task) {
    taskList.remove(task);
  }

  void updateTask(Task task) {
    task.done();
    taskList.refresh();
  }
}
