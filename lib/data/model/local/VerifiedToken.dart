import 'package:freezed_annotation/freezed_annotation.dart';

part 'VerifiedToken.freezed.dart';
part 'VerifiedToken.g.dart';

@freezed
class VerifiedToken with _$VerifiedToken {
  const factory VerifiedToken({
    @JsonKey(name: 'verified_at') @Default('') String verifiedAt,
    @Default('') String signed,
  }) = _VerifiedToken;

  factory VerifiedToken.fromJson(Map<String, dynamic> json) =>
      _$VerifiedTokenFromJson(json);
}
