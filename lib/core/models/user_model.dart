import 'package:fitness/features/auth/login/data/model/login_user_dto.dart';

class UserModel {
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  int? age;
  int? weight;
  int? height;
  String? activityLevel;
  String? goal;
  String? id;
  String? token;
  DateTime? createdAt;
  String? role;
  String? phoneNumber;
  String? profileImage;
  List<dynamic>? wishlist;
  UserModel._();

  static final UserModel _singletonInstance = UserModel._();

  static UserModel get instance => _singletonInstance;

  void setFromApi(Map<String, dynamic> json) {
    User userInstance = json['user'];
    firstName = userInstance.firstName;
    lastName = userInstance.lastName;
    email = userInstance.email;
    age = userInstance.age;
    weight = userInstance.weight;
    height = userInstance.height;
    gender = userInstance.gender;
    activityLevel = userInstance.activityLevel;
    goal = userInstance.goal;
    profileImage = userInstance.photo;
    id = userInstance.id;
    token = json['token'];
    createdAt =
        userInstance.createdAt != null
            ? DateTime.parse(userInstance.createdAt!)
            : null;
  }

  void setFromJson(Map<String, dynamic> json) {
    firstName = json['user']?['firstName'];
    lastName = json['user']?['lastName'];
    email = json['user']?['email'];
    gender = json['user']?['gender'];
    phoneNumber = json['user']?['phone'];
    profileImage = json['user']?['photo'];
    role = json['user']?['role'];
    wishlist = json['user']?['wishlist'] ?? [];
    // addresses = (json['user']?['addresses'] as List<dynamic>?)
    //     ?.map((item) => Address.fromJson(item))
    //     .toList() ?? [];
    id = json['user']?['_id'];
    token = json['token'];
    createdAt =
        json['user']?['createdAt'] != null
            ? DateTime.parse(json['user']?['createdAt'])
            : null;
  }
}
