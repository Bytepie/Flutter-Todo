class Tasks {
  String name;
  bool isDone;
//  static int myTotalTasks =0;

  Tasks({this.name,this.isDone = false}){
//    myTotalTasks++;
  }

  toggleIsDone (){
    isDone = !isDone;
  }

}