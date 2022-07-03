import 'package:flutter/material.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'home.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Country State and City Picker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
} 


class MyHomePage extends StatefulWidget 
{
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String countryValue="";
  String stateValue="";
  String cityValue="";

  
  
  
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Your Country'),
      ),
      body:  Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 600,
        child: 
         Column(
          children: [
            SelectState(
              onCountryChanged: (value) {
              setState(() {
                countryValue = value;
              });
            },
            onStateChanged:(value) {
              setState(() {
              
                stateValue = value;
              });
            },
             onCityChanged:(value) {
              setState(() {
                cityValue = value;
                
              });
            },
            
            ),
            SizedBox(
              height:MediaQuery.of(context).size.height/10,
            ),

            Container(
             height:100,
             width:100,
             
             decoration:BoxDecoration(
               
               color:Colors.yellow,
               border:Border.all(color:Colors.yellow),
               borderRadius:BorderRadius.circular(90.0),

               
             ),

             child:TextButton(

               onPressed:(){

                 Navigator.push(context,MaterialPageRoute(builder:(context)=>Home(
                   
                   state:stateValue,
                   
                 )),
                 );
               },
               child:Text(
                 "Calculate",

                 style:TextStyle(color:Colors.white),
                 
                 ),
                 
             ),

             
            ),
         
          ],
        ),
      ),
    );
  }
}