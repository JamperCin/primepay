import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prime_pay/data/model/local/Person.dart';

part 'Customer.freezed.dart';
part 'Customer.g.dart';

@freezed
class Customer with _$Customer {
  const factory Customer({
    @Default(0) int id,
    @Default('') String email,
    @JsonKey(name: 'phone_number') @Default('') String phoneNumber,
    @Default('') String username,
    @Default(false) bool blocked,
    @Default(false) bool active,
    @Default('') String company,
    Person? person,
    @JsonKey(name: 'verification_token') @Default('') String verificationToken,
  }) = _Customer;

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);
}
