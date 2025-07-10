import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'exceptions_impl.dart';

/// Returns a user-friendly error message for the given exception.
String handleErrorMessage(Object? ex) {
  if (ex is ServerError) {
    return ex.errorModel?.message ?? "Server error occurred";
  } else if (ex is ClientError) {
    return ex.errorModel?.message ?? "Please login again";
  } else if (ex is NetworkError) {
    return ex.message ?? "Network error";
  } else {
    return "An unexpected error occurred";
  }
}

/// Shows an error dialog with the given exception's message.
Future<void> showErrorDialog(BuildContext context, Object? ex) async {
  final errorMessage = handleErrorMessage(ex);

  // Use CupertinoAlertDialog for iOS, AlertDialog for others
  final isIOS = Theme.of(context).platform == TargetPlatform.iOS;
  return showDialog(
    context: context,
    builder: (context) => isIOS
        ? CupertinoAlertDialog(
            title: const Text('Error'),
            content: Text(errorMessage),
            actions: [
              CupertinoDialogAction(
                child: const Text('OK'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          )
        : AlertDialog(
            title: const Text('Error'),
            content: Text(errorMessage),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
  );
}
