import 'package:bhagwatiassociate/features/auth/data/models/user_model.dart';
import 'package:bhagwatiassociate/utils/http/http_client.dart';
import 'package:get_storage/get_storage.dart';

class UserService {
  static final UserService _instance = UserService._internal();
  factory UserService() => _instance;
  UserService._internal();

  static UserService get instance => _instance;

  final _storage = GetStorage();

  /// Get user by email
  Future<UserModel?> getUserByEmail(String email) async {
    try {
      // Since the API doesn't have a direct endpoint for getting user by email,
      // we'll use the login response data instead
      final response = await SHttpHelper.post('api/login', {
        'email': email,
        'password': 'password' // This will be handled by the auth repository
      });

      if (response is Map<String, dynamic> && response.containsKey('user')) {
        return UserModel.fromJson(response['user']);
      }
      return null;
    } catch (e) {
      print('getUserByEmail error: $e');
      return null;
    }
  }

  /// Get all users
  Future<List<UserModel>> getAllUsers() async {
    try {
      final response = await SHttpHelper.get('api/get/users');
      List<UserModel> users = [];

      if (response is List) {
        for (var item in response) {
          if (item is Map<String, dynamic>) {
            try {
              final user = UserModel.fromJson(item);
              users.add(user);
            } catch (e) {
              print('Error parsing user: $e');
            }
          }
        }
      }
      return users;
    } catch (e) {
      print('getAllUsers error: $e');
      return [];
    }
  }

  /// Store user data in local storage
  Future<void> storeUserData(UserModel user) async {
    await _storage.write('userDetails', user.toJson());
  }

  /// Get stored user data
  UserModel? getStoredUserData() {
    final userData = _storage.read('userDetails');
    if (userData != null) {
      return UserModel.fromJson(userData);
    }
    return null;
  }

  /// Clear stored user data
  Future<void> clearUserData() async {
    await _storage.remove('userDetails');
  }
}
