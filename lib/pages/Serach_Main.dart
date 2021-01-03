import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/pages/Search.dart';

class SearchMain extends StatefulWidget {
  @override
  _SearchMainState createState() => _SearchMainState();
}

class _SearchMainState extends State<SearchMain> {
  var queryResultSet = [];
  var tempSearchStore = [];

  initiateSearch(value) {
    print("initiated with value $value");
    if (value.length == 0) {
      setState(() {
        queryResultSet = [];
        tempSearchStore = [];
      });
    }

    var capitalizedValue =
        value.substring(0, 1).toUpperCase() + value.substring(1);

    print(capitalizedValue);
    if (queryResultSet.length == 0 && value.length >= 1) {
      SearchService().searchByName(value).then((QuerySnapshot docs) {
        for (int i = 0; i < docs.documents.length; i++) {
          setState(() {
            queryResultSet.add(docs.documents[i].data);
          });
        }

        print("Queried" + queryResultSet.toString());
      });
    } else {
      tempSearchStore = [];
      queryResultSet.forEach((element) {
        if (element['prodName'].contains(capitalizedValue)) {
          setState(() {
            tempSearchStore.add(element);
          });
        }
//        print(tempSearchStore);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.pink,
          title: Text('Firestore search'),
        ),
        body: ListView(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (val) {
                initiateSearch(val);
              },
              decoration: InputDecoration(
                  prefixIcon: IconButton(
                    color: Colors.black,
                    icon: Icon(Icons.arrow_back),
                    iconSize: 20.0,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  contentPadding: EdgeInsets.only(left: 25.0),
                  hintText: 'Search by name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0))),
            ),
          ),
          SizedBox(height: 10.0),
          /*ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount:queryResultSet.length ,
              itemBuilder: (context,index){
                return Text((queryResultSet[index]).data['prodName'].toString());

              })*/
          ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: queryResultSet.map((element) {
                return buildResultCard(element);
              }).toList()),

          /* GridView.count(
              padding: EdgeInsets.only(left: 1.0, right: 1.0),
              crossAxisCount: 4,
              crossAxisSpacing: 1.0,
              mainAxisSpacing: 1.0,
              primary: false,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: queryResultSet.map((element) {
                return buildResultCard(element);
              }).toList()),*/
        ]));
  }
}

Widget buildResultCard(data) {
  return Card(
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
      elevation: 2.0,
      child: Container(
          width: 400,
          height: 100,
          child: Center(
              child: Text(
            data['prodName'],
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            ),
          ))));
}
