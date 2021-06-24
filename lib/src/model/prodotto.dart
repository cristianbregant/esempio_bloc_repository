import 'dart:convert';

Prodotto prodottoFromJson(String str) => Prodotto.fromJson(json.decode(str));

String prodottoToJson(Prodotto data) => json.encode(data.toJson());

List<Prodotto> listaProdottiFromMap(dynamic str) =>
    List<Prodotto>.from(str.map((x) => Prodotto.fromJson(x)));

class Prodotto {
  Prodotto({
    this.nome,
    this.prezzo,
  });

  String? nome;
  double? prezzo;

  factory Prodotto.fromJson(Map<String, dynamic> json) => Prodotto(
        nome: json["nome"],
        prezzo: json["prezzo"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "nome": nome,
        "prezzo": prezzo,
      };
}
