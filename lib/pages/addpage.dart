

import 'package:flutter/material.dart';
import 'package:movieapp_frontend/service/servicemodel.dart';

class addpage extends StatefulWidget {
  const addpage({super.key});

  @override
  State<addpage> createState() => _addpageState();
}

class _addpageState extends State<addpage> {
  @override

  TextEditingController movieName =new TextEditingController();
  TextEditingController actorName =new TextEditingController();
  TextEditingController  actoressName =new TextEditingController();
  TextEditingController  directorName =new TextEditingController();
  TextEditingController  releasedYear =new TextEditingController();

  void SendValuetoApi() async
  {
    var relesedYear;
    final response =await PostApiService().sendData(movieName.text, actorName.text, actoressName.text, 
        directorName.text, 
        relesedYear.text.toString(),
    );
    if (response["status"] == "success") {

      print("Successfully added");

    }
    else{
      print("error");
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            TextField(
              controller:movieName,
              decoration: InputDecoration(
                  hintText: "Movie Name ",
                  border: OutlineInputBorder()
              ),
            ),
            TextField(
              controller: actorName,
              decoration: InputDecoration(
                  hintText: "actor name",
                  border: OutlineInputBorder()
              ),
            ),
            TextField(
              controller:actoressName,
              decoration: InputDecoration(
                  hintText: "actoress Name",
                  border: OutlineInputBorder()
              ),
            ),
            TextField(
              controller:directorName,
              decoration: InputDecoration(
                  hintText: "director Name",
                  border: OutlineInputBorder()
              ),
            ),
            TextField(
              controller:releasedYear,
              decoration: InputDecoration(
                  hintText: "year",
                  border: OutlineInputBorder()
              ),
            ),




            SizedBox(
              width: 250,
              height: 60,
              child: ElevatedButton(

                  onPressed: SendValuetoApi, child: Text("send")),
            ),
          ],
        ),
      ),
    );
  }
}
