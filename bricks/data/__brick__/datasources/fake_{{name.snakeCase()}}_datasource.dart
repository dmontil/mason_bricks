import 'package:injectable/injectable.dart';

@fake
@Injectable(as: {{name.pascalCase()}}DataSource)
class Fake{{name.pascalCase()}}DataSource implements {{name.pascalCase()}}DataSource {
// TODO: implement your {{name.pascalCase()}}DataSourceImpl
}