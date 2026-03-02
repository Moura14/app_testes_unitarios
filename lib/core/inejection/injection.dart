import 'package:app_testes_unitarios/features/home/data/datasource/home_datasource.dart';
import 'package:app_testes_unitarios/features/home/data/repositories/home_repositorie.dart';
import 'package:app_testes_unitarios/features/home/domain/usecase/home_usecase.dart';
import 'package:app_testes_unitarios/features/home/presentation/controllers/home_controller.dart';
import 'package:app_testes_unitarios/features/login/data/datasource/login_datasource.dart';
import 'package:app_testes_unitarios/features/login/domain/usecase/login_usecase.dart';
import 'package:app_testes_unitarios/features/login/presentation/controllers/login_controller.dart';
import 'package:app_testes_unitarios/features/login/data/repositories/login_repositories.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;


final getIt = GetIt.instance;

void setupInjection() {
  // External
  getIt.registerLazySingleton<http.Client>(() => http.Client());

  // Datasource
  getIt.registerLazySingleton<LoginDatasource>(
    () => LoginRemoteDataSourceImpl(getIt()),
  );
  getIt.registerLazySingleton<HomeDatasource>(
    () => HomeRemoteDataSourceImpl(getIt()),
  );

  // Repository
  // register the abstract interface so callers can request LoginRepositories
  getIt.registerLazySingleton<LoginRepositories>(
    () => LoginRepositoreisImpl(loginDatasource: getIt()),
  );
  getIt.registerLazySingleton<HomeRepositories>(
    () => HomeRepositoriesImpl(homeDatasource: getIt()),
  );

  // Usecase
  getIt.registerLazySingleton<HomeUsecase>(
    // HomeUsecase expects a named parameter `repositories`
    () => HomeUsecase(repositories: getIt()),
  );
  getIt.registerLazySingleton<LoginUsecase>(
    // LoginUsecase expects a named parameter `repositories`
    () => LoginUsecase(repositories: getIt()),
  );

  // Controller
  getIt.registerFactory<LoginController>(
    () => LoginController(getIt()),
  );
  getIt.registerFactory<HomeController>(
    () => HomeController(getIt()),
  );
}