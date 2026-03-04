

import 'package:app_testes_unitarios/features/home/data/datasource/home_datasource.dart';
import 'package:app_testes_unitarios/features/home/data/model/product_details_model.dart';
import 'package:app_testes_unitarios/features/home/data/model/product_model.dart';

abstract class HomeRepositories {
  
  Future<ProductsResponseModel> getProduto();
  Future<ProductDetailsModel> getProdutoDetalhes({required int id});
  
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


 
}