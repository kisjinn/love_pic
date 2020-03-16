import 'package:flutter/material.dart';
import 'source.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void maun() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SecondPage(),
  ));
}

class FirstPage extends StatelessWidget {
  var _categoryNameController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        color: Colors.white,
        child: Center(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(30.0),
              ),
              new Image.asset('images/download.png',
                  width: 200.0, height: 200.0),
              new ListTile(
                title: new TextFormField(
                  controller: _categoryNameController,
                  decoration: new InputDecoration(
                    labelText: 'Enter a Category',
                    hintText: 'eg: dogs,bikes,cats',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0)),
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
              ),
              new ListTile(
                title: new Material(
                  color: Colors.lightBlue,
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(25.0),
                  child: new MaterialButton(
                    height: 47.5,
                    onPressed: () {},
                    child: Text(
                      'Search',
                      style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
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

class SecondPage extends StatefulWidget {
  @override
  __SecondPageState createState() => __SecondPageState();
}

class __SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Photo Bay',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: new FutureBuilder(
          future: getPics(),
          builder: (context, snapshot) {
            Map data = snapshot.data;
            if (snapshot.hasError) {
              print(snapshot.error);
              return Text(
                'Failed to get response from server',
                style: TextStyle(color: Colors.red, fontSize: 22.0),
              );
            } else if (snapshot.hasData) {
              return new Center(
                child: new ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return new Column(
                        children: <Widget>[

                          new Container(
                            child: new InkWell(
                              onTap: (){},
                              child: new Image.network(
                                '${data['hits'][index]['largeImageURL']}'
                              ),
                            ),
                          ),
                          new Padding(padding: const EdgeInsets.all(5.0)),
                        ],
                      );
                    }),
              );
            }else  if(!snapshot.hasData){
              return new Center(child: CircularProgressIndicator(),);
            }
          }),
    );
  }
}

Future<Map> getPics() async {
  String url =
      'https://pixabay.com/api/?key=$ApiKey&q=yellow+flowers&image_type=photo&pretty=true';
  http.Response response = await http.get(url);
  return json.decode(response.body);
}
