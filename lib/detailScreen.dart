import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {

    final String name;
    final String imgurl;
    final String fname;
    final String pob;
    final String fa;
    final String pub;
    final String wk;
    final String il;
    final String speed;
    final String db;
    final String power;
    final String combat;
    DetailsPage({this.name,this.imgurl,this.fname,this.fa,this.pob,this.pub,this.wk,this.combat,this.db,this.il,this.power,this.speed});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(widget.name,style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),)
      ),
      body:new SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new Row(
              children: [
              new Padding(padding: const EdgeInsets.symmetric(horizontal: 38)),
              new ClipRRect(
              child: new Image.network(widget.imgurl,height: 350,fit: BoxFit.fitWidth),borderRadius: BorderRadius.all(Radius.circular(10)),
            )
            ],
          ),
          new Row(
            children: [
              new Padding(padding : const EdgeInsets.symmetric(horizontal: 5)),
              new Text(widget.name,style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold)),
              new Text(" ("+widget.fname+")",style: TextStyle(fontSize: 25,color: Colors.grey[700],fontWeight: FontWeight.bold),)
            ],
          ),
          new Padding(padding: const EdgeInsets.only(top: 5),),
          new Text(widget.pob,style: TextStyle(fontSize: 20,color: Colors.black),),
          new Padding(padding: const EdgeInsets.only(top: 5),),
          new Text(widget.fa,style: TextStyle(fontSize: 20,color: Colors.black),),
          new Padding(padding: const EdgeInsets.only(top: 5),),
          new Text(widget.pub,style: TextStyle(fontSize: 20,color: Colors.black),),
          new Padding(padding: const EdgeInsets.only(top: 5),),
          new Row(
            children: [
              new Padding(padding : const EdgeInsets.symmetric(horizontal: 5)),
              new Text("Work",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold)),
            ],
          ),
          new Padding(padding: const EdgeInsets.only(top: 5),),
          new Text(widget.wk,style: TextStyle(fontSize: 20,color: Colors.black),),
          new Padding(padding: const EdgeInsets.only(top: 5),),
          new Row(
            children: [
              new Padding(padding : const EdgeInsets.symmetric(horizontal: 5)),
              new Text("Powerstats",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold)),
            ],
          ),
          new Column(
            children: [
              new Row(
                children: [
                  new Text("Intelligence:",style: TextStyle(fontSize: 20,color: Colors.black)),
                  new Padding(padding: const EdgeInsets.symmetric(horizontal: 3)),
                  new MaterialButton(
                    color: Colors.green[800],
                    shape: new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: new Text(widget.il,style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold)),
                    onPressed: (){},
                  )
                ],
              ),
              new Padding(padding : const EdgeInsets.only(top:5)),
              new Row(
                children: [
                  new Text("Speed:",style: TextStyle(fontSize: 20,color: Colors.black)),
                  new Padding(padding: const EdgeInsets.symmetric(horizontal: 3)),
                  new MaterialButton(
                    color: Colors.yellow,
                    shape: new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: new Text(widget.speed,style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold)),
                    onPressed: (){},
                  )
                ],
              ),
              new Padding(padding : const EdgeInsets.only(top:5)),
              new Row(
                children: [
                  new Text("Durability:",style: TextStyle(fontSize: 20,color: Colors.black)),
                  new Padding(padding: const EdgeInsets.symmetric(horizontal: 3)),
                  new MaterialButton(
                    color: Colors.blue[800],
                    shape: new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: new Text(widget.speed,style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold)),
                    onPressed: (){},
                  )
                ],
              ),
              new Padding(padding : const EdgeInsets.only(top:5)),
              new Row(
                children: [
                  new Text("Power:",style: TextStyle(fontSize: 20,color: Colors.black)),
                  new Padding(padding: const EdgeInsets.symmetric(horizontal: 3)),
                  new MaterialButton(
                    color: Colors.red[800],
                    shape: new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: new Text(widget.power,style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold)),
                    onPressed: (){},
                  )
                ],
              ),
              new Padding(padding : const EdgeInsets.only(top:5)),
              new Row(
                children: [
                  new Text("Combat:",style: TextStyle(fontSize: 20,color: Colors.black)),
                  new Padding(padding: const EdgeInsets.symmetric(horizontal: 3)),
                  new MaterialButton(
                    color: Colors.purple[800],
                    shape: new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: new Text(widget.speed,style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold)),
                    onPressed: (){},
                  )
                ],
              ),
            ],
          )
          ],
        ),
      )
    );
  }
}