import 'package:app_testes_unitarios/features/login/data/model/login_model.dart';
import 'package:app_testes_unitarios/features/login/data/model/user_model.dart';
import 'package:mobx/mobx.dart';
import 'package:app_testes_unitarios/features/login/domain/usecase/login_usecase.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  final LoginUsecase loginUseCase;

  _LoginController(this.loginUseCase);

  @observable
  bool isLoading = false;


  @observable
  String? errorMessage;

  @observable
  LoginModel? user;

  @observable
  UserModel? userInfo;


  @action
  Future<void> login(String username, String password) async {
    isLoading = true;

    try{
      user = await loginUseCase.login(username: username, password: password);
      print(user);
    }catch(e){
      errorMessage = e.toString();
    }
    isLoading = false;
  }

  @action
  Future<void> getUser() async {
    isLoading = true;

    try{
      userInfo = await loginUseCase.getUser();
      print(userInfo);
    }catch(e){
      errorMessage = e.toString();
    }
    isLoading = false;

  }

}