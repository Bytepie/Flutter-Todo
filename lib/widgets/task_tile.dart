import 'package:dothelist/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String tileTitle;
  final bool isChecked;
  final Function checkBoxCheck;

  TaskTile({this.tileTitle, this.isChecked, this.checkBoxCheck});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      padding: EdgeInsets.all(5),
      decoration: kShadowDecorated,
      child: ListTile(
        title: Text(
          tileTitle,
          style: isChecked ? kSubTitleCanceled : kSubTitle,
        ),
        trailing: TaskCheckBox(
          checkValue: isChecked,
          checkBoxStatus: checkBoxCheck,
        ),
      ),
    );
  }
}

class TaskCheckBox extends StatelessWidget {
  final bool checkValue;
  final Function checkBoxStatus;

  TaskCheckBox({this.checkValue, this.checkBoxStatus});

  Widget build(BuildContext context) {
    return Checkbox(
      checkColor: Colors.white,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      activeColor: Colors.blueAccent,
      value: checkValue,
      onChanged: (value) {
        checkBoxStatus();
      },
    );
  }
}
