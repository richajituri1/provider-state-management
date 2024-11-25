import 'package:providers/helpers/index.dart';

class Failure {
  final int errorCode;
  final String message;

  Failure({required this.errorCode, required this.message});

  void printFailure() {
    logger.e('Error $errorCode: $message');
  }
}
