import 'dart:convert';

import 'package:esercizio_bloc_repository/src/helper/api_base_helper.dart';
import 'package:esercizio_bloc_repository/src/model/album.dart';

class AlbumRepository {
  ApiBaseHelper _helper = ApiBaseHelper();

  String locale = "it_IT";

  Future<List<Album>> getListaAlbum() async {
    final response = await _helper.get("/album");
    return listaAlbumsFromMap(response);
  }

  Future<Album> getAlbum(int id) async {
    final response = await _helper.post("/albums/$id", jsonEncode({"id": id}),
        header: {"Content-Type": "application/json", "locale": locale});
    return Album.fromJson(response);
  }
}
