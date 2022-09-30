import 'package:get/get.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys {
    return {
      'pt_BR': {
        'price_variation': 'Variação de Preço',
        'variation_graph': 'Variação de Gráfico',
        'day': 'Dia',
        'date': 'Data',
        'price': 'Valor',
        'variation_d1': 'Var D-1',
        'first_variation': 'Var 1º',
        'search_active': 'Pesquisar ativo',
        'active_not_found': 'Ativo não encontrado',
        'subtitle': 'Legenda',
        'obs_variation_d1': 'Var D-1: variação em relaçào a D-1',
        'obs_first_variation': 'Var 1º: variação em relação a primeira data',
      },
    };
  }
}
