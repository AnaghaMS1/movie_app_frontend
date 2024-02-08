// To parse this JSON data, do
//
//     final posts = postsFromJson(jsonString);

import 'dart:convert';

List<Posts> postsFromJson(String str) => List<Posts>.from(json.decode(str).map((x) => Posts.fromJson(x)));

String postsToJson(List<Posts> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Posts {
  String id;
  String movieName;
  String actorName;
  String actoressName;
  String directorName;
  String releasedYear;
  int v;

  Posts({
    required this.id,
    required this.movieName,
    required this.actorName,
    required this.actoressName,
    required this.directorName,
    required this.releasedYear,
    required this.v,
  });

  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
    id: json["_id"],
    movieName: json["movieName"],
    actorName: json["actorName"],
    actoressName: json["actoressName"],
    directorName: json["directorName"],
    releasedYear: json["releasedYear"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "movieName": movieName,
    "actorName": actorName,
    "actoressName": actoressName,
    "directorName": directorName,
    "releasedYear": releasedYear,
    "__v": v,
  };
}
