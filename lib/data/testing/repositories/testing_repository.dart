import 'package:/domain/repositories/testing_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: Testing)
class TestingRepositoryImpl implements TestingRepository {
TestingRepositoryImpl(this._Datasource);

final ApiTestingDatasource _Datasource;
}
