import 'package:esercizio_bloc_repository/src/helper/api_base_helper.dart';
import 'package:esercizio_bloc_repository/src/model/prodotto.dart';

class ProdottiRepository {
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<List<Prodotto>> getListaProdotti() async {
    final response = await _helper.get("/prodotti");
    return listaProdottiFromMap(response);
  }
}
