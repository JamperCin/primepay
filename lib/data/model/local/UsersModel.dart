class UsersModel {
  String? userId;
  String? userImageUrl;
  String? userName;
  String? userPhone;
  String? userLocation;
  String? status;
  bool isSelected;

  UsersModel({
    this.userId,
    this.userImageUrl,
    this.userName,
    this.userPhone,
    this.userLocation,
    this.status,
    this.isSelected = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'userImageUrl': userImageUrl,
      'userName': userName,
      'userPhone': userPhone,
      'userLocation': userLocation,
      'status': status,
      'isSelected': isSelected,
    };
  }
}
