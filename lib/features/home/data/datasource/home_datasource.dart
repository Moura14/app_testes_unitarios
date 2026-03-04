import 'dart:convert';

import 'package:app_testes_unitarios/features/home/data/model/cart_model.dart';
import 'package:app_testes_unitarios/features/home/data/model/product_details_model.dart';
import 'package:app_testes_unitarios/features/home/data/model/product_model.dart';
import 'package:http/http.dart' as http;

abstract class HomeDatasource {
  
  Future<ProductsResponseModel> getProdutos();
  Future<ProductDetailsModel> getProdutoDetalhes({required int id});
  Future<ProductsResponseModel> pesquisaProduto({required String produto});
  Future<CartModel> addCart({required int id, required int quantity});
  Future<CartModel> getCart();
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


  @override
  Future<ProductsResponseModel> pesquisaProduto({required String produto}) async {
    final response = await client.get(
      Uri.parse('https://dummyjson.com/products/search?q=$produto'),
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
  Future<CartModel> addCart({required int id, required int quantity}) async {
    final response = await client.post(Uri.parse('https://dummyjson.com/auth/login'),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      'id': id,
      'quantity': quantity,
    })    
    );
    
    if(response.statusCode == 200){
      print(response.body);
      return CartModel.fromJson(jsonDecode(response.body));
      
    }else{
      print('Deu erro aqui mané: ${response.statusCode}');
      throw Exception('Erro ao fazer login');
    }
  }

  @override
  Future<CartModel> getCart() async {
    final response = await client.get(
      Uri.parse('https://dummyjson.com/carts'),
    );
    if (response.statusCode == 200) {
      print(response.body);
      final decoded = jsonDecode(response.body);
      // A API retorna {"carts": [...]} então pega o primeiro carrinho
      return CartModel.fromJson(decoded['carts'][0]);
    } else {
      print('Deu erro aqui mané: ${response.statusCode}');
      throw Exception('Erro ao buscar produto');
    }
  }
}
