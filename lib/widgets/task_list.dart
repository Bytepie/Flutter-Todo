import 'package:dothelist/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dothelist/widgets/task_tile.dart';
import 'package:dothelist/modal/tasks.dart';
//import 'package:show_up_animation/show_up_animation.dart';

class TaskList extends StatefulWidget {
  List<Tasks> tasksList;
  final Function removeCallBack;
  final Function taskInsertion;

  TaskList({this.tasksList, this.removeCallBack, this.taskInsertion});

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  String currentTask;

  Widget slideMyTask() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            child: Icon(
              Icons.delete_forever,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  void dismissAtSnackBar(int index) {
//    widget.tasksList.removeAt(index);
    widget.removeCallBack(index);
    Scaffold.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 1),
      content: Text(
        'Task \'$currentTask\', deleted',
        style: kSubTitle,
      ),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          widget.taskInsertion(newTask: currentTask, index: index);
        },
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: ScrollPhysics(),
      padding: EdgeInsets.all(10),
      itemBuilder: (context, index) {
        return Dismissible(
          confirmDismiss: (direction) async {
            currentTask = widget.tasksList[index].name;
            final bool result = await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    contentPadding: EdgeInsets.all(20),
                    backgroundColor: Colors.white,
                    shape: kRoundRectangle,
                    content: Text(
                        'Are you sure you want to delete Task \'$currentTask\''),
                    actions: <Widget>[
                      RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        elevation: 10,
                        color: Colors.blueAccent.shade700,
                        child: Text('No'),
                        shape: kRoundRectangle,
                      ),
                      RaisedButton(
                        onPressed: () {
                          setState(() {
                            Navigator.of(context).pop();
                            dismissAtSnackBar(index);
                          });
                        },
                        elevation: 10,
                        color: Colors.redAccent.shade200,
                        child: Text('Delete'),
                        shape: kRoundRectangle,
                      )
                    ],
                  );
                });
            return result;
          },
//          onDismissed: (direction) {
//
//          },
          movementDuration: Duration(seconds: 2),
          key: UniqueKey(),
          child: TaskTile(
            tileTitle: widget.tasksList[index].name,
            isChecked: widget.tasksList[index].isDone,
            checkBoxCheck: () {
              setState(() {
                widget.tasksList[index].toggleIsDone();
              });
            },
          ),
        );
      },
      itemCount: widget.tasksList.length,
    );
//      ShowUpList(
//      curve: Curves.bounceIn,
//      direction: Direction.vertical,
//      animationDuration: Duration(milliseconds: 1000),
//      delayBetween: Duration(milliseconds: 100),
//      offset: 1,
//      children: <Widget>[
//
//      ],
//    );
  }
}
