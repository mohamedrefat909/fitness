
import 'package:json_annotation/json_annotation.dart';
part 'login_user_dto.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'user')
  User? user;
  @JsonKey(name: 'token')
  String? token;

  LoginResponse({this.message, this.user, this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  static List<LoginResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(LoginResponse.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class User {
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'firstName')
  String? firstName;
  @JsonKey(name: 'lastName')
  String? lastName;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'gender')
  String? gender;
  @JsonKey(name: 'age')
  int? age;
  @JsonKey(name: 'weight')
  int? weight;
  @JsonKey(name: 'height')
  int? height;
  @JsonKey(name: 'activityLevel')
  String? activityLevel;
  @JsonKey(name: 'goal')
  String? goal;
  @JsonKey(name: 'photo')
  String? photo;
  @JsonKey(name: 'createdAt')
  String? createdAt;

  User({this.id, this.firstName, this.lastName, this.email, this.gender, this.age, this.weight, this.height, this.activityLevel, this.goal, this.photo, this.createdAt});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  static List<User> fromList(List<Map<String, dynamic>> list) {
    return list.map(User.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$UserToJson(this);
}