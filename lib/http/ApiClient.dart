import 'dart:collection';

import 'AppBaseResponse.dart';

abstract class ApiClient {
  ///Verify the 6-digit code sent to verify phone number during customer registration
  ///@param[params]
  Future<void> signOut(
    HashMap<String, Object> params,
    Function(AppBaseResponse response) callback,
  );

  ///Send feedback from app to the backend
  Future<void> checkAppUpdate(Function(AppBaseResponse response) callback);

  ///Login into the prime app using already registered credentials
  ///@param [params]
  ///[params] should have both username and password
  Future<void> login(
    HashMap<String, Object> params,
    Function(AppBaseResponse response) callback,
  );

  Future<void> addFunds(
      HashMap<String, Object> param, Function(AppBaseResponse) callback);

  ///Get user details
  ///
  Future<void> getMerchantDetails(Function(AppBaseResponse response) callback);

  ///Checkout api to send cards yet to be bought but saved in cart to the backend
  Future<void> redeemCard(
    HashMap<String, Object> params,
    Function(AppBaseResponse response) callback,
  );

  ///Checkout api to send cards yet to be bought but saved in cart to the backend
  Future<void> fetchCardDetails(
    String params,
    Function(AppBaseResponse response) callback,
  );

  ///Checkout api to send cards yet to be bought but saved in cart to the backend
  Future<void> fetchDisbursement(
    int page,
    Function(AppBaseResponse response) callback,
  );

  ///Fetch the redemption transaction history
  Future<void> fetchRedemptions(
      int page, Function(AppBaseResponse response) callback);

  ///Checkout api to send cards yet to be bought but saved in cart to the backend
  Future<void> sendRedeemVerificationCode(
    HashMap<String, Object> params,
    Function(AppBaseResponse response) callback,
  );
}
