import 'package:either_dart/either.dart';

abstract interface class TestingRepository {
  Future<Either<Exception, dynamic>> get(String id);
}