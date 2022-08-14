import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:SingleChildScrollView(
        child: Column(
          children: [
             Container(
          child: Image.asset("asset/Rectangle 12.png", width: 500,height: 250,), ),
          Row(
            children: [
                 Container(
                  margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.redAccent,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10)
            ),
            height: 250,
            width: 170,
            child:Column(
              children: [
                Image.asset("asset/Rectangle 32.png",height: 170, width: 160,),
                Text("Training")
              ],
            )

           ),
              Container(
            decoration: BoxDecoration(
              color: Colors.redAccent,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10)
            ),
            height: 250,
            width: 170,
            child:Column(
              children: [
                Image.asset("asset/Rectangle 33.png",height: 170, width: 160,),
                Text("Progress")
              ],
            )

           )
            
            

          
            
            

          
            ],
          ),
          
             Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(239, 60, 124, 1),
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10)
            ),
            height: 170,
            width: 250,
            child:Column(
              children: [
                Image.asset("asset/Rectangle 33.png",height: 140, width: 170,),
                Text("Consalting")
              ],
            )

           )
            

          ],
        ),
      )
        
      
    );
      

  }
}