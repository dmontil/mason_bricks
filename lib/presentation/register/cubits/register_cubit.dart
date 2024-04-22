import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:register/presentation/cubits/register_create_state.dart';
import 'package:register/domain/repositories/register_repository.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
RegisterCubit(this._registerRepository) : super(RegisterState.initial());

final RegisterRepository _registerRepository;

// TODO: Add your methods here
}