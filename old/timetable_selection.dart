/*
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart';
import 'package:intro_quiz/main.dart';

class TimetableSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: SubjectSelectState(),

    );
  }
}

class SubjectSelectEnglish extends StatefulWidget {
  @override
  SubjectSelectEnglishState createState() => new SubjectSelectEnglishState();
}

class SubjectSelectEnglishState extends State<SubjectSelectEnglish>{

  var thisEnglish = Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
    width: 155.0,
    height: 50.0,
    alignment: Alignment.topLeft,
    decoration:
    BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.purple[600],
          Colors.purple[700],
          Colors.purple[800],
          Colors.purple[900],
        ],
        stops: [0.25, 0.50, 0.75, 1],
      ),
      border: Border.all(
          color: Color.fromRGBO(255, 255, 255, 0.0),
          width: 3.0),
      borderRadius: BorderRadius.circular(35.0),
    ),
    child: Center(
      child:
      Text(
        'English',
        style: TextStyle(
            fontSize: 18.0,
            color: Colors.white,
            fontWeight: FontWeight.bold),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return thisEnglish;
  }

}


class SubjectSelector extends StatefulWidget {
  @override
  SubjectSelectorState createState() => new SubjectSelectorState();
}



class SubjectSelectorState extends State<SubjectSelector>{
  List<Widget> subjectWidgets = List(15);
  
  static var thisSubject = Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
    width: 155.0,
    height: 50.0,
    alignment: Alignment.center,
    child: Center(
      child: InkWell(
        child: Container(
            child: Text(
              '+',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,

              ),
            )
        ),
      ),
    ),
    decoration: BoxDecoration(
      border: Border.all(
          color: Color.fromRGBO(255, 255, 255, 3.0),
          width: 2.0),
      borderRadius: BorderRadius.circular(35.0),
    ),
  );
  static var thisEnglish = Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
    width: 155.0,
    height: 50.0,
    alignment: Alignment.topLeft,
    decoration:
    BoxDecoration(
      color: Colors.purple[600],
      border: Border.all(
          color: Color.fromRGBO(255, 255, 255, 0.0),
          width: 3.0),
      borderRadius: BorderRadius.circular(35.0),
    ),
    child: Center(
      child:
      Text(
        'English',
        style: TextStyle(
            fontSize: 18.0,
            color: Colors.white,
            fontWeight: FontWeight.bold),
      ),
    ),
  );
  @override

  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

}

class BottomSheetEnglish extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      },
      splashColor: Colors.transparent,
      child: Container(
        width: 155.0,
        height: 50.0,
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.purple[600],
              Colors.purple[700],
              Colors.purple[800],
              Colors.purple[900],
            ],
            stops: [0.25, 0.50, 0.75, 1],
          ),
          border: Border.all(color: Color.fromRGBO(255, 255, 255, 0.0), width: 3.0),
          borderRadius: BorderRadius.circular(35.0),
        ),
        child: Center(child: Text('English', style: TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold),),),
      ),
    );
  }
}


class SubjectSelectState extends StatefulWidget {
  @override
  SubjectSelectPage createState() => new SubjectSelectPage();
}

class SubjectSelectPage extends State<SubjectSelectState> {
  bool ifPressed = true;
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  var _showPersBottomSheetCallBack;
  var thisSubject = Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
    width: 155.0,
    height: 50.0,
    alignment: Alignment.center,
    child: Center(
      child: InkWell(
        child: Container(
            child: Text(
              '+',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,

              ),
            )
        ),
      ),
    ),
    decoration: BoxDecoration(
      border: Border.all(
          color: Color.fromRGBO(255, 255, 255, 1.0),
          width: 1.0),
      borderRadius: BorderRadius.circular(35.0),
    ),
  );
  var thisEnglish = Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
    width: 155.0,
    height: 50.0,
    alignment: Alignment.topLeft,
    decoration:
    BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.purple[600],
          Colors.purple[700],
          Colors.purple[800],
          Colors.purple[900],
        ],
        stops: [0.25, 0.50, 0.75, 1],
      ),
      border: Border.all(
          color: Color.fromRGBO(255, 255, 255, 0.0),
          width: 3.0),
      borderRadius: BorderRadius.circular(35.0),
    ),
    child: Center(
      child:
      Text(
        'English',
        style: TextStyle(
            fontSize: 18.0,
            color: Colors.white,
            fontWeight: FontWeight.bold),
      ),
    ),
  );
  
  
  
  


  void chooseEnglish (){
    setState((){
          SubjectSelectorState.thisSubject = SubjectSelectorState.thisEnglish;
        });
  }


  @override

  

  void initState() {
    super.initState();
    _showPersBottomSheetCallBack = _showBottomSheet;



  }

  void _showBottomSheet() {
    setState(() {
      _showPersBottomSheetCallBack = null;
    }

    );

    _scaffoldKey.currentState
        .showBottomSheet((context) {
      return new Container(
        
        height: 300.0,

        child: new Center(
            child: new Stack(
              children: <Widget>[
                Positioned(
                    left:20,
                    top: 20,
                    child: Text(
                        'Subjects',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 23.0,
                          color: Colors.black,

                        )
                    )
                ),
                Positioned(
                  right: 220,
                  bottom: 180,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                      });
                    },
                    splashColor: Colors.transparent,
                    child: Container(
                      width: 155.0,
                      height: 50.0,
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.greenAccent[400],
                            Colors.greenAccent[400],
                            Colors.greenAccent[700],
                            Colors.greenAccent[700],
                          ],
                          stops: [0.25, 0.50, 0.75, 1],
                        ),
                        border: Border.all(color: Color.fromRGBO(255, 255, 255,0.0), width: 3.0),
                        borderRadius: BorderRadius.circular(35.0),
                      ),
                      child: Center(child: Text('Computing', style: TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold),),),
                    ),
                  ),
                ),

                Positioned(
                  right: 220,
                  bottom: 115,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                      });
                    },
                    splashColor: Colors.transparent,
                    child: Container(
                      width: 155.0,
                      height: 50.0,
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.red[600],
                            Colors.red[700],
                            Colors.red[800],
                            Colors.red[900],
                          ],
                          stops: [0.25, 0.50, 0.75, 1],
                        ),
                        border: Border.all(color: Color.fromRGBO(255, 255, 255, 0.0), width: 3.0),
                        borderRadius: BorderRadius.circular(35.0),
                      ),
                      child: Center(child: Text('Maths', style: TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold),),),
                    ),
                  ),
                ),

                Positioned(
                  right: 220,
                  bottom: 50,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                      });
                    },
                    splashColor: Colors.transparent,
                    child: Container(
                      width: 155.0,
                      height: 50.0,
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.blue[600],
                            Colors.blue[700],
                            Colors.blue[800],
                            Colors.blue[900],
                          ],
                          stops: [0.25, 0.50, 0.75, 1],
                        ),
                        border: Border.all(color: Color.fromRGBO(255, 255, 255, 0.0), width: 3.0),
                        borderRadius: BorderRadius.circular(35.0),
                      ),
                      child: Center(child: Text('Chemistry', style: TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold),),),
                    ),
                  ),
                ),

                Positioned(
                    right: 40,
                    bottom: 180,
                    child: InkWell(
      onTap: () {
        chooseEnglish();
      },
      splashColor: Colors.transparent,
      child: Container(
        width: 155.0,
        height: 50.0,
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.purple[600],
              Colors.purple[700],
              Colors.purple[800],
              Colors.purple[900],
            ],
            stops: [0.25, 0.50, 0.75, 1],
          ),
          border: Border.all(color: Color.fromRGBO(255, 255, 255, 0.0), width: 3.0),
          borderRadius: BorderRadius.circular(35.0),
        ),
        child: Center(child: Text('English', style: TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold),),),
      ),
    )
                ),

                Positioned(
                  right: 40,
                  bottom: 115,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                      });
                    },
                    splashColor: Colors.transparent,
                    child: Container(
                      width: 155.0,
                      height: 50.0,
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.yellow[700],
                            Colors.yellow[700],
                            Colors.yellow[800],
                            Colors.yellow[900],
                          ],
                          stops: [0.25, 0.50, 0.75, 1],
                        ),
                        border: Border.all(color: Color.fromRGBO(255, 255, 255,0.0), width: 3.0),
                        borderRadius: BorderRadius.circular(35.0),
                      ),
                      child: Center(child: Text('History', style: TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold),),),
                    ),
                  ),
                ),

                Positioned(
                  right: 40,
                  bottom: 50,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                      });
                    },
                    splashColor: Colors.transparent,
                    child: Container(
                      width: 155.0,
                      height: 50.0,
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.deepOrange[600],
                            Colors.deepOrange[700],
                            Colors.deepOrange[800],
                            Colors.deepOrange[900],
                          ],
                          stops: [0.25, 0.50, 0.75, 1],
                        ),
                        border: Border.all(color: Color.fromRGBO(255, 255, 255,0.0), width: 3.0),
                        borderRadius: BorderRadius.circular(35.0),
                      ),
                      child: Center(
                        child: Text(
                          'Art',
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                ),



              ],
            )
        ),
      );
    })
        .closed
        .whenComplete(() {
      if (mounted) {
        setState(() {
          _showPersBottomSheetCallBack = _showBottomSheet;
        });
      }
    });
  }



  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey[350],
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/mojave.jpeg"),
            fit: BoxFit.cover
          )
        ),
        height: 895,
        width: 430,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 0),
          child: Stack(
            children: <Widget>[
              Positioned(
                //right: 43.0,
                left: 30,
                bottom: 800.0,
                child: Text(
                  "Timetable",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'GoogleSans'),
                ),
              ),
              Positioned(
                //right: 43.0,
                left: 30,
                bottom: 775.0,
                child: Text(
                  "Sort your subjects into day-to-day schedule.",
                  style: TextStyle(
                      fontFamily: 'GoogleSans',
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(255, 255, 255, 0.5)),
                ),
              ),
              Positioned(
                right: 50.0,
                bottom: 25,
                child: InkWell(
                  onTap: () {
                  },
                  splashColor: Colors.transparent,
                  child: Text(
                    "Next",
                    style: TextStyle(
                      fontFamily: 'GoogleSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 50.0,
                bottom: 25,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ThirdState()),
                      );
                  },
                  splashColor: Colors.transparent,
                  child: Text(
                    "Back",
                    style: TextStyle(
                      fontFamily: 'GoogleSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 220,
                bottom: 27,
                child: TabPageSelectorIndicator(
                  backgroundColor: Colors.white54,
                  size: 8.0,
                  borderColor: Colors.transparent,
                ),
              ),
              Positioned(
                right: 205,
                bottom: 27,
                child: TabPageSelectorIndicator(
                  backgroundColor: Colors.white54,
                  size: 8.0,
                  borderColor: Colors.transparent,
                ),
              ),
              Positioned(
                right: 190,
                bottom: 27,
                child: TabPageSelectorIndicator(
                  backgroundColor: Colors.white54,
                  size: 8.0,
                  borderColor: Colors.transparent,
                ),
              ),
              Positioned(
                right: 175,
                bottom: 27,
                child: TabPageSelectorIndicator(
                  backgroundColor: Colors.white,
                  size: 8.0,
                  borderColor: Colors.transparent,
                ),
              ),
              Positioned(
                left: 30,
                bottom: 735.0,
                child: Text(
                  "MONDAY",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'GoogleSans'),
                ),
              ),
              Positioned(
                left: 30,
                bottom: 673,
                child: new SizedBox(
                  width: 360,
                  height: 50,
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 0.0),
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[

                      SubjectSelectorState.thisSubject,
                      Padding( padding: EdgeInsets.symmetric(horizontal: 10),

                      ),
                      SubjectSelectorState.thisSubject,
                      Padding( padding: EdgeInsets.symmetric(horizontal: 10),

                      ),
                      SubjectSelectorState.thisSubject,

                    ],
                  ),
                ),
              ),
              Positioned(
                left: 30,
                bottom: 605.0,
                child: Text(
                  "TUESDAY",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'GoogleSans'),
                ),
              ),
              Positioned(
                left: 30,
                bottom: 543,
                child: new SizedBox(
                  width: 360,
                  height: 50,
                  child: ListView(
                    padding: EdgeInsets.all(0),
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      SubjectSelectorState.thisSubject,
                      Padding( padding: EdgeInsets.symmetric(horizontal: 10),

                      ),
                      SubjectSelectorState.thisSubject,
                      Padding( padding: EdgeInsets.symmetric(horizontal: 10),

                      ),
                      SubjectSelectorState.thisSubject,
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 30,
                bottom: 475.0,
                child: Text(
                  "WEDNESDAY",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'GoogleSans'),
                ),
              ),
              Positioned(
                left: 30,
                bottom: 413,
                child: new SizedBox(
                  width: 360,
                  height: 50,
                  child: ListView(
                    padding: EdgeInsets.all(0),
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      SubjectSelectorState.thisSubject,
                      Padding( padding: EdgeInsets.symmetric(horizontal: 10),

                      ),
                      SubjectSelectorState.thisSubject,
                      Padding( padding: EdgeInsets.symmetric(horizontal: 10),

                      ),
                      SubjectSelectorState.thisSubject,
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 30,
                bottom: 345.0,
                child: Text(
                  "THURSDAY",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'GoogleSans'),
                ),
              ),
              Positioned(
                left: 30,
                bottom: 283,
                child: new SizedBox(
                  width: 360,
                  height: 50,
                  child: ListView(
                    padding: EdgeInsets.all(0),
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      SubjectSelectorState.thisSubject,
                      Padding( padding: EdgeInsets.symmetric(horizontal: 10),

                      ),
                      SubjectSelectorState.thisSubject,
                      Padding( padding: EdgeInsets.symmetric(horizontal: 10),

                      ),
                      SubjectSelectorState.thisSubject,
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 30,
                bottom: 225.0,
                child: Text(
                  "FRIDAY",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'GoogleSans'),
                ),
              ),
              Positioned(
                left: 30,
                bottom: 163,
                child: new SizedBox(
                  width: 360,
                  height: 50,
                  child: ListView(
                    padding: EdgeInsets.all(0),
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[

                      SubjectSelectorState.thisSubject,
                      Padding( padding: EdgeInsets.symmetric(horizontal: 10),

                      ),
                      SubjectSelectorState.thisSubject,
                      Padding( padding: EdgeInsets.symmetric(horizontal: 10),

                      ),
                      SubjectSelectorState.thisSubject,
                    ],
                  ),
                ),
              ),

              Positioned(
                left: 100,
                bottom: 80,
                child: InkWell(
                  onTap: () {
                    _showPersBottomSheetCallBack;
                    _showBottomSheet();
                  },
                  splashColor: Colors.transparent,
                  child: Container(
                    width: 200.0,
                    height: 50.0,
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.blue[700],
                          Colors.blue[700],
                          Colors.blue[800],
                          Colors.blue[900],
                        ],
                        stops: [0.25, 0.50, 0.75, 1],
                      ),
                      border: Border.all(color: Color.fromRGBO(255, 255, 255,0.0), width: 3.0),
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    child: Center(child: Text('Subject List', style: TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold),),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
