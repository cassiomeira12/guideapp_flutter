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
        'variation_d1': 'Variação a D-1',
        'first_variation': 'Variação a primeira data',
        'search_active': 'Pesquisar ativo',
        'active_not_found': 'Ativo não encontrado',
      },
    };
  }
}
