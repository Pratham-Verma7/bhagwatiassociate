import 'package:intl/intl.dart';

class EmployeeAddressVerificationModel {
  final int? id;
  final int? leadId;
  final String? candidateNameEav;
  final String? fatherNameEav;
  final String? addressEav;
  final String? dobEav;
  final String? periodOfStayEav;
  final String? contactNumberEav;
  final String? dateTimeAtVisitEav;
  final String? nameOfRespondentEav;
  final String? relationEav;
  final String? landmarkEav;
  final String? propertyTypeEav;
  final String? addressTypeEav;
  final String? periodOfStayFromEav;
  final String? periodOfStayToEav;
  final String? noOfFamilyMemberEav;
  final String? signatureEav;
  final String? remarksEav;
  final String? refNoEav;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  EmployeeAddressVerificationModel({
    this.id,
    this.leadId,
    this.candidateNameEav,
    this.fatherNameEav,
    this.addressEav,
    this.dobEav,
    this.periodOfStayEav,
    this.contactNumberEav,
    this.dateTimeAtVisitEav,
    this.nameOfRespondentEav,
    this.relationEav,
    this.landmarkEav,
    this.propertyTypeEav,
    this.addressTypeEav,
    this.periodOfStayFromEav,
    this.periodOfStayToEav,
    this.noOfFamilyMemberEav,
    this.signatureEav,
    this.remarksEav,
    this.refNoEav,
    this.createdAt,
    this.updatedAt,
  });

  factory EmployeeAddressVerificationModel.empty() {
    return EmployeeAddressVerificationModel(
      id: null,
      leadId: null,
      candidateNameEav: null,
      fatherNameEav: null,
      addressEav: null,
      dobEav: null,
      periodOfStayEav: null,
      contactNumberEav: null,
      dateTimeAtVisitEav: null,
      nameOfRespondentEav: null,
      relationEav: null,
      landmarkEav: null,
      propertyTypeEav: null,
      addressTypeEav: null,
      periodOfStayFromEav: null,
      periodOfStayToEav: null,
      noOfFamilyMemberEav: null,
      signatureEav: null,
      remarksEav: null,
      refNoEav: null,
      createdAt: null,
      updatedAt: null,
    );
  }

  EmployeeAddressVerificationModel copyWith({
    int? id,
    int? leadId,
    String? candidateNameEav,
    String? fatherNameEav,
    String? addressEav,
    String? dobEav,
    String? periodOfStayEav,
    String? contactNumberEav,
    String? dateTimeAtVisitEav,
    String? nameOfRespondentEav,
    String? relationEav,
    String? landmarkEav,
    String? propertyTypeEav,
    String? addressTypeEav,
    String? periodOfStayFromEav,
    String? periodOfStayToEav,
    String? noOfFamilyMemberEav,
    String? signatureEav,
    String? remarksEav,
    String? refNoEav,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return EmployeeAddressVerificationModel(
      id: id ?? this.id,
      leadId: leadId ?? this.leadId,
      candidateNameEav: candidateNameEav ?? this.candidateNameEav,
      fatherNameEav: fatherNameEav ?? this.fatherNameEav,
      addressEav: addressEav ?? this.addressEav,
      dobEav: dobEav ?? this.dobEav,
      periodOfStayEav: periodOfStayEav ?? this.periodOfStayEav,
      contactNumberEav: contactNumberEav ?? this.contactNumberEav,
      dateTimeAtVisitEav: dateTimeAtVisitEav ?? this.dateTimeAtVisitEav,
      nameOfRespondentEav: nameOfRespondentEav ?? this.nameOfRespondentEav,
      relationEav: relationEav ?? this.relationEav,
      landmarkEav: landmarkEav ?? this.landmarkEav,
      propertyTypeEav: propertyTypeEav ?? this.propertyTypeEav,
      addressTypeEav: addressTypeEav ?? this.addressTypeEav,
      periodOfStayFromEav: periodOfStayFromEav ?? this.periodOfStayFromEav,
      periodOfStayToEav: periodOfStayToEav ?? this.periodOfStayToEav,
      noOfFamilyMemberEav: noOfFamilyMemberEav ?? this.noOfFamilyMemberEav,
      signatureEav: signatureEav ?? this.signatureEav,
      remarksEav: remarksEav ?? this.remarksEav,
      refNoEav: refNoEav ?? this.refNoEav,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory EmployeeAddressVerificationModel.fromJson(Map<String, dynamic> json) {
    return EmployeeAddressVerificationModel(
      id: json['id'] is String ? int.tryParse(json['id']) : json['id'],
      leadId: json['lead_id'] is String
          ? int.tryParse(json['lead_id'])
          : json['lead_id'],
      candidateNameEav: json['candidate_name_eav'],
      fatherNameEav: json['father_name_eav'],
      addressEav: json['address_eav'],
      dobEav: json['dob_eav'],
      periodOfStayEav: json['period_of_stay_eav'],
      contactNumberEav: json['contact_number_eav'],
      dateTimeAtVisitEav: json['date_time_at_visit_eav'],
      nameOfRespondentEav: json['name_of_respondent_eav'],
      relationEav: json['relation_eav'],
      landmarkEav: json['landmark_eav'],
      propertyTypeEav: json['property_type_eav'],
      addressTypeEav: json['address_type_eav'],
      periodOfStayFromEav: json['period_of_stay_from_eav'],
      periodOfStayToEav: json['period_of_stay_to_eav'],
      noOfFamilyMemberEav: json['no_of_family_member_eav'],
      signatureEav: json['signature_eav'],
      remarksEav: json['remarks_eav'],
      refNoEav: json['ref_no_eav'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'lead_id': leadId,
      'candidate_name_eav': candidateNameEav,
      'father_name_eav': fatherNameEav,
      'address_eav': addressEav,
      'dob_eav': dobEav,
      'period_of_stay_eav': periodOfStayEav,
      'contact_number_eav': contactNumberEav,
      'date_time_at_visit_eav': dateTimeAtVisitEav,
      'name_of_respondent_eav': nameOfRespondentEav,
      'relation_eav': relationEav,
      'landmark_eav': landmarkEav,
      'property_type_eav': propertyTypeEav,
      'address_type_eav': addressTypeEav,
      'period_of_stay_from_eav': periodOfStayFromEav,
      'period_of_stay_to_eav': periodOfStayToEav,
      'no_of_family_member_eav': noOfFamilyMemberEav,
      'signature_eav': signatureEav,
      'remarks_eav': remarksEav,
      'ref_no_eav': refNoEav,
    };
  }
}
