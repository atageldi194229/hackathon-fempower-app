import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hackathon/page1.dart';
import 'package:hackathon/page2.dart';
import 'package:hackathon/page3.dart';
import 'package:hackathon/page4.dart';
import 'package:hackathon/page5.dart';
void main() {
runApp(MyApp());
}

class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
	return MaterialApp(
	title: 'Aygytly adim',
	theme: ThemeData(
		primarySwatch: Colors.blue,
	),
	home: MyHomePage(),
	debugShowCheckedModeBanner: false,
	);
}
}

class MyHomePage extends StatefulWidget {
@override
_MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
@override
void initState() {
	super.initState();
	Timer(Duration(seconds: 3),
  ()=>Navigator.pushReplacement(context,
										MaterialPageRoute(builder:(context) =>	HomePage()	)	)
		);
}
@override
Widget build(BuildContext context) {
	return Container(
	color:  Color.fromARGB(255, 6, 82, 212),
	child: Center(child: Column(
    children: [
      Container(
        height: 200,
        width: 200,
        child: Image.asset("asset/Group.png"),
      ),
      Text("AYGYTLY ADIM", style: TextStyle(color:Colors.green, fontSize: 40),),
    ],
  ))
	);
}
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
int sahypa = 0;
List pages =[];
MainPage mainPage =MainPage();
Page2 page2 = Page2();
Page3 page3 = Page3();
Page4 page4 = Page4();
Page5 page5 = Page5();

@override
  void initState() {
    // TODO: implement initState
    pages = [mainPage,page2,page3,page4,page5];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
resizeToAvoidBottomInset: false,
  body: pages[sahypa],
  bottomNavigationBar:
  Theme(
    data: ThemeData(canvasColor:Color.fromRGBO(58, 28, 144, 1)),
    child: Padding(
      padding: const EdgeInsets.only(left: 4, right: 4, bottom: 2),
      child: BottomNavigationBar(
        items:[
          BottomNavigationBarItem(
            icon: Image.asset("asset/Home.png"),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: Image.asset("asset/Services.png"),label: "Services"
          ),
          BottomNavigationBarItem(
            icon: Image.asset("asset/Consulting.png"),label: "Consulting"
          ),
          BottomNavigationBarItem(
            icon: Image.asset("asset/Courses.png",),label: "Courses"
          ),
          BottomNavigationBarItem(
            icon: Image.asset("asset/Registration.png"),label: "Registration"
          ),
          
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: sahypa,
        fixedColor: Color.fromARGB(255, 6, 82, 212),
        onTap: (value){
          setState(() {
            sahypa= value;
          });
        },
        ))
       ),
      );
    
  
   

    
  
  }
}