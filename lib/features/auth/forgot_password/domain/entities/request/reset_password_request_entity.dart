import 'package:equatable/equatable.dart';

class ResetPasswordRequestEntity extends Equatable {
  final String email;
  final String newPassword;

  const ResetPasswordRequestEntity({
    required this.email,
    required this.newPassword,
  });

  @override

  List<Object?> get props =>[email,newPassword];


}