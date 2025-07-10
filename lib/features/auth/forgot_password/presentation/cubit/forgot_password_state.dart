import 'package:equatable/equatable.dart';

/// Represents the status of the forgot password process.
enum Status { loading, success, error, initial }

/// Represents the type of success in the forgot password flow.
enum ForgotPasswordSuccessType { none, verifyCode, resendCode, resetPassword }

/// State class for the forgot password feature.
class ForgotPasswordState extends Equatable {
  /// The current status of the process.
  final Status status;

  /// An optional message, typically for errors or feedback.
  final String? message;

  /// The type of success event that occurred.
  final ForgotPasswordSuccessType successType;

  /// Constructor to initialize the state.
  const ForgotPasswordState({
    required this.status,
    this.message,
    this.successType = ForgotPasswordSuccessType.none,
  });

  /// Returns a copy of this state with the given fields replaced.
  ForgotPasswordState copyWith({
    Status? status,
    String? message,
    ForgotPasswordSuccessType? successType,
  }) {
    return ForgotPasswordState(
      status: status ?? this.status,
      message: message ?? this.message,
      successType: successType ?? this.successType,
    );
  }

  @override
  List<Object?> get props => [status, message, successType];
}