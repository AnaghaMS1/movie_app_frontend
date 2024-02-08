import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:movieapp_frontend/model/postmodel.dart';

class PostApiService{
  Future<dynamic> sendData(
      String movieName,
      String actorName,
      String actoressName,
      String directorName,
      String relesedYear,

      ) async{
    var client=http.Client();
    var apiUrl=Uri.parse("http://192.168.118.18:3001/movie/add");

    var response = await client.post(apiUrl,
        headers: <String,String>{
          "Content-Type":"application/json ; charset=UTF-8"
        },
        body: jsonEncode(<String,String>
        {

          "movieName":movieName,
          "actorName":actorName,
          "actoressName":actoressName,
          "directorName":directorName,
          "releasedYear":relesedYear.toString()


        })

    );
    if(response.statusCode==200){
      return jsonDecode(response.body);

    }
    else{
      throw Exception("failed to send data");
    }


  }
  Future<List<Posts>> getPosts() async{
    var client =http.Client();
    var apiUrl=Uri.parse("http://192.168.118.18:3001/movie/viewall");
    var response = await client.get(apiUrl);
    if(response.statusCode==200)
    {
      return postsFromJson(response.body);
    }
    else
    {
      return [];
    }

  }

}