import 'package:app_testes_unitarios/features/home/data/model/cart_model.dart';
import 'package:app_testes_unitarios/features/home/data/model/product_details_model.dart';
import 'package:app_testes_unitarios/features/home/data/model/product_model.dart';
import 'package:app_testes_unitarios/features/home/data/repositories/home_repositorie.dart';

class HomeUsecase {
  final HomeRepositories repositories;

  HomeUsecase({required this.repositories});

  Future<ProductsResponseModel> getProdutos() async {
    return await repositories.getProduto();
  }

  Future<ProductDetailsModel> getProdutoDetalhes({required int id}) async {
    return await repositories.getProdutoDetalhes(id: id);
  }

  Future<ProductsResponseModel> pesquisaProduto({required String produto}) async {
    return await repositories.pesquisaProduto(produto: produto);
  }

 
  Future<CartModel> addCart({required int id, required int quantity}) async {
    return await repositories.addCart(id: id, quantity: quantity);
  }

  Future<CartModel> getCart() async {
    return await repositories.getCart();
  }

}
