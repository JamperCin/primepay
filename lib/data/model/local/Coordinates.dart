import 'package:freezed_annotation/freezed_annotation.dart';

part 'Coordinates.freezed.dart';
part 'Coordinates.g.dart';

@freezed
class Coordinates with _$Coordinates {
  const factory Coordinates({
    @Default('') String address,
    @Default('') String latitude,
    @Default('') String longitude,
  }) = _Coordinates;

  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesFromJson(json);
}
