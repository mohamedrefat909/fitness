import 'package:equatable/equatable.dart';

class VerifyResetCodeRequestEntity extends Equatable {
  final String resetCode;


  const VerifyResetCodeRequestEntity({
    required this.resetCode,
  });

  @override

  List<Object?> get props =>[resetCode];


}