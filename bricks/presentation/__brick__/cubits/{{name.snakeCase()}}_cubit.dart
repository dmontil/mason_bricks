import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:{{name.snakeCase()}}/presentation/cubits/{{name.snakeCase()}}_create_state.dart';
import 'package:{{name.snakeCase()}}/domain/repositories/{{name.snakeCase()}}_repository.dart';

@injectable
class {{name.pascalCase()}}Cubit extends Cubit<{{name.pascalCase()}}State> {
{{name.pascalCase()}}Cubit(this._{{name.camelCase()}}Repository) : super({{name.pascalCase()}}State.initial());

final {{name.pascalCase()}}Repository _{{name.camelCase()}}Repository;

// TODO: Add your methods here
}