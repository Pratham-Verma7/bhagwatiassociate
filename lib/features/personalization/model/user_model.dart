import 'package:bhagwatiassociate/utils/formatters/formatter.dart';

class ConsultantUserDataModel {
  String id;
  String fullName;
  DateTime dateOfBirth;
  String mobileNumber;
  String gender;
  String email;
  String? profilePicture;
  bool emergencyAvailableButton;
  List<String> specialties;
  List<String> certifications;
  String availabilityStatus;
  bool acceptTermsAndConditions;
  String role;
  List<String> schedule;
  // String category;
  // String subCategory;
  DateTime createdAt;
  DateTime updatedAt;
  int version;

  ConsultantUserDataModel({
    required this.id,
    required this.fullName,
    required this.dateOfBirth,
    required this.mobileNumber,
    required this.gender,
    required this.email,
    this.profilePicture,
    required this.emergencyAvailableButton,
    required this.specialties,
    required this.certifications,
    required this.availabilityStatus,
    required this.acceptTermsAndConditions,
    required this.role,
    required this.schedule,
    // required this.category,
    // required this.subCategory,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
  });

  // empty user model
  // static UserModel empty() => UserModel(
  static ConsultantUserDataModel empty() => ConsultantUserDataModel(
      id: '',
      fullName: '',
      dateOfBirth: DateTime(1970, 1, 1),
      mobileNumber: '',
      gender: '',
      email: '',
      profilePicture: null,
      emergencyAvailableButton: false,
      specialties: [],
      certifications: [],
      availabilityStatus: 'notAvailable',
      acceptTermsAndConditions: false,
      role: 'consultant',
      schedule: [],
      // category: '',
      // subCategory: '',
      createdAt: DateTime(1970, 1, 1),
      updatedAt: DateTime(1970, 1, 1),
      version: 0);

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'fullName': fullName,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'mobileNumber': mobileNumber,
      'gender': gender,
      'email': email,
      'profilePicture': profilePicture,
      'emergencyAvailableButton': emergencyAvailableButton,
      'specialties': specialties,
      'certifications': certifications,
      'availabilityStatus': availabilityStatus,
      'acceptTermsAndConditions': acceptTermsAndConditions,
      'role': role,
      'schedule': schedule,
      // 'category': category,
      // 'subCategory': subCategory,
      // 'createdAt': createdAt.toIso8601String(),
      // 'updatedAt': updatedAt.toIso8601String(),
      // '__v': version,
    };
  }

  String get formattedMobileNumber =>
      SFormatter.formatPhoneNumber(mobileNumber);

  static List<String> nameParts(name) {
    return name.split(' ');
  }

  factory ConsultantUserDataModel.fromJson(Map<String, dynamic> json) {
    return ConsultantUserDataModel(
      id: json['_id'] ?? '',
      fullName: json['fullName'] ?? '',
      dateOfBirth:
          DateTime.parse(json['dateOfBirth'] ?? '1970-01-01T00:00:00.000Z'),
      mobileNumber: json['mobileNumber'] ?? '',
      gender: json['gender'] ?? '',
      email: json['email'] ?? '',
      profilePicture: json['profilePicture'],
      emergencyAvailableButton: json['emergencyAvailableButton'] ?? false,
      specialties: List<String>.from(json['specialties'] ?? []),
      certifications: List<String>.from(json['certifications'] ?? []),
      availabilityStatus: json['availabilityStatus'] ?? '',
      acceptTermsAndConditions: json['acceptTermsAndConditions'] ?? false,
      role: json['role'] ?? '',
      schedule: List<String>.from(json['schedule'] ?? []),
      // category: json['category'] ?? '',
      // subCategory: json['subCategory'] ?? '',
      createdAt:
          DateTime.parse(json['createdAt'] ?? '1970-01-01T00:00:00.000Z'),
      updatedAt:
          DateTime.parse(json['updatedAt'] ?? '1970-01-01T00:00:00.000Z'),
      version: json['__v'] ?? 0,
      // version: json['__v'] ?? 0,
      // id: json['_id'],
      // fullName: json['fullName'],
      // dateOfBirth: DateTime.parse(json['dateOfBirth']),
      // mobileNumber: json['mobileNumber'],
      // gender: json['gender'],
      // email: json['email'],
      // profilePicture: json['profilePicture'],
      // emergencyAvailableButton: json['emergencyAvailableButton'],
      // specialties: List<String>.from(json['specialties']),
      // certifications: List<String>.from(json['certifications']),
      // availabilityStatus: json['availabilityStatus'],
      // acceptTermsAndConditions: json['acceptTermsAndConditions'],
      // role: json['role'],
      // schedule: List<String>.from(json['schedule']),
      // // category: json['category'],
      // // subCategory: json['subCategory'],
      // createdAt: DateTime.parse(json['createdAt']),
      // updatedAt: DateTime.parse(json['updatedAt']),
      // version: json['__v'],
    );
  }
}
