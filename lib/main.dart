  import 'package:flutter/material.dart';

void maun(){
  runApp(
     new MaterialApp(
       debugShowCheckedModeBanner: false,
       home: FirstPage(),
     )
  );
}



class FirstPage  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        color: Colors.white,
        child: Center(
          child: ListView(
            children: <Widget>[
              Padding(padding: const EdgeInsets.all(30.0), ),
              new Image.asset('images/download.png',
              width: 200.0,
              height: 200.0),


            ],
          ),
        ),
      ),
    );
  }
}
