import 'package:app_testes_unitarios/features/login/data/model/login_model.dart';
import 'package:app_testes_unitarios/features/login/data/model/user_model.dart';
import 'package:app_testes_unitarios/features/login/data/repositories/login_repositories.dart';

class LoginUsecase {


  final LoginRepositories repositories;

  LoginUsecase({required this.repositories});

  Future<UserModel> login({required String email, required String password}) async {
    return await repositories.login(email: email, password: password);
  }

  Future<UserModel> register({required String nome, required String phone, required String email, required String password}) async {
    return await repositories.register(nome: nome, phone: phone, email: email, password: password);
  }



}