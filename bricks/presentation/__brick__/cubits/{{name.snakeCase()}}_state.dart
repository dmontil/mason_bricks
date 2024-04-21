import 'package:freezed_annotation/freezed_annotation.dart';

part '{{name.snakeCase()}}.freezed.dart';
part '{{name.snakeCase()}}.g.dart';

@freezed
class {{name.pascalCase()}}State with _${{name.pascalCase()}}State {

const factory {{name.pascalCase()}}State({
required String test,
}) = _{{name.pascalCase()}}State;

factory {{name.pascalCase()}}State.fromJson(Map<String, Object?> json) => _${{name.pascalCase()}}StateFromJson(json);

}
