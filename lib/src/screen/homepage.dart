import 'package:esercizio_bloc_repository/src/bloc/album_bloc.dart';
import 'package:esercizio_bloc_repository/src/helper/api_response.dart';
import 'package:esercizio_bloc_repository/src/model/album.dart';

import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => new _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late AlbumBloc _albumBloc;
  int filtro = 0;

  @override
  void initState() {
    _albumBloc = AlbumBloc();
    _albumBloc.getListaAlbums();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista albums"),
        actions: [
          IconButton(
              onPressed: () => _albumBloc.getListaAlbums(),
              icon: Icon(Icons.refresh))
        ],
      ),
      body: Container(
        child: StreamBuilder<ApiResponse<List<Album>>>(
          stream: _albumBloc.listaAlbumsStream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Container();
            }

            switch (snapshot.data!.status) {
              case Status.LOADING:
                return Center(
                  child: CircularProgressIndicator(),
                );
              case Status.COMPLETED:
                List<Album> _listaAlbum = snapshot.data!.data;
                return ListView.builder(
                    itemCount: _listaAlbum.length,
                    itemBuilder: (_, i) {
                      Album _album = _listaAlbum.elementAt(i);
                      return ListTile(
                        title: Text(_album.title),
                      );
                    });

              case Status.ERROR:
                WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            title: Text("ATTENZIONE"),
                            content: Text(snapshot.data!.message),
                          ));
                });

                return Center(
                  child: Text(snapshot.data!.message),
                );
            }
          },
        ),
      ),
    );
  }
}
