import 'package:get_it_introducao/datasources/auth_local_datasource.dart';
import 'package:get_it_introducao/datasources/auth_remote_datasource.dart';
import 'package:get_it_introducao/injection/injection.dart';
import 'package:get_it_introducao/models/user.dart';
import 'package:injectable/injectable.dart';

abstract class AuthRepository {
  User? getCurrentUser();
}

//colocando o @ambienteProducao, nao precisa da tag env no Injectable
@ambienteProducao
@Injectable(as: AuthRepository) //@Injectable(as: AuthRepository, env: ['prod'])
class NodeAuthRepository implements AuthRepository {

  final AuthLocalDatasource _authLocalDatasource;
  final AuthRemoteDatasource _authRemoteDatasource;

  NodeAuthRepository(this._authLocalDatasource, this._authRemoteDatasource);

  @override
  User? getCurrentUser() {
    User? user = _authLocalDatasource.getCurrentUser();
    user ??= _authRemoteDatasource.getCurrentUser();
    return user;
  }

}

//colocando o @ambienteTeste, nao precisa da tag env no Injectable
@ambienteTeste
@Injectable(as: AuthRepository) //@Injectable(as: AuthRepository, env: ['test'])
class MockAuthRepository implements AuthRepository {
  final AuthRemoteDatasource _authRemoteDatasource;

  MockAuthRepository(this._authRemoteDatasource);

  @override
  User? getCurrentUser() {
    return User('Test User');
  }

}