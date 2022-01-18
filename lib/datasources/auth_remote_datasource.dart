import 'package:dio/dio.dart';
import 'package:get_it_introducao/models/user.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthRemoteDatasource {
  final Dio _dio;

  AuthRemoteDatasource(this._dio);

  User? getCurrentUser() {
    //Buscaria na API usando DIO
    return User('Marcos');
  }
}