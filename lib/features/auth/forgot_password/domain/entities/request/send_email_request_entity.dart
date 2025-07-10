import 'package:equatable/equatable.dart';

class SendEmailRequestEntity extends Equatable {
  final String email;

  const SendEmailRequestEntity({required this.email});

  @override
  List<Object?> get props => [email];
}
