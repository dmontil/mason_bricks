import 'package:{{{package_name}}}/domain/repositories/{{name.snakeCase()}}_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: {{name.pascalCase()}})
class {{name.pascalCase()}}RepositoryImpl implements {{name.pascalCase()}}Repository {
{{name.pascalCase()}}RepositoryImpl(this._{{name.camelCase()()}}Datasource);

final Api{{name.pascalCase()}}Datasource _{{name.camelCase()()}}Datasource;
}
