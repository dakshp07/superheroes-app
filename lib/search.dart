import 'package:flutter/material.dart';
import 'detailScreen.dart';

class Search extends SearchDelegate{

  final List data;
  Search({this.data});

  @override
  List<Widget> buildActions(BuildContext context) {
      // TODO: implement buildActions
      return[
        IconButton(icon: Icon(Icons.clear), onPressed: (){
          query="";
        })
      ];
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      // TODO: implement buildLeading
      return
      IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
        Navigator.pop(context);
      });
    }
  
    @override
    Widget buildResults(BuildContext context) {
      // TODO: implement buildResults
      return
      Container();
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final list=query.isEmpty ? data : data.where((element) => element['name'].toString().toLowerCase().startsWith(query)).toList();
    return new GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
        ), 
        itemCount: list.length,
        itemBuilder: (contetx , index)=>
        new Container(
          child: new GestureDetector(
            child: new Card(
              elevation: 8,
              shape: new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  new ClipRRect(child: new Image.network(list[index]["images"]["lg"],height: 155,fit: BoxFit.fitWidth),borderRadius: BorderRadius.all(Radius.circular(10)),),
                  new Text(list[index]["name"],style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold))
                ],
              ),
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>DetailsPage(
                name : list[index]["name"],
                imgurl: list[index]["images"]["lg"],
                fname: list[index]["biography"]["fullName"],
                pob: list[index]["biography"]["placeOfBirth"],
                fa : list[index]["biography"]["firstAppearance"],
                pub: list[index]["biography"]["publisher"],
                wk : list[index]["work"]["occupation"],
                il: list[index]["powerstats"]["intelligence"].toString(),
                speed: list[index]["powerstats"]["speed"].toString(),
                db: list[index]["powerstats"]["durability"].toString(),
                power: list[index]["powerstats"]["power"].toString(),
                combat: list[index]["powerstats"]["combat"].toString(),
                )));
            },
          ),
        )
        );
  }

}