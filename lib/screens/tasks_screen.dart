import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do/screens/add_task_screen.dart';
import 'package:to_do/screens/build_list.dart';
import 'package:provider/provider.dart';
import 'package:to_do/screens/task_data.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade600,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow.shade600,
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              backgroundColor: Color(0xff757575),
              context: context,
              builder: (context) => AddTask());
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 80, left: 40, bottom: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 40,
                  child: Icon(
                    Icons.list,
                    color: Colors.yellow.shade600,
                    size: 50,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Notes',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
                ),
                Text(
                  '${Provider.of<TaskData>(context).tasks.length} tasks',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
                padding: EdgeInsets.only(left: 30, right: 40, bottom: 30),
                height: 300,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: BuildListView()),
          ),
        ],
      ),
    );
  }
}
