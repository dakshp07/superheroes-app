import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:superheroes_app/detailScreen.dart';
import 'dart:convert';

import 'package:superheroes_app/search.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.red[600],
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List superheroesData;
  fetchData() async {
    http.Response response = await http.get("https://akabab.github.io/superhero-api/api/all.json");
    setState(() {
      superheroesData = jsonDecode(response.body);
    });
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Superheroes App",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
        actions: [
          new IconButton(icon: new Icon(Icons.search,size: 30,color: Colors.white,), onPressed: (){
            showSearch(context: context, delegate: Search(data: superheroesData));
          })
        ],
      ),
      drawer: new Drawer(),
      body: superheroesData==null ? new Center(child: new CircularProgressIndicator(),) : 
      new GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
        ), 
        itemCount: 563,
        itemBuilder: (contetx , index)=>
        new Container(
          child: new GestureDetector(
            child: new Card(
              elevation: 8,
              shape: new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  new ClipRRect(child: new Image.network(superheroesData[index]["images"]["lg"],height: 155,fit: BoxFit.fitWidth),borderRadius: BorderRadius.all(Radius.circular(10)),),
                  new Text(superheroesData[index]["name"],style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold))
                ],
              ),
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>DetailsPage(
                name : superheroesData[index]["name"],
                imgurl: superheroesData[index]["images"]["lg"],
                fname: superheroesData[index]["biography"]["fullName"],
                pob: superheroesData[index]["biography"]["placeOfBirth"],
                fa : superheroesData[index]["biography"]["firstAppearance"],
                pub: superheroesData[index]["biography"]["publisher"],
                wk : superheroesData[index]["work"]["occupation"],
                il: superheroesData[index]["powerstats"]["intelligence"].toString(),
                speed: superheroesData[index]["powerstats"]["speed"].toString(),
                db: superheroesData[index]["powerstats"]["durability"].toString(),
                power: superheroesData[index]["powerstats"]["power"].toString(),
                combat: superheroesData[index]["powerstats"]["combat"].toString(),
                )));
            },
          ),
        )
        ),
    );
  }
}