import 'dart:async';

import 'package:esercizio_bloc_repository/src/helper/api_response.dart';
import 'package:esercizio_bloc_repository/src/model/prodotto.dart';
import 'package:esercizio_bloc_repository/src/repository/prodotti_repository.dart';

class ProdottiBloc {
  late ProdottiRepository _prodottiRepository;

  late StreamController<ApiResponse<List<Prodotto>>> _listaProdottiController;
}
