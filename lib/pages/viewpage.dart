
import 'package:flutter/material.dart';
import 'package:movieapp_frontend/model/postmodel.dart';
import 'package:movieapp_frontend/service/servicemodel.dart';


class viewpage extends StatefulWidget {
  const viewpage({super.key});

  @override
  State<viewpage> createState() => _viewpageState();
}

class _viewpageState extends State<viewpage> {
  Future<List<Posts>> ? data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data=PostApiService().getPosts();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back),

        ),
        body: FutureBuilder(
            future:data ,
            builder: (context,snapshot){
              if(snapshot.hasData &&snapshot.data!.isNotEmpty){
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (value,index){
                      return Card(
                        child: Column(
                          children: [
                            ListTile(
                              title: Text("Movie Name :"+snapshot.data![index].movieName.toString()),
                              subtitle: Text("Actor name:"+snapshot.data![index].actorName.toString()+"\n"+"Actoress. :"+snapshot.data![index].actoressName.toString()+"\n"+"Director Name. :"+snapshot.data![index].directorName.toString()+"\n"+"Released year. :"+snapshot.data![index].releasedYear.toString()+"\n"),
                              leading: CircleAvatar(
                                child:Text(snapshot.data![index].movieName.toString()[0]) ,
                              ),
                            )
                          ],
                        ),
                      );
                    }
                );
              }
              else{
                return Text("Fetching data");
              }
            }
        )
    );
  }
}
