import 'package:freezed_annotation/freezed_annotation.dart';

part 'testing.freezed.dart';
part 'testing.g.dart';

@freezed
class Testing with _$Testing {

const factory Testing({
  required String test,
}) = _Testing;

factory Testing.fromJson(Map<String, Object?> json) => _$TestingFromJson(json);

}

