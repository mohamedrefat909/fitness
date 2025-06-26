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
  String? photo;
  String? id;
  String? token;
  DateTime? createdAt;

  UserModel._();

  static final UserModel _singletonInstance = UserModel._();

  static UserModel get instance => _singletonInstance;

  void setFromJson(Map<String, dynamic> json) {
    User userInstance=json['user'];
    firstName = userInstance.firstName;
    lastName =userInstance.lastName;
    email =userInstance.email;
    age = userInstance.age;
    weight = userInstance.weight;
    height = userInstance.height;
    gender = userInstance.gender;
    activityLevel = userInstance.activityLevel;
    goal = userInstance.goal;
    photo=userInstance.photo;
    id = userInstance.id;
    token = json['token'];
    createdAt =
       userInstance.createdAt != null
            ? DateTime.parse(userInstance.createdAt!)
            : null;
  }
}
