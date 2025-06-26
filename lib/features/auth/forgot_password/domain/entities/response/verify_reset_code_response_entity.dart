import 'package:equatable/equatable.dart';

class VerifyResetCodeResponseEntity extends Equatable {
  final String status;


  const VerifyResetCodeResponseEntity({
    required this.status,
  });

  @override

  List<Object?> get props =>[status];


}