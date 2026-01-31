import 'package:freezed_annotation/freezed_annotation.dart';

part 'CountryModel.freezed.dart';
part 'CountryModel.g.dart';

@freezed
class CountryModel with _$CountryModel {
  const factory CountryModel({
    @Default(0) int id,
    @Default('Ghana') String name,
    @JsonKey(name: 'code_number') @Default('233') String codeNumber,
    @JsonKey(name: 'code_name') @Default('GH') String codeName,
    @Default('¢') String currency,
  }) = _CountryModel;

  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);
}
