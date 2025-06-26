import 'package:equatable/equatable.dart';

class SendEmailResponseEntity extends Equatable {
  final String message;
  final String info;

  const SendEmailResponseEntity({required this.message, required this.info});

  @override
  List<Object?> get props => [message,info];
}
