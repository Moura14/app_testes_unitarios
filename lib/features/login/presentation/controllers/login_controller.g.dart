// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on _LoginController, Store {
  late final _$isLoadingAtom = Atom(
    name: '_LoginController.isLoading',
    context: context,
  );

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorMessageAtom = Atom(
    name: '_LoginController.errorMessage',
    context: context,
  );

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$userAtom = Atom(name: '_LoginController.user', context: context);

  @override
  LoginModel? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(LoginModel? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$userInfoAtom = Atom(
    name: '_LoginController.userInfo',
    context: context,
  );

  @override
  UserModel? get userInfo {
    _$userInfoAtom.reportRead();
    return super.userInfo;
  }

  @override
  set userInfo(UserModel? value) {
    _$userInfoAtom.reportWrite(value, super.userInfo, () {
      super.userInfo = value;
    });
  }

  late final _$loginAsyncAction = AsyncAction(
    '_LoginController.login',
    context: context,
  );

  @override
  Future<LoginModel?> login(String username, String password) {
    return _$loginAsyncAction.run(() => super.login(username, password));
  }

  late final _$cadastroUsuarioAsyncAction = AsyncAction(
    '_LoginController.cadastroUsuario',
    context: context,
  );

  @override
  Future<UserModel?> cadastroUsuario({
    required String nome,
    required String phone,
    required String email,
    required String password,
  }) {
    return _$cadastroUsuarioAsyncAction.run(
      () => super.cadastroUsuario(
        nome: nome,
        phone: phone,
        email: email,
        password: password,
      ),
    );
  }

  late final _$loadUserInfoAsyncAction = AsyncAction(
    '_LoginController.loadUserInfo',
    context: context,
  );

  @override
  Future<void> loadUserInfo() {
    return _$loadUserInfoAsyncAction.run(() => super.loadUserInfo());
  }

  late final _$logoutAsyncAction = AsyncAction(
    '_LoginController.logout',
    context: context,
  );

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
errorMessage: ${errorMessage},
user: ${user},
userInfo: ${userInfo}
    ''';
  }
}
