import 'dart:io';
import 'pages/page1.dart';
import 'pages/page2.dart';
import 'pages/page3.dart';

import 'package:flutter/material.dart';

import 'pages/page4.dart';
class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: <String,WidgetBuilder>{
        // When navigating to the "/a" route, build the Settings Page widget.
        '/a':(BuildContext context) => new Page1("Settings Page"),
         // When navigating to the "/b" route, build the Notification widget. 
        '/b':(BuildContext context) => new Page2("Notification Page"),
         // When navigating to the "/c" route, build the Payment Page widget.
        '/c':(BuildContext context) => new Page3("Payment Page"),
        '/d':(BuildContext context) => new Page4("My Acoount Info"),
        
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
      ),
      drawer: navigationdrawer(),
      body: Center(
       child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          ],
        ),
      ),
  
    );
  }
}

class navigationdrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
return Drawer(
  child: new ListView(
            children: <Widget>[
              //useraccountsdrawerheader is used to show user accounts details on drawer.
              new UserAccountsDrawerHeader(
                 accountName: new Text("Mg"),
                 accountEmail: new Text("gmayur@gmail.com"),
                 currentAccountPicture: new CircleAvatar(
                   backgroundColor: Theme.of(context).platform==TargetPlatform.iOS 
                   ? Colors.pink:Colors.white,
                   child: new Text("1"),
                 ),
                 otherAccountsPictures: <Widget>[
                   new CircleAvatar(
                      backgroundColor: Theme.of(context).platform==TargetPlatform.iOS 
                   ? Colors.pink:Colors.white,
                      child: new Text("2"),
                   ),
                 ],
              ),
              //ListTite widget is used to create to items in list view.
              new ListTile(
                   title: new Text("Settings"),//Text widget is used to define text.
                   //onTap widget is used for providing triggering an event.
                   onTap: () {
                     Navigator.of(context).pop(); // this statement is used to close the drawer.
                     Navigator.of(context).pushNamed("/a"); // this statement is used navigate to specified route or page using named route='/a'.
                     },
              ),
              
              new ListTile(
                   title: new Text("My Account"),
                   
                   onTap: (){
                     Navigator.of(context).pop();
                     Navigator.of(context).pushNamed("/d");
                   },
              ),

               new ListTile(
                   title: new Text("Notifications"),
                   
                   onTap: (){
                     Navigator.of(context).pop();
                     Navigator.of(context).pushNamed("/b");
                   },
              ),

                new ListTile(
                   title: new Text("Payment method"),
                   
                   onTap: (){
                     Navigator.of(context).pop();
                     Navigator.of(context).pushNamed("/c");
                   },
              ),

            // Divider widget is used for separating the items or widgets.
              new Divider(),


               new ListTile(
                   title: new Text("SignOut"),
                   leading: Icon(Icons.exit_to_app),
                   onTap: () 
                   {
                     //Navigator.of(context).pop();
                     exit(0);
                   },
              ),
            
               new ListTile(
                   title: new Text("Close"),
                   //trailing: new Icon(Icons.close),//Icon widget is used to set Icons for particular items.
                   onTap: ()=> Navigator.of(context).pop(),
              ),
            
              ],
          ),
        
        
    );

}
}