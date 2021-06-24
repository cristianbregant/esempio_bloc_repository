import 'package:esercizio_bloc_repository/src/helper/api_response.dart';
import 'package:esercizio_bloc_repository/src/model/prodotto.dart';
import 'package:esercizio_bloc_repository/src/repository/prodotti_repository.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => new _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista prodotti"),
      ),
      body: Container(
        child: StreamBuilder<ApiResponse<List<Prodotto>>>(
          stream: null,
          builder: (context, snapshot) {
            switch (snapshot.data!.status) {
              case Status.LOADING:
                return Center(
                  child: CircularProgressIndicator(),
                );
              case Status.COMPLETED:
                List<Prodotto> _listaProdotti = snapshot.data!.data;
                return ListView.builder(
                    itemCount: _listaProdotti.length,
                    itemBuilder: (_, i) {
                      Prodotto _prodotto = _listaProdotti.elementAt(i);
                      return ListTile(
                        title: Text(_prodotto.nome.toString()),
                        subtitle: Text(_prodotto.prezzo.toString()),
                      );
                    });

              case Status.ERROR:
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
