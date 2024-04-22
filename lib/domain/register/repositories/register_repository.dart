import 'package:either_dart/either.dart';

abstract interface class RegisterRepository {
  Future<Either<Exception, dynamic>> get(String id);
}