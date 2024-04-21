import 'package:either_dart/either.dart';

abstract interface class {{name.pascalCase()}}Repository {
  Future<Either<Exception, dynamic>> get(String id);
}