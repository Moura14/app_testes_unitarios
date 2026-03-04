

import 'package:app_testes_unitarios/features/home/data/datasource/home_datasource.dart';
import 'package:app_testes_unitarios/features/home/data/model/cart_model.dart';
import 'package:app_testes_unitarios/features/home/data/model/product_details_model.dart';
import 'package:app_testes_unitarios/features/home/data/model/product_model.dart';

abstract class HomeRepositories {
  
  Future<ProductsResponseModel> getProduto();
  Future<ProductDetailsModel> getProdutoDetalhes({required int id});
  Future<ProductsResponseModel> pesquisaProduto({required String produto});
  Future<CartModel> addCart({required int id, required int quantity});
  Future<CartModel> getCart();
  
}

class HomeRepositoriesImpl implements HomeRepositories {

  final HomeDatasource homeDatasource;

  HomeRepositoriesImpl({required this.homeDatasource});


   @override
  Future<ProductsResponseModel> getProduto() async {
    return await homeDatasource.getProdutos();
  }

  
   @override
  Future<ProductDetailsModel> getProdutoDetalhes({required int id}) async {
    return await homeDatasource.getProdutoDetalhes(id: id);
  }

   @override
  Future<ProductsResponseModel> pesquisaProduto({required String produto}) async {
    return await homeDatasource.pesquisaProduto(produto: produto);
  }

  @override
  Future<CartModel> addCart({required int id, required int quantity}) async {
    return await homeDatasource.addCart(id: id, quantity: quantity);
  }

  @override
  Future<CartModel> getCart() async {
    return await homeDatasource.getCart();
  }

 
}