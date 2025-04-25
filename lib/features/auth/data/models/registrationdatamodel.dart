import 'package:bhagwatiassociate/utils/constants/enums.dart';
import 'package:bhagwatiassociate/utils/formatters/formatter.dart';

class Registrationdatamodel {
  String fullName;
  String email;
  String mobileNumber;
  DateTime dateOfBirth;
  String gender;
  String password;
  String role;
  String otpCode;
  bool acceptTermsAndConditions;
  Enum availabilityStatus;

  Registrationdatamodel({
    required this.fullName,
    required this.dateOfBirth,
    required this.mobileNumber,
    required this.gender,
    required this.email,
    required this.password,
    this.role = 'consultant',
    required this.availabilityStatus,
    this.otpCode = '',
    required this.acceptTermsAndConditions,
  });

  String get formattedPhoneNumber => SFormatter.formatPhoneNumber(mobileNumber);

  static List<String> nameParts(name) {
    return name.split(' ');
  }

  static Registrationdatamodel empty() => Registrationdatamodel(
        fullName: '',
        email: '',
        mobileNumber: '',
        dateOfBirth: DateTime.parse("2000-01-01"),
        gender: '',
        password: '',
        role: 'consultant',
        otpCode: '',
        acceptTermsAndConditions: false,
        availabilityStatus: availablityStatus.NotAvailable,
      );

  Map<String, dynamic> toJson() {
    return {
      "fullName": fullName,
      "email": email,
      "mobileNumber": mobileNumber,
      'dateOfBirth': dateOfBirth.toIso8601String().split('T').first,
      "gender": gender,
      "password": password,
      "role": role,
      "otpCode": otpCode,
      "acceptTermsAndConditions": acceptTermsAndConditions,
      "availabilityStatus": availabilityStatus.name.toString(),
    };
  }

  static Registrationdatamodel fromJson(Map<String, dynamic> json) {
    return Registrationdatamodel(
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      mobileNumber: json['mobileNumber'] ?? '',
      dateOfBirth: DateTime.parse(json['dateOfBirth'] ?? "2000-01-01"),
      gender: json['gender'] ?? '',
      password: json['password'] ?? '',
      role: json['role'] ?? 'consultant',
      otpCode: json['otpCode'] ?? '',
      acceptTermsAndConditions: json['acceptTermsAndConditions'] ?? false,
      availabilityStatus: json['availabilityStatus'] != null
          ? availablityStatus.values.firstWhere(
              (element) => element.toString() == json['availabilityStatus'])
          : availablityStatus.NotAvailable,
    );
  }
}
