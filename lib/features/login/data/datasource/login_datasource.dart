import 'dart:convert';

import 'package:app_testes_unitarios/features/login/data/model/login_model.dart';
import 'package:app_testes_unitarios/features/login/data/model/user_model.dart';
import 'package:http/http.dart' as http;

abstract class LoginDatasource {

  Future<LoginModel> login({required String username, required String password});
  Future<UserModel> getUser();
}

class LoginRemoteDataSourceImpl implements LoginDatasource {

  final http.Client client;


  LoginRemoteDataSourceImpl(this.client);

  @override
  Future<LoginModel> login({required String username, required String password}) async {
    final response = await client.post(Uri.parse('https://dummyjson.com/auth/login'),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      'username': username,
      'password': password,
    })    
    );
    
    if(response.statusCode == 200){
      print(response.body);
      return LoginModel.fromJson(jsonDecode(response.body));
      
    }else{
      print('Deu erro aqui mané: ${response.statusCode}');
      throw Exception('Erro ao fazer login');
    }
  }

  @override
  Future<UserModel> getUser() async {
    const token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJlbWlseXMiLCJlbWFpbCI6ImVtaWx5LmpvaG5zb25AeC5kdW1teWpzb24uY29tIiwiZmlyc3ROYW1lIjoiRW1pbHkiLCJsYXN0TmFtZSI6IkpvaG5zb24iLCJnZW5kZXIiOiJmZW1hbGUiLCJpbWFnZSI6Imh0dHBzOi8vZHVtbXlqc29uLmNvbS9pY29uL2VtaWx5cy8xMjgiLCJpYXQiOjE3NzIzMDM0MTAsImV4cCI6MTc3MjMwNzAxMH0.vFPVUzzRvbLPrsq7mDOHTcVvEud7-tflvWUInSFoN-k';
    final response = await client.get(Uri.parse('https://dummyjson.com/auth/me'),
    headers: {
      'Authorization': 'Bearer $token',
    }
    );
    if(response.statusCode == 200){
      print(response.body);
      return UserModel.fromJson(jsonDecode(response.body));
    }else{
      print('Deu erro aqui mané: ${response.statusCode}');
      throw Exception('Erro ao buscar usuário');
    }
  }

}