import 'package:freezed_annotation/freezed_annotation.dart';

part 'testing.freezed.dart';
part 'testing.g.dart';

@freezed
class TestingState with _$TestingState {

const factory TestingState({
required String test,
}) = _TestingState;

factory TestingState.fromJson(Map<String, Object?> json) => _$TestingStateFromJson(json);

}
