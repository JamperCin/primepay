import 'package:freezed_annotation/freezed_annotation.dart';

part 'AppUpdateChecker.freezed.dart';
part 'AppUpdateChecker.g.dart';

@freezed
class AppUpdateChecker with _$AppUpdateChecker {
  const factory AppUpdateChecker({
    @Default(0) int versionCode,
    @Default("") String feature,
    @Default(false) bool forceUpdate,
  }) = _AppUpdateChecker;

  factory AppUpdateChecker.fromJson(Map<String, dynamic> json) =>
      _$AppUpdateCheckerFromJson(json);
}
