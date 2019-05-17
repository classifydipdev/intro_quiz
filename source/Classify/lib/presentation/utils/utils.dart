import 'package:classify/presentation/entities/subject.dart';
import 'package:flutter/material.dart';

class Utils {

  static get customSubjectList{
    return [
      Subject("1", "History", Colors.greenAccent[400], Colors.greenAccent[400]),
      Subject("2", "English", Colors.deepOrange[600], Colors.deepOrange[600]),
      Subject("3", "Math", Colors.yellow[700], Colors.yellow[700]),
      Subject("4", "PE", Colors.purple[600], Colors.purple[600]),
      Subject("5", "Biology", Colors.red[600], Colors.red[600]),
      Subject("6", "Chemistry", Colors.teal[600], Colors.teal[600]),
      Subject("7", "Computer Science", Colors.green[600], Colors.green[600]),
      Subject("8", "Philosophy", Colors.blue[600], Colors.blue[600]),
      Subject("9", "Economics", Colors.pink[600], Colors.pink[600]),
      Subject("10", "DT", Colors.lightBlue[300], Colors.lightBlue[300]),
      Subject("11", "Italian", Colors.pink[300], Colors.pink[300]),
      Subject("12", "Latin", Colors.lime[600], Colors.lime[600]),
      Subject("13", "Geography", Colors.redAccent, Colors.redAccent),
      Subject("14", "Spanish", Colors.orange[600], Colors.orange[600]),
      Subject("15", "German", Colors.indigo[400], Colors.indigo[400]),
      Subject("16", "Physics", Colors.black, Colors.black),
      // Subject("17", "Drama", Colors.cyan[300], Colors.cyan[600]),
    ];
  }
}
