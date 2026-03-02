

import 'package:app_testes_unitarios/features/home/data/datasource/home_datasource.dart';
import 'package:app_testes_unitarios/features/home/data/model/product_model.dart';
import 'package:app_testes_unitarios/features/login/data/datasource/login_datasource.dart';
import 'package:app_testes_unitarios/features/login/data/model/login_model.dart';
import 'package:app_testes_unitarios/features/login/data/model/user_model.dart';

abstract class HomeRepositories {
  
  Future<ProductsResponseModel> getProduto();
  
}

class HomeRepositoriesImpl implements HomeRepositories {

  final HomeDatasource homeDatasource;

  HomeRepositoriesImpl({required this.homeDatasource});


   @override
  Future<ProductsResponseModel> getProduto() async {
    return await homeDatasource.getProdutos();
  }


 
}