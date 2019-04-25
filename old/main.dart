import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intro_quiz/timetable_selection.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark
    ));
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.indigo
      ),
      home: SubjectSelectState(),
    );
  }
}

class SubjectSelection extends StatelessWidget {
  




  @override
  


  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark
    ));
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.indigo
      ),
      home: SubjectSelectState(),
    );
  }
}

class ThirdState extends StatefulWidget {

  @override
  ThirdScreen createState() => new ThirdScreen();

}

class SubjectSelectState extends StatefulWidget {

  SubjectSelectPage createState() => new SubjectSelectPage();


}

class SubjectSelectPage extends State<SubjectSelectState> {
  bool doesHistory = true;
  bool doesEnglish = true;
  bool doesMaths = true;
  bool doesPE = true;
  bool doesBiology = true;
  bool doesChemistry = true;
  bool doesPhilosophy = true;
  bool doesMusic = true;
  bool doesDT = true;
  bool doesGeography = true;
  bool doesFrench = true;
  bool doesLatin = true;
  bool doesSpanish = true;
  bool doesGerman = true;
  bool doesPhysics = true;
  bool doesDrama = true;
  bool doesComputing = true;
  bool doesArt = true;

  //final DocumentReference documentReference = Firestore.instance.document("mySubjects/subjects");

  final controller = PageController(
    initialPage: 1,
  );






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      body:
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/mojave1.jpeg"),
            fit: BoxFit.cover
          )
        ),
        height: 895,
        width:430,

        child: Container(
          padding: EdgeInsets.symmetric(vertical: 0),

          child: Stack(
            children: <Widget>[
              Positioned(
                //right: 43.0,
                left: 50,
                bottom: 800.0,
                child: Text("Select your subjects.",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'GoogleSans'
                  ),
                ),
              ),


              Positioned(
                //right: 43.0,
                left: 50,
                bottom: 740.0,
                child: Text("Just the one's that you're being examined on.\nDon't fret: you can always change these later.",
                  style: TextStyle(
                      fontFamily: 'GoogleSans',
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(255, 255, 255, 0.5)
                  ),
                ),
              ),
              Positioned(
                right: 50.0,
                bottom: 25,
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ThirdState()),
                      );
                    },
                    splashColor: Colors.transparent,
                    child: Container(
                      width: 50,
                      height: 20,
                      child: Text("Next",
                        style: TextStyle(
                          fontFamily: 'GoogleSans',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    )
                ),
              ),
              Positioned(
                left: 50.0,
                bottom: 25,
                child: InkWell(
                    onTap: (){
                    
                    },
                    splashColor: Colors.transparent,
                    child: Container(
                      width: 50,
                      height: 20,
                      child: Text("Back",
                        style: TextStyle(
                          fontFamily: 'GoogleSans',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    )
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
                  backgroundColor: Colors.white,
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
                  backgroundColor: Colors.white54,
                  size: 8.0,
                  borderColor: Colors.transparent,
                ),
              ),

              Positioned(
                left: 45.0,
                bottom: 655.0,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      doesComputing = !doesComputing;
                    });
                  },
                  splashColor: Colors.transparent,
                  child: Container(
                    width: 155.0,
                    height: 50.0,
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent[400],
                      border: Border.all(color: Color.fromRGBO(255, 255, 255, doesComputing ?0.0 : 1.0), width: 3.0),
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    child: Center(child: Text('Computing', style: TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold),),),
                  ),
                ),
              ),
              Positioned(
                right: 45.0,
                bottom: 655.0,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      doesArt = !doesArt;
                    });
                  },
                  splashColor: Colors.transparent,
                  child: Container(
                    width: 155.0,
                    height: 50.0,
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      color: Colors.deepOrange[600],
                      border: Border.all(color: Color.fromRGBO(255, 255, 255, doesArt ?0.0 : 1.0), width: 3.0),
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    child: Center(child: Text('Art', style: TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold),),),
                  ),
                ),
              ),

              Positioned(
                left: 45.0,
                bottom: 585.0,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      doesHistory = !doesHistory;
                    });
                
                  },
                  splashColor: Colors.transparent,
                  child: Container(
                    width: 155.0,
                    height: 50.0,
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      color: Colors.yellow[700],
                      border: Border.all(color: Color.fromRGBO(255, 255, 255, doesHistory ?0.0 : 1.0), width: 3.0),
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    child: Center(child: Text('History', style: TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold),),),
                  ),
                ),
              ),
              Positioned(
                right: 45.0,
                bottom: 585.0,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      doesEnglish = !doesEnglish;
                    });
                  },
                  splashColor: Colors.transparent,
                  child: Container(
                    width: 155.0,
                    height: 50.0,
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      color: Colors.purple[600],
                      border: Border.all(color: Color.fromRGBO(255, 255, 255, doesEnglish ?0.0 : 1.0), width: 3.0),
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    child: Center(child: Text('English', style: TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold),),),
                  ),
                ),
              ),
              Positioned(
                left: 45.0,
                bottom: 515.0,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      doesMaths = !doesMaths;
                    });
                  },
                  splashColor: Colors.transparent,
                  child: Container(
                    width: 155.0,
                    height: 50.0,
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      color: Colors.red[600],
                      border: Border.all(color: Color.fromRGBO(255, 255, 255, doesMaths ?0.0 : 1.0), width: 3.0),
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    child: Center(child: Text('Maths', style: TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold),),),
                  ),
                ),
              ),
              Positioned(
                right: 45.0,
                bottom: 515.0,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      doesPE = !doesPE;
                    });
                  },
                  splashColor: Colors.transparent,
                  child: Container(
                    width: 155.0,
                    height: 50.0,
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      color: Colors.teal[600],
                      border: Border.all(color: Color.fromRGBO(255, 255, 255, doesPE ?0.0 : 1.0), width: 3.0),
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    child: Center(child: Text('PE', style: TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold),),),
                  ),
                ),
              ),
              Positioned(
                left: 45.0,
                bottom: 445.0,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      doesBiology = !doesBiology;
                    });
                  },
                  splashColor: Colors.transparent,
                  child: Container(
                    width: 155.0,
                    height: 50.0,
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      color: Colors.green[600],
                      border: Border.all(color: Color.fromRGBO(255, 255, 255, doesBiology ?0.0 : 1.0), width: 3.0),
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    child: Center(child: Text('Biology', style: TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold),),),
                  ),
                ),
              ),
              Positioned(
                right: 45.0,
                bottom: 445.0,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      doesChemistry = !doesChemistry;
                    });
                  },
                  splashColor: Colors.transparent,
                  child: Container(
                    width: 155.0,
                    height: 50.0,
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      color: Colors.blue[600],
                      border: Border.all(color: Color.fromRGBO(255, 255, 255, doesChemistry ?0.0 : 1.0), width: 3.0),
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    child: Center(child: Text('Chemistry', style: TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold),),),
                  ),
                ),
              ),
              Positioned(
                right: 45.0,
                bottom: 375.0,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      doesPhilosophy = !doesPhilosophy;
                    });
                  },
                  splashColor: Colors.transparent,
                  child: Container(
                    width: 155.0,
                    height: 50.0,
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      color: Colors.pink[600],
                      border: Border.all(color: Color.fromRGBO(255, 255, 255, doesPhilosophy ?0.0 : 1.0), width: 3.0),
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    child: Center(child: Text('Philosophy', style: TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold),),),
                  ),
                ),
              ),
              Positioned(
                left: 45.0,
                bottom: 375.0,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      doesMusic = !doesMusic;
                    });
                  },
                  splashColor: Colors.transparent,
                  child: Container(
                    width: 155.0,
                    height: 50.0,
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      color: Colors.lightBlue[300],
                      border: Border.all(color: Color.fromRGBO(255, 255, 255, doesMusic ?0.0 : 1.0), width: 3.0),
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    child: Center(child: Text('Music', style: TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold),),),
                  ),
                ),
              ),
              Positioned(
                left: 45.0,
                bottom: 305.0,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      doesDT = !doesDT;
                    });
                  },
                  splashColor: Colors.transparent,
                  child: Container(
                    width: 155.0,
                    height: 50.0,
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      color: Colors.pink[300],
                      border: Border.all(color: Color.fromRGBO(255, 255, 255, doesDT ?0.0 : 1.0), width: 3.0),
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    child: Center(child: Text('DT', style: TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold),),),
                  ),
                ),
              ),
              Positioned(
                right: 45.0,
                bottom: 305.0,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      doesGeography = !doesGeography;
                    });
                  },
                  splashColor: Colors.transparent,
                  child: Container(
                    width: 155.0,
                    height: 50.0,
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      color: Colors.lime[600],
                      border: Border.all(color: Color.fromRGBO(255, 255, 255, doesGeography ?0.0 : 1.0), width: 3.0),
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    child: Center(child: Text('Geography', style: TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold),),),
                  ),
                ),
              ),
              Positioned(
                right: 45.0,
                bottom: 235.0,
                child: InkWell(
                  onTap: () {setState(() {
                    doesFrench = !doesFrench;
                  });},
                  splashColor: Colors.transparent,
                  child: Container(
                    width: 155.0,
                    height: 50.0,
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      border: Border.all(color: Color.fromRGBO(255, 255, 255, doesFrench ?0.0 : 1.0), width: 3.0),
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    child: Center(child: Text('French', style: TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold),),),
                  ),
                ),
              ),
              Positioned(
                left: 45.0,
                bottom: 235.0,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      doesLatin = !doesLatin;
                    });
                  },
                  splashColor: Colors.transparent,
                  child: Container(
                    width: 155.0,
                    height: 50.0,
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      color: Colors.orange[600],
                      border: Border.all(color: Color.fromRGBO(255, 255, 255, doesLatin ?0.0 : 1.0), width: 3.0),
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    child: Center(child: Text('Latin', style: TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold),),),
                  ),
                ),
              ),
              Positioned(
                left: 45.0,
                bottom: 165.0,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      doesSpanish = !doesSpanish;
                    });
                  },
                  splashColor: Colors.transparent,
                  child: Container(
                    width: 155.0,
                    height: 50.0,
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      color: Colors.indigo[400],
                      border: Border.all(color: Color.fromRGBO(255, 255, 255, doesSpanish ?0.0 : 1.0), width: 3.0),
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    child: Center(child: Text('Spanish', style: TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold),),),
                  ),
                ),
              ),
              Positioned(
                right: 45.0,
                bottom: 165.0,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      doesGerman = !doesGerman;
                    });
                  },
                  splashColor: Colors.transparent,
                  child: Container(
                    width: 155.0,
                    height: 50.0,
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Color.fromRGBO(255, 255, 255, doesGerman ?0.0 : 1.0), width: 3.0),
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    child: Center(child: Text('German', style: TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold),),),
                  ),
                ),
              ),
              Positioned(
                left: 45.0,
                bottom: 95,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      doesPhysics = !doesPhysics;
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
                          Colors.grey[600],
                          Colors.grey[600],
                          Colors.grey[700],
                          Colors.grey[700],
                        ],
                        stops: [0.25, 0.50, 0.75, 1],
                      ),
                      border: Border.all(color: Color.fromRGBO(255, 255, 255, doesPhysics ?0.0 : 1.0), width: 3.0),
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    child: Center(child: Text('Physics', style: TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold),),),
                  ),
                ),
              ),
              Positioned(
                right: 45.0,
                bottom: 95,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      doesDrama = !doesDrama;
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
                          Colors.cyan[300],
                          Colors.cyan[400],
                          Colors.cyan[500],
                          Colors.cyan[600],
                        ],
                        stops: [0.25, 0.50, 0.75, 1],
                      ),
                      border: Border.all(color: Color.fromRGBO(255, 255, 255, doesDrama ?0.0 : 1.0), width: 3.0),
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    child: Center(child: Text('Drama', style: TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold),),),
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

class ThirdScreen extends State<ThirdState> {
  bool pressedyes = false;

  final controller = PageController(
    initialPage: 0,
    viewportFraction: 0.35,
    keepPage: true,

  );


  @override
  Widget build(BuildContext context) {
    
        return Scaffold(
          
    
          body:
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/mojave2.jpeg"),
                fit: BoxFit.cover
              )
            ),
            margin: EdgeInsets.all(0.0),
            child: Stack(
              children: <Widget>[
                Positioned(
                  //right: 43.0,
                  left: 50,
                  bottom: 797.0,
                  child: Text("Just a few questions.",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'GoogleSans',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
    
    
                Positioned(
                  //right: 43.0,
                  left: 50,
                  bottom: 750.0,
                  child: Text("This won't take long - we promise.",
                    style: TextStyle(
                        fontFamily: 'GoogleSans',
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(255, 255, 255, 0.5)
                    ),
                  ),
                ),
                Positioned(
                  right: 50.0,
                  bottom: 25.0,
                  child: InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TimetableSelection()),
                      );
                      
                    },
                    splashColor: Colors.transparent,
                    child: Text("Next",
                      style: TextStyle(
                        fontFamily: 'GoogleSans',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 50.0,
                  bottom: 25.0,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SubjectSelectState()),
                      );
                    },
                    splashColor: Colors.transparent,
                    child: Text("Back",
                      style: TextStyle(
                        fontFamily: 'GoogleSans',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
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
                    backgroundColor: Colors.white,
                    size: 8.0,
                    borderColor: Colors.transparent,
                  ),
                ),
                Positioned(
                  right: 175,
                  bottom: 27,
                  child: TabPageSelectorIndicator(
                    backgroundColor: Colors.white54,
                    size: 8.0,
                    borderColor: Colors.transparent,
                  ),
                ),
    
                
    
    
                Positioned(
                  left: 125,
                  bottom: 685,
                  child: Text("Lessons per day",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'GoogleSans',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
    
                  ),
                ),
    
                Positioned(
                  left: 130,
                  bottom: 545,
                  child: Text("Lesson duration",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'GoogleSans',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
    
                  ),
                ),
    
                Positioned(
                  left: 110,
                  bottom: 420,
                  child: Text("School day timings",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'GoogleSans',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
    
                  ),
                ),
    
                Positioned(
                  left: 95,
                  bottom: 360,
                  child: Text("Start",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'GoogleSans',
                      fontSize: 22,
                      //fontWeight: FontWeight.bold,
                    ),
    
    
    
                  ),
                ),
    
                Positioned(
                  left: 270,
                  bottom: 360,
                  child: Text("Finish",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'GoogleSans',
                      fontSize: 22,
                      //fontWeight: FontWeight.bold,
                    ),
    
    
    
                  ),
                ),
    
    
              
    
                Positioned(
                  left: 175,
                  bottom: 485,
                  child: Container(
                    height: 50,
                    width: 60,
                    decoration: BoxDecoration(
                        border: new Border.all(
                            color: Colors.green[600],
                            width: 1.2,
                            style: BorderStyle.solid
                        ),
                        borderRadius: BorderRadius.circular(80.0)
                    ),
    
                  ),
                ),
    
              
    
                Positioned(
                  left: 70,
                  bottom: 590,
                  child: new SizedBox(
                      width: 270,
                      height: 74,
                      child: PageView(
    
                        controller: controller,
                        pageSnapping: true,
                        children: <Widget>[
                          new Container(
                            transform: Matrix4.translationValues(40, 0,0),
                            child: Text(
                              '1',
                              style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.w100,
                                fontFamily: 'GoogleSans',
                                color: Colors.white,
                              ),
                            ),
                          ),
                          new Container(
                            transform: Matrix4.translationValues(40, 0,0),
                            child: Text(
                              '2',
                              style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.w100,
                                fontFamily: 'GoogleSans',
                                color: Colors.white,
                              ),
                            ),
                          ),
                          new Container(
                            transform: Matrix4.translationValues(40, 0,0),
                            child: Text(
                              '3',
                              style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(40, 0,0),
                        child: Text(
                          '4',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(40, 0,0),
                        child: Text(
                          '5',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(40, 0,0),
                        child: Text(
                          '6',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(40, 0,0),
                        child: Text(
                          '7',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(40, 0,0),
                        child: Text(
                          '8',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(40, 0,0),
                        child: Text(
                          '9',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(30, 0,0),
                        child: Text(
                          '10',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(30, 0,0),
                        child: Text(
                          '11',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(30, 0,0),
                        child: Text(
                          '12',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )

              ),
            ),

            Positioned(
              left: 175,
              bottom: 622.5,
              child: Container(
                    height: 50,
                    width: 60,
                    decoration: BoxDecoration(
                        border: new Border.all(
                            color: Colors.lightBlue,
                            width: 1.2,
                            style: BorderStyle.solid
                        ),
                        borderRadius: BorderRadius.circular(80.0)
                    ),
    
                  ),
            ),

            Positioned(
              left: 70,
              bottom: 452,

              child: new SizedBox(
                  width: 270,
                  height: 75,



                  child: PageView(

                    controller: controller,
                    pageSnapping: true,
                    children: <Widget>[
                      new Container(
                        transform: Matrix4.translationValues(30, 0,0),
                        child: Text(
                          '10',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(30, 0,0),
                        child: Text(
                          '15',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(30, 0,0),
                        child: Text(
                          '20',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(30, 0,0),
                        child: Text(
                          '25',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(30, 0,0),
                        child: Text(
                          '30',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(30, 0,0),
                        child: Text(
                          '35',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(30, 0,0),
                        child: Text(
                          '40',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(30, 0,0),
                        child: Text(
                          '45',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(30, 0,0),
                        child: Text(
                          '50',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(30, 0,0),
                        child: Text(
                          '55',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(30, 0,0),
                        child: Text(
                          '60',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(30, 0,0),
                        child: Text(
                          '65',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
              ),

            ),

            

            Positioned(
              left: 58,
              bottom: 197,
              child: Container(
                width: 47,
                height: 70,
                decoration: BoxDecoration(
                    border: new Border.all(
                        color: Colors.red[500],
                        width: 1.5,
                        style: BorderStyle.solid
                    ),
                    borderRadius: BorderRadius.circular(30.0)
                ),

              ),
            ),

            Positioned(
              left: 137,
              bottom: 197,
              child: Container(
                width: 47,
                height: 70,
                decoration: BoxDecoration(
                    border: new Border.all(
                        color: Colors.red[500],
                        width: 1.5,
                        style: BorderStyle.solid
                    ),
                    borderRadius: BorderRadius.circular(30.0)
                ),

              ),
            ),





            Positioned(
              left: 63,
              bottom: 130,

              child: new SizedBox(
                  width: 50,
                  height: 200,



                  child: PageView(
                    scrollDirection: Axis.vertical,
                    controller: controller,
                    pageSnapping: true,
                    children: <Widget>[
                      new Container(
                        transform: Matrix4.translationValues(0,15,0),
                        child: Text(
                          '07',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(0,15,0),
                        child: Text(
                          '08',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(0,15,0),
                        child: Text(
                          '09',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(0,15,0),
                        child: Text(
                          '10',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(0,15,0),
                        child: Text(
                          '11',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(0,15,0),
                        child: Text(
                          '12',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(0,15,0),
                        child: Text(
                          '13',
                          style: TextStyle(
                            fontSize: 30.0,
                           fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(0,15,0),
                        child: Text(
                          '14',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(0,15,0),
                        child: Text(
                          '15',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(0,15,0),
                        child: Text(
                          '16',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(0,15,0),
                        child: Text(
                          '17',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(0,15,0),
                        child: Text(
                          '18',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
              ),

            ),

            Positioned(
              left: 141,
              bottom: 130,

              child: new SizedBox(
                  width: 50,
                  height: 200,



                  child: PageView(
                    scrollDirection: Axis.vertical,
                    controller: controller,
                    pageSnapping: true,
                    children: <Widget>[
                      new Container(
                        transform: Matrix4.translationValues(0,15,0),
                        child: Text(
                          '00',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(0,15,0),
                        child: Text(
                          '05',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(0,15,0),
                        child: Text(
                          '10',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(0,15,0),
                        child: Text(
                          '15',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(0,15,0),
                        child: Text(
                          '20',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(0,15,0),
                        child: Text(
                          '25',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(0,15,0),
                        child: Text(
                          '30',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(0,15,0),
                        child: Text(
                          '35',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(0,15,0),
                        child: Text(
                          '40',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(0,15,0),
                        child: Text(
                          '45',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(0,15,0),
                        child: Text(
                          '50',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(0,15,0),
                        child: Text(
                          '55',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )

              ),

            ),

            
            Positioned(
              left: 317.5,
              bottom: 194,
              child: Container(
                width: 47,
                height: 70,
                decoration: BoxDecoration(
                    border: new Border.all(
                        color: Colors.red[500],
                        width: 1.5,
                        style: BorderStyle.solid
                    ),
                    borderRadius: BorderRadius.circular(30.0)
                ),

              ),
            ),

            Positioned(
              left: 237.5,
              bottom: 194,
              child: Container(
                width: 47,
                height: 70,
                decoration: BoxDecoration(
                    border: new Border.all(
                        color: Colors.red[500],
                        width: 1.5,
                        style: BorderStyle.solid
                    ),
                    borderRadius: BorderRadius.circular(30.0)
                ),

              ),
            ),





            Positioned(
              left: 243,
              bottom: 130,

              child: new SizedBox(
                  width: 50,
                  height: 200,



                  child: PageView(
                    scrollDirection: Axis.vertical,
                    controller: controller,
                    pageSnapping: true,
                    children: <Widget>[
                      new Container(
                        transform: Matrix4.translationValues(0,15,0),
                        child: Text(
                          '07',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(0,15,0),
                        child: Text(
                          '08',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(0,15,0),
                        child: Text(
                          '09',
                          style: TextStyle(
                            fontSize: 30.0,
                           fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(0,15,0),
                        child: Text(
                          '10',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(0,15,0),
                        child: Text(
                          '11',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(0,15,0),
                        child: Text(
                          '12',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(0,15,0),
                        child: Text(
                          '13',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(0,15,0),
                        child: Text(
                          '14',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(0,15,0),
                        child: Text(
                          '15',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(0,15,0),
                        child: Text(
                          '16',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(0,15,0),
                        child: Text(
                          '17',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(0,15,0),
                        child: Text(
                          '18',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
              ),

            ),

            Positioned(
              left: 321,
              bottom: 130,

              child: new SizedBox(
                  width: 60,
                  height: 200,



                  child: PageView(
                    scrollDirection: Axis.vertical,
                    controller: controller,
                    pageSnapping: true,
                    children: <Widget>[
                      new Container(
                        transform: Matrix4.translationValues(0,15,0),
                        child: Text(
                          '00',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(0,15,0),
                        child: Text(
                          '05',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(0,15,0),
                        child: Text(
                          '10',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(0,15,0),
                        child: Text(
                          '15',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(0,15,0),
                        child: Text(
                          '20',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(0,15,0),
                        child: Text(
                          '25',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(0,15,0),
                        child: Text(
                          '30',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(0,15,0),
                        child: Text(
                          '35',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(0,15,0),
                        child: Text(
                          '40',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(0,15,0),
                        child: Text(
                          '45',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(0,15,0),
                        child: Text(
                          '50',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Container(
                        transform: Matrix4.translationValues(0,15,0),
                        child: Text(
                          '55',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'GoogleSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
              ),

            ),

            

          ],
        ),
      ),


    );
  }
}


/* body: Column(

        Stack(
           Positioned(
             right: 43.0,
             bottom: 760.0,
             child: Text("Just the one's that you're being examined on. Don't\nfret: you can always change these later.",
             style: TextStyle(
               fontWeight: FontWeight.bold,
             ),
             ),
           ),
           GestureDetector(
             onTap: () {},
              child: Positioned(
                right: 50.0,
                bottom: 40.0,
                child: Text("Next",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
           GestureDetector(
            onTap: () {},
              child: Positioned(
                left: 50.0,
                bottom: 40.0,
                child: Text("Skip",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
         ],
       ),
      ),
*/