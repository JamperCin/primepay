import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prime_pay/data/model/local/Data.dart';

part 'AppBaseResponse.freezed.dart';
part 'AppBaseResponse.g.dart';

///Run this command after any changes to any of the model files
///command @command [dart run build_runner build --delete-conflicting-outputs]
///
@freezed
class AppBaseResponse with _$AppBaseResponse {
  const factory AppBaseResponse({
    @Default(false) bool success,
    @Default(0) int status,
    @JsonKey(name: 'error_msg') @Default('') String? error,
    @Default(Data()) Data data,
  }) = _AppBaseResponse;

  factory AppBaseResponse.fromJson(Map<String, dynamic> json) =>
      _$AppBaseResponseFromJson(json);
}
