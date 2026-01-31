import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Revenue.freezed.dart';
part 'Revenue.g.dart';

@freezed
class Revenue with _$Revenue {
  const factory Revenue({
    @Default(0) int id,
    @JsonKey(name: 'available_balance') @Default("0.0") String availableBalance,
    @JsonKey(name: 'created_at') @Default("") String createdAt,
    @JsonKey(name: 'updated_at') @Default("") String updatedAt,
    @JsonKey(name: 'owner_id') @Default(0) int ownerId,
    @JsonKey(name: 'owner_type') @Default("") String ownerType,
    @Default("0.0") String balance,
  }) = _Revenue;

  factory Revenue.fromJson(Map<String, dynamic> json) =>
      _$RevenueFromJson(json);
}
