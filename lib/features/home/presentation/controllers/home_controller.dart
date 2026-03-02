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
  String? errorMessage;

  @action
  Future<void> getProduto() async {
    isLoading = true;
    try {
      final response = await homeUseCase.getProdutos();
      products = response.products;
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false;
  }
  
}