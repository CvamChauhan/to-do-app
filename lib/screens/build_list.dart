import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/screens/task_data.dart';

class BuildListView extends StatelessWidget {
  const BuildListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskdata, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            onLongPress: () {
              taskdata.removeTask(taskdata.tasks[index]);
            },
            title: Text(
              taskdata.tasks[index].note,
              style: TextStyle(
                  decoration: taskdata.tasks[index].isDone
                      ? TextDecoration.lineThrough
                      : null),
            ),
            trailing: Checkbox(
              activeColor: Colors.black,
              value: taskdata.tasks[index].isDone,
              onChanged: (value) {
                taskdata.updateTask(taskdata.tasks[index]);
              },
            ),
          );
        },
        itemCount: taskdata.tasks.length,
      );
    });
  }
}
