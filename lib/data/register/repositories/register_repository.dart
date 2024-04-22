import 'package:/domain/repositories/register_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: Register)
class RegisterRepositoryImpl implements RegisterRepository {
RegisterRepositoryImpl(this._Datasource);

final ApiRegisterDatasource _Datasource;
}
