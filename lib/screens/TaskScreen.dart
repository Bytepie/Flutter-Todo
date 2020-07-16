import 'package:dothelist/widgets/task_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dothelist/constants.dart';
import 'package:flutter/rendering.dart';
import 'package:dothelist/modal/tasks.dart';
import 'package:dothelist/screens/AddTask.dart';

class TaskScreen extends StatefulWidget {
  static const String id = '/';

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<Tasks> tasksList = [];
  int tasksLeft;

  @override
  void initState() {
    super.initState();
//    tasksDone();
  }

  void tasksDone() async {
    int tasksDoneChecking = 0;
    int tasksListLength = tasksList.length;
    print(tasksListLength);
    if (tasksListLength > 0) {
      for (int i = 0; i <= tasksListLength; i++) {
        if (tasksList[i].isDone == false) {
          tasksDoneChecking++;
        }
      }
    }
    setState(() {
//      tasksLeft = tasksListLength > 0 ? taskDoneChecking : 0;
      tasksLeft = tasksDoneChecking;
    });
  }

  addTask({@required String newTask, int index}) {
    setState(() {
      if (index == null) {
        tasksList.add(Tasks(name: newTask));
      } else {
        tasksList.insert(index, Tasks(name: newTask));
      }
//      index == null
//          ? tasksList.add(Tasks(name: newTask)),
//          : tasksList.insert(index, Tasks(name: newTask));
//
    });
//    tasksDone();
  }

  removeTask(index) {
    setState(() {
      tasksList.removeAt(index);
    });
//    tasksDone();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        splashColor: Colors.deepOrange,
        elevation: 10,
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(30)),
        backgroundColor: Colors.blueAccent.shade700,
        child: Icon(
          Icons.add,
          size: 40,
        ),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return AddTask(addTask);
              },
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))));
          print('hello');
        },
      ),
      backgroundColor: Colors.yellow.shade500,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(30, 60, 30, 10),
            child: Column(
//                mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.blueAccent.shade700,
                  radius: 40,
                  child: Icon(
                    Icons.format_list_bulleted,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
//                  textBaseline: TextBaseline.alphabetic,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Todo', style: kAppTitle),
                    Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(blurRadius: 10, color: Colors.black12)
                          ],
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child:
                            Text(' ${tasksList.length} Tasks Left ', style: kSubTitle)),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
//              margin: EdgeInsets.all(10),
              padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
              decoration: kUpperShadowDecorated,
              child: tasksList.length > 0
                  ? TaskList(
                      tasksList: tasksList,
                      taskInsertion: addTask,
                      removeCallBack: removeTask,
                    )
                  : Center(
                      child: Text(
                      'You don\'t have any Tasks yet!',
                      style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                    )),
            ),
          )
        ],
      ),
    );
  }
}
