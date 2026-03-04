import 'dart:convert';

import 'package:app_testes_unitarios/features/home/data/model/product_details_model.dart';
import 'package:app_testes_unitarios/features/home/data/model/product_model.dart';
import 'package:http/http.dart' as http;

abstract class HomeDatasource {
  
  Future<ProductsResponseModel> getProdutos();
  Future<ProductDetailsModel> getProdutoDetalhes({required int id});
}

class HomeRemoteDataSourceImpl implements HomeDatasource {
  final http.Client client;

  HomeRemoteDataSourceImpl(this.client);

  @override
  Future<ProductsResponseModel> getProdutos() async {
    final response = await client.get(
      Uri.parse('https://dummyjson.com/products'),
    );
    if (response.statusCode == 200) {
      print(response.body);
      return ProductsResponseModel.fromJson(jsonDecode(response.body));
    } else {
      print('Deu erro aqui mané: ${response.statusCode}');
      throw Exception('Erro ao buscar produto');
    }
  }

  @override
  Future<ProductDetailsModel> getProdutoDetalhes({required int id}) async {
    final response = await client.get(
      Uri.parse('https://dummyjson.com/products/$id'),
    );
    if (response.statusCode == 200) {
      print(response.body);
      return ProductDetailsModel.fromJson(jsonDecode(response.body));
    } else {
      print('Deu erro aqui mané: ${response.statusCode}');
      throw Exception('Erro ao buscar produto');
    }
  }
}
