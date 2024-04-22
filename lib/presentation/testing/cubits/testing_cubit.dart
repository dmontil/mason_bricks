import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:testing/presentation/cubits/testing_create_state.dart';
import 'package:testing/domain/repositories/testing_repository.dart';

@injectable
class TestingCubit extends Cubit<TestingState> {
TestingCubit(this._testingRepository) : super(TestingState.initial());

final TestingRepository _testingRepository;

// TODO: Add your methods here
}