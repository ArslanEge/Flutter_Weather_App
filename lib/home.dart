import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'main.dart';




class Home extends StatefulWidget {

final String state;

  const Home({ Key? key,required this.state}) : super(key: key);
  
  

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

var temp;
var description;
var currently;
var humidity;
var windspeed;


Future getWeather() async{



var response =await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q="+widget.state+"&units=imperial&appid=24793db07919cd147d4dfbb6f94541d1"));

var results=jsonDecode(response.body);

setState(() {
  this.temp=results['main']['temp'];
  this.description=results['weather'][0]['description'];
  this.currently=results['weather'][0]['main'];
  this.humidity=results['main']['humidity'];
  this.windspeed=results['wind']['speed'];
  
});






}
  @override 
void initState(){
super.initState();

this.getWeather();


}
  @override
  Widget build(BuildContext context) {
    
    
    return MaterialApp(
      home:Scaffold(
        body:Column(
          children:<Widget> [
            Container(
              height:MediaQuery.of(context).size.height/3,
              width: MediaQuery.of(context).size.width,
              color:Colors.red,
              child:Column(
                mainAxisAlignment:MainAxisAlignment.center,
                crossAxisAlignment:CrossAxisAlignment.center,

                children:<Widget> [
                  Padding(
                    padding:EdgeInsets.only(top:30),
                    child:Text(
                      "Currently in "+widget.state,
                      style:TextStyle(
                        color:Colors.white,
                        fontSize: 14.0,
                        fontWeight:FontWeight.w600,

                      ),

                    ),
                  ),
                  SizedBox(
                    height:25,
                  ),

                  Text(
                    temp !=null ? temp.toString()+"\u00B0" :"Loading",
                    style:TextStyle(
                      color:Colors.white,
                      fontSize: 40.0,
                      fontWeight:FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding:EdgeInsets.only(top:20.0),
                    child:Text(
                      currently!= null ?currently.toString():"Loading ",
                      style:TextStyle(
                        color:Colors.white,
                        fontSize: 14.0,
                        fontWeight:FontWeight.w600,

                      ),

                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child:Padding(
                  padding:EdgeInsets.all(20.0),
                  child:ListView(

                    children:<Widget> [
                      ListTile(
                        leading:FaIcon(FontAwesomeIcons.thermometerHalf),
                        title:Text("Temperature"),
                        trailing:Text(temp !=null ? temp.toString()+"\u00B0" :"Loading"),
                      ),
                      ListTile(
                        leading:FaIcon(FontAwesomeIcons.cloud),
                        title:Text("Weather"),
                        trailing:Text(description!=null ? description.toString():"Loading"),
                      ),
                      ListTile(
                        leading:FaIcon(FontAwesomeIcons.sun),
                        title:Text("Humadity"),
                        trailing:Text(humidity!=null ?humidity.toString():"Loading"),
                      ),
                      ListTile(
                        leading:FaIcon(FontAwesomeIcons.wind),
                        title:Text("wind speed"),
                        trailing:Text(windspeed!=null ?windspeed.toString():"Loading"),
                      ),
                     
                    ],
                  ),

                ),
            )
          ],
        ),
      ),
    );
  }
  
}