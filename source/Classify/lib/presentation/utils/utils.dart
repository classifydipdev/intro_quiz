import 'package:flutter/material.dart';

class Utils {
  static List<ButtonStyle> subjectListButtons = [
    ButtonStyle(
        "Computing",
        LinearGradient(
            colors: [Colors.greenAccent[400], Colors.greenAccent[400]]),
        "1"),
    ButtonStyle(
        "Art",
        LinearGradient(
            colors: [Colors.deepOrange[600], Colors.deepOrange[600]]),
        "2"),
    ButtonStyle("History",
        LinearGradient(colors: [Colors.yellow[700], Colors.yellow[700]]), "3"),
    ButtonStyle("English",
        LinearGradient(colors: [Colors.purple[600], Colors.purple[600]]), "4"),
    ButtonStyle("Maths",
        LinearGradient(colors: [Colors.red[600], Colors.red[600]]), "5"),
    ButtonStyle("PE",
        LinearGradient(colors: [Colors.teal[600], Colors.teal[600]]), "6"),
    ButtonStyle("Biology",
        LinearGradient(colors: [Colors.green[600], Colors.green[600]]), "7"),
    ButtonStyle("Chemistry",
        LinearGradient(colors: [Colors.blue[600], Colors.blue[600]]), "8"),
    ButtonStyle("Philosophy",
        LinearGradient(colors: [Colors.pink[600], Colors.pink[600]]), "9"),
    ButtonStyle(
        "Music",
        LinearGradient(colors: [Colors.lightBlue[300], Colors.lightBlue[300]]),
        "10"),
    ButtonStyle("DT",
        LinearGradient(colors: [Colors.pink[300], Colors.pink[300]]), "11"),
    ButtonStyle("Geography",
        LinearGradient(colors: [Colors.lime[600], Colors.lime[600]]), "12"),
    ButtonStyle("French",
        LinearGradient(colors: [Colors.redAccent, Colors.redAccent]), "13"),
    ButtonStyle("Latin",
        LinearGradient(colors: [Colors.orange[600], Colors.orange[600]]), "14"),
    ButtonStyle("Spanish",
        LinearGradient(colors: [Colors.indigo[400], Colors.indigo[400]]), "15"),
    ButtonStyle(
        "German", LinearGradient(colors: [Colors.black, Colors.black]), "16"),
    ButtonStyle(
        "Physics",
        LinearGradient(
          colors: [
            Colors.grey[600],
            Colors.grey[600],
            Colors.grey[700],
            Colors.grey[700],
          ],
          stops: [0.25, 0.50, 0.75, 1],
        ),
        "17"),
    ButtonStyle(
        "Drama",
        LinearGradient(
          colors: [
            Colors.cyan[300],
            Colors.cyan[400],
            Colors.cyan[500],
            Colors.cyan[600],
          ],
          stops: [0.25, 0.50, 0.75, 1],
        ),
        "18"),
  ];
}

class ButtonStyle {
  String text;
  Gradient gradient;
  String value;

  ButtonStyle(this.text, this.gradient, this.value);
}
