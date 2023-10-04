// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'My First Fultter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body:Column(
        children: [
          Container(

          width: 300,
          height: 150,margin: EdgeInsets.only(left: 50, top: 25),
          decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(13),
            border: Border.all(
              width: 2,
              color: Colors.black
            ),
            boxShadow: [
              BoxShadow( blurRadius: 18,
              spreadRadius: 4,
              color: Colors.pink),
            ]
          ),
            child: const Padding(
              padding: EdgeInsets.only(left: 15, top: 55),
              child: Text('Hello This is my First IOS app',
                style: TextStyle(fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold),
            )),
          ),
          
          

         Padding(
           padding: const EdgeInsets.only(top: 30, left:20),
           child: ElevatedButton(onPressed: (){
             Fluttertoast.showToast(msg: "Clicked Button and this is toast"
             ,toastLength: Toast.LENGTH_SHORT,
               gravity:ToastGravity.BOTTOM,
               timeInSecForIosWeb: 2,
                 textColor: Colors.white,
               fontSize: 15
             );
           }, child: Text('Click ME', style: TextStyle(),)),
         ),

        Card(
          child: GestureDetector(
            onTap: () async {
              _laucherUrl("https://www.google.com");
            },
            child: Text("Click to Open WebLINK")
          ),
        ),


        ],
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
Future<void> _laucherUrl(String urlString) async{
  if (await canLaunch(urlString)) {
    await launch(urlString);
  } else {
    throw 'Could not launch $urlString';
  }
}