import 'package:app_testes_unitarios/features/home/data/model/cart_model.dart';
import 'package:app_testes_unitarios/features/home/data/model/product_details_model.dart';
import 'package:app_testes_unitarios/features/home/data/model/product_model.dart';
import 'package:app_testes_unitarios/features/home/domain/usecase/home_usecase.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {

  final HomeUsecase homeUseCase;

  _HomeController(this.homeUseCase);

  @observable
  bool isLoading = false;


  @observable
  List<ProductModel> products = [];

  @observable
  ProductDetailsModel? productDetailsModel;


  @observable
  CartModel? cartModel;


  @observable
  String? errorMessage;

  @action
  Future<void> getProduto() async {
    isLoading = true;
    try {
      final response = await homeUseCase.getProdutos();
      products = response.products;
      if (products.isEmpty) {
        
        print('getProduto: received empty product list');
      }
    } catch (e) {
      errorMessage = e.toString();
      print('getProduto error: $errorMessage');
    }
    isLoading = false;
  }

  @action
  Future<void> getProdutoDetalhes({required int id}) async {
    isLoading = true;
    try {
      final response = await homeUseCase.getProdutoDetalhes(id: id);
      productDetailsModel = response;
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false;
  }

  @action
  Future<void> pesquisaProduto({required String produto}) async {
    isLoading = true;
    try {
      final response = await homeUseCase.pesquisaProduto(produto: produto);
      products = response.products;
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false;
  
}


  @action
  Future<void> addCart({required int id, required int quantity}) async {
    isLoading = true;
    try {
      final response = await homeUseCase.addCart(id: id, quantity: quantity);
      cartModel = response;
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false;
  }

  @action
  Future<void> getCart() async {
    isLoading = true;
    try {
      final response = await homeUseCase.getCart();
      cartModel = response;
      print('Carrinho carregado: ${cartModel?.products.length} produtos');
    } catch (e) {
      errorMessage = e.toString();
      print('Erro ao carregar carrinho: $errorMessage');
    }
    isLoading = false;
  }
}