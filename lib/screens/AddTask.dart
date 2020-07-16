import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:dothelist/modal/tasks.dart';
import 'package:dothelist/constants.dart';

class AddTask extends StatefulWidget {
  final Function addTask;
  AddTask(this.addTask);

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  String newTasktitle;
  TextEditingController taskFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      decoration: kUpperShadowDecorated,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ListTile(
            title: Text('Add Tasks To do', style: kSubTitle),
            trailing: Icon(
              Icons.playlist_add,
              size: 50,
            ),
          ),
          TextField(
            keyboardType: TextInputType.text,
            autofocus: true,
            textCapitalization: TextCapitalization.sentences,
            controller: taskFieldController,
            decoration: kInputDecoration,
            onChanged: (value) {
              if (value != null){
                newTasktitle = value;
              }
            },
          ),
          SizedBox(height: 20),
          MaterialButton(
            height: 50,
            elevation: 10,
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            splashColor: Colors.orange,
            onPressed: () {
              widget.addTask(newTask: newTasktitle);
              taskFieldController.clear();
            },
            child: Text(
              'Add',
              style: kSubTitle,
            ),
            color: Colors.yellow,
          )
        ],
      ),
    );
  }
}
