import 'dart:async';

import 'package:esercizio_bloc_repository/src/helper/api_response.dart';
import 'package:esercizio_bloc_repository/src/model/album.dart';
import 'package:esercizio_bloc_repository/src/repository/album_repository.dart';

class AlbumBloc {
  late AlbumRepository _albumRepository;

  late StreamController<ApiResponse<List<Album>>> _listaAlbumController;

  StreamSink<ApiResponse<List<Album>>> get listaAlbumsSink =>
      _listaAlbumController.sink;

  Stream<ApiResponse<List<Album>>> get listaAlbumsStream =>
      _listaAlbumController.stream;

  AlbumBloc() {
    _listaAlbumController = StreamController<ApiResponse<List<Album>>>();
    _albumRepository = AlbumRepository();
  }

  getListaAlbums() async {
    listaAlbumsSink.add(ApiResponse.loading("Caricamento albums"));

    try {
      List<Album> _lista = await _albumRepository.getListaAlbum();

      listaAlbumsSink.add(ApiResponse.completed(_lista));
    } catch (error) {
      listaAlbumsSink.add(ApiResponse.error(error.toString()));
    }
  }

  dispose() {
    _listaAlbumController.close();
  }
}
