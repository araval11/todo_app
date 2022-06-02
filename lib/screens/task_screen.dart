import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/task_controller.dart';
import '../widgets/task_tile.dart';
import 'add_task.dart';

class TasksScreen extends StatelessWidget {
  final TaskController controller = Get.put(TaskController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddTaskScreen()),
            ),
          );
        },
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
                top: 60.0, right: 30.0, left: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  child: Icon(
                    Icons.list,
                    size: 30.0,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Todoey',
                  style: TextStyle(
                    fontSize: 50.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 5.0),
                GetX<TaskController>(
                  builder: (controller) {
                    return Text(
                      '${controller.taskList.length} Tasks',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            flex: 9,
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0),
                  ),
                ),
                child: Obx(
                  () => (controller.taskList.isEmpty)
                      ? Center(
                          child: Text(
                            'Press " + " to add your first task',
                            style: TextStyle(fontSize: 20.0),
                          ),
                        )
                      : ListView.builder(
                          itemBuilder: (context, index) {
                            return TaskTile(
                              isChecked: controller.taskList[index].isDone,
                              Tasktitle: controller.taskList[index].name,
                              checkboxcallback: (checkboxstate) {
                                controller
                                    .updateTask(controller.taskList[index]);
                              },
                              longpresscallback: () {
                                controller
                                    .deleteTask(controller.taskList[index]);
                              },
                            );
                          },
                          itemCount: controller.taskList.length),
                )),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 100,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
