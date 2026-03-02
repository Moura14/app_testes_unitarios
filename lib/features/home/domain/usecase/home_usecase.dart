import 'package:app_testes_unitarios/features/home/data/model/product_model.dart';
import 'package:app_testes_unitarios/features/home/data/repositories/home_repositorie.dart';

class HomeUsecase {
  final HomeRepositories repositories;

  HomeUsecase({required this.repositories});

  Future<ProductsResponseModel> getProdutos() async {
    return await repositories.getProduto();
  }
}
