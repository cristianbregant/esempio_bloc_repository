// To parse this JSON data, do
//
//     final album = albumFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Album> albumFromJson(String str) =>
    List<Album>.from(json.decode(str).map((x) => Album.fromJson(x)));

String albumToJson(List<Album> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<Album> listaAlbumsFromMap(dynamic str) =>
    List<Album>.from(str.map((x) => Album.fromJson(x)));

class Album {
  Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  int userId;
  int id;
  String title;

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        userId: json["userId"] == null ? null : json["userId"],
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId == null ? null : userId,
        "id": id == null ? null : id,
        "title": title == null ? null : title,
      };
}
