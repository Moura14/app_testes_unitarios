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
  String? errorMessage;

  @action
  Future<void> getProduto() async {
    isLoading = true;
    try {
      final response = await homeUseCase.getProdutos();
      products = response.products;
      if (products.isEmpty) {
        // added logging for debugging
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
  
}