import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_introducao/injection/injection.config.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

const ambienteProducao = Environment('prod');
const ambienteTeste = Environment('test');

final getIt = GetIt.I;

/*
void configureDependencies() {
  //GetIt.I.registerSingleton(SessionManager()); //getIt.registerSingleton(SessionManager());
  //GetIt.I.registerLazySingleton(() => SessionManager()); //getIt.registerLazySingleton(() => SessionManager());
  //GetIt.I.registerFactory(() => SessionManager()); //getIt.registerFactory(() => SessionManager());

  getIt.registerSingleton(() => Dio());
  getIt.registerFactory(() => AuthLocalDatasource());
  getIt.registerFactory(() => AuthRemoteDatasource(getIt()));
  getIt.registerFactory<AuthRepository>(() => NodeAuthRepository(getIt(), getIt()));
  getIt.registerSingleton(SessionManager(getIt()));
}
*/

@InjectableInit()
Future<void> configureDependencies() => $initGetIt(getIt, environment: ambienteProducao.name);

@module
abstract class RegisterModule {
  @singleton
  Dio get dio => Dio();

  @preResolve
  @singleton
  Future<SharedPreferences> get sharedPreferences => SharedPreferences.getInstance();
}