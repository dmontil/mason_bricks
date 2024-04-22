import 'package:freezed_annotation/freezed_annotation.dart';

part 'register.freezed.dart';
part 'register.g.dart';

@freezed
class RegisterState with _$RegisterState {

const factory RegisterState({
required String test,
}) = _RegisterState;

factory RegisterState.fromJson(Map<String, Object?> json) => _$RegisterStateFromJson(json);

}
