import 'package:get_it_introducao/injection/injection.dart';
import 'package:get_it_introducao/models/user.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class AuthLocalDatasource {
  SharedPreferences _preferences;

  AuthLocalDatasource(this._preferences);

  /* quando nao usar o @preResolve
  AuthLocalDatasource() {
    getIt.getAsync<SharedPreferences>().then((value) => _preferences = value);
  }
  */

  User? getCurrentUser() {
    //Buscaria na base de dados local (FlutterSecureStorage)
    return null;
  }

}