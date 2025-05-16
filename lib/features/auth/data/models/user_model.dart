class UserModel {
  final int? id;
  final String? name;
  final String? email;
  final String? token;
  final String? loginTime;
  final int? status;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.token,
    this.loginTime,
    this.status,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      token: json['token'],
      loginTime: json['login_time'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'token': token,
      'login_time': loginTime,
      'status': status,
    };
  }

  // Create an empty user model
  factory UserModel.empty() {
    return UserModel(
      id: null,
      name: null,
      email: null,
      token: null,
      loginTime: null,
      status: null,
    );
  }
}
