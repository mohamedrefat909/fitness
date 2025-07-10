import 'package:equatable/equatable.dart';

class VerifyResetCodeResponseEntity extends Equatable {
  final String ?message;


  const VerifyResetCodeResponseEntity({
    required this.message,
  });

  @override

  List<Object?> get props =>[message];


}