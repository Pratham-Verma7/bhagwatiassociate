class AppException implements Exception {
  final String message;
  final String prefix;

  AppException([this.message = 'An error occurred', this.prefix = 'Error']);

  @override
  String toString() {
    return "$prefix: $message";
  }
}

class BadRequestException extends AppException {
  BadRequestException([String? message])
      : super(message ?? 'Invalid request', 'Bad Request');
}

class UnauthorizedException extends AppException {
  UnauthorizedException([String? message])
      : super(message ?? 'Unauthorized access', 'Unauthorized');
}

class ForbiddenException extends AppException {
  ForbiddenException([String? message])
      : super(message ?? 'You don’t have permission to perform this action',
            'Forbidden');
}

class NotFoundException extends AppException {
  NotFoundException([String? message])
      : super(message ?? 'The resource was not found', 'Not Found');
}

class ConflictException extends AppException {
  ConflictException([String? message])
      : super(message ?? 'A conflict occurred', 'Conflict');
}

class InternalServerErrorException extends AppException {
  InternalServerErrorException([String? message])
      : super(message ?? 'Internal server error. Please try again later.',
            'Server Error');
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message ?? 'Error occurred while trying to fetch data',
            'Network Error');
}
