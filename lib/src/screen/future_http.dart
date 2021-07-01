import 'package:esercizio_bloc_repository/src/model/album.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FutureHTTP extends StatefulWidget {
  @override
  _FutureHTTPState createState() => new _FutureHTTPState();
}

class _FutureHTTPState extends State<FutureHTTP> {
  late Future<List<Album>> _listaAlbum;

  Future<List<Album>> getListaAlbum() async {
    print("GetListaAlbum");
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/albums"));

    if (response.statusCode == 200) {
      return albumFromJson(response.body);
    } else {
      throw response.body;
    }
  }

  @override
  void initState() {
    _listaAlbum = getListaAlbum();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Future HTTP"),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  _listaAlbum = getListaAlbum();
                });
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () {
          setState(() {
            _listaAlbum = getListaAlbum();
          });
          return Future<void>.value(() {});
        },
        child: FutureBuilder<List<Album>>(
            future: _listaAlbum,
            builder: (context, snapshot) {
              print(snapshot.connectionState.toString());

              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Container();
                case ConnectionState.waiting:
                case ConnectionState.active:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                case ConnectionState.done:
                  if (snapshot.hasError) return Text(snapshot.error.toString());

                  List<Album> _listaAlbum = snapshot.data!;
                  return Container(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          Album _album = _listaAlbum.elementAt(index);
                          return ListTile(
                            title: Text(_album.title),
                          );
                        },
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: _listaAlbum.length),
                  );
              }
            }),
      ),
    );
  }
}
