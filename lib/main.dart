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
  var _categoryNameController = new TextEditingController();
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
              new ListTile(
                title: new TextFormField(
                  controller: _categoryNameController,
                  decoration: new InputDecoration(
                    labelText: 'Enter a Category',
                    hintText: 'eg: dogs,bikes,cats',
                  ),
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
