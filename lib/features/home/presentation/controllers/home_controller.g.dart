// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeController, Store {
  late final _$isLoadingAtom = Atom(
    name: '_HomeController.isLoading',
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

  late final _$productsAtom = Atom(
    name: '_HomeController.products',
    context: context,
  );

  @override
  List<ProductModel> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(List<ProductModel> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  late final _$productDetailsModelAtom = Atom(
    name: '_HomeController.productDetailsModel',
    context: context,
  );

  @override
  ProductDetailsModel? get productDetailsModel {
    _$productDetailsModelAtom.reportRead();
    return super.productDetailsModel;
  }

  @override
  set productDetailsModel(ProductDetailsModel? value) {
    _$productDetailsModelAtom.reportWrite(value, super.productDetailsModel, () {
      super.productDetailsModel = value;
    });
  }

  late final _$errorMessageAtom = Atom(
    name: '_HomeController.errorMessage',
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

  late final _$getProdutoAsyncAction = AsyncAction(
    '_HomeController.getProduto',
    context: context,
  );

  @override
  Future<void> getProduto() {
    return _$getProdutoAsyncAction.run(() => super.getProduto());
  }

  late final _$getProdutoDetalhesAsyncAction = AsyncAction(
    '_HomeController.getProdutoDetalhes',
    context: context,
  );

  @override
  Future<void> getProdutoDetalhes({required int id}) {
    return _$getProdutoDetalhesAsyncAction.run(
      () => super.getProdutoDetalhes(id: id),
    );
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
products: ${products},
productDetailsModel: ${productDetailsModel},
errorMessage: ${errorMessage}
    ''';
  }
}
