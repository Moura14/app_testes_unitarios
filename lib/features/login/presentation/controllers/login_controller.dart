import 'package:app_testes_unitarios/features/login/data/model/login_model.dart';
import 'package:app_testes_unitarios/features/login/data/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
Future<LoginModel?> login(String username, String password) async {
  isLoading = true;

  try {
    user = await loginUseCase.login(email: username, password: password);

    if (user != null) {
      await loadUserInfo();
    }

    return user;

  } catch (e) {
    errorMessage = e.toString();
    return null;

  } finally {
    isLoading = false;
  }
}

  @action
  Future<UserModel?> cadastroUsuario({required String nome, required String phone, required String email, required String password}) async {
    isLoading = true;
    try {
      final registeredUser = await loginUseCase.register(
        nome: nome,
        phone: phone,
        email: email,
        password: password,
      );

      userInfo = registeredUser;
      return registeredUser;
    } catch (e) {
      errorMessage = e.toString();
      return null;
    } finally {
      isLoading = false;
    }
  }


  @action
  Future<void> loadUserInfo() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;

    if (firebaseUser == null) {
      throw Exception("Usuário não autenticado");
    }

    final docRef = FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser.uid);

    final doc = await docRef.get();

    if (!doc.exists) {
      final fallbackUser = UserModel(
        id: firebaseUser.uid,
        name: firebaseUser.displayName ?? '',
        phone: '',
        email: firebaseUser.email ?? '',
      );

      await docRef.set({
        ...fallbackUser.toJson(),
        'createdAt': DateTime.now(),
      });

      userInfo = fallbackUser;
      return;
    }

    final data = doc.data();
    if (data != null) {
      userInfo = UserModel.fromJson(data, doc.id);
    }
  }


  @action
  Future<void> logout() async {
    isLoading = true;
    try {
      await loginUseCase.logout();
      user = null;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
    }
  }

}