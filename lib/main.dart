import 'package:flutter/material.dart';
import 'package:dothelist/screens/TaskScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
          unselectedWidgetColor: Colors.blueAccent.shade700,
          snackBarTheme: SnackBarThemeData(
            elevation: 10,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
          )),
      debugShowCheckedModeBanner: false,
      initialRoute: TaskScreen.id,
      routes: {
        TaskScreen.id: (context) => TaskScreen(),
      },
    );
  }
}
