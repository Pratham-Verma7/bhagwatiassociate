import 'package:intl/intl.dart';

class MatrixVerificationModel {
  final int? id;
  final int? leadId;
  final String? candidateName;
  final String? matrixRefNo;
  final DateTime? verificationDatetime;
  final String? addressProvided;
  final String? addressConfirmed;
  final String? confirmationMode; // 'Written' or 'Verbal'
  final String? respondentName;
  final String? respondentRelationship;
  final String? matrixStatus;
  final String? addressProofDetails;
  final String? neighbourConfirmation; // 'Yes', 'No', or 'NA'
  final String? locationNature; // 'Lower', 'Middle', or 'Upper Class'
  final String? landmark;
  final String? policeStation;
  final String? verificationComment;
  final String? signatureOfRespondent;
  final String? signAuthorizedMatrixRepresentative;
  final String? nameAuthorizedMatrixRepresentative;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  MatrixVerificationModel({
    this.id,
    this.leadId,
    this.candidateName,
    this.matrixRefNo,
    this.verificationDatetime,
    this.addressProvided,
    this.addressConfirmed,
    this.confirmationMode,
    this.respondentName,
    this.respondentRelationship,
    this.matrixStatus,
    this.addressProofDetails,
    this.neighbourConfirmation,
    this.locationNature,
    this.landmark,
    this.policeStation,
    this.verificationComment,
    this.signatureOfRespondent,
    this.signAuthorizedMatrixRepresentative,
    this.nameAuthorizedMatrixRepresentative,
    this.createdAt,
    this.updatedAt,
  });

  factory MatrixVerificationModel.empty() {
    return MatrixVerificationModel(
      id: null,
      leadId: null,
      candidateName: null,
      matrixRefNo: null,
      verificationDatetime: DateTime.now(),
      addressProvided: null,
      addressConfirmed: null,
      confirmationMode: null,
      respondentName: null,
      respondentRelationship: null,
      matrixStatus: null,
      addressProofDetails: null,
      neighbourConfirmation: null,
      locationNature: null,
      landmark: null,
      policeStation: null,
      verificationComment: null,
      signatureOfRespondent: null,
      signAuthorizedMatrixRepresentative: null,
      nameAuthorizedMatrixRepresentative: null,
      createdAt: null,
      updatedAt: null,
    );
  }

  MatrixVerificationModel copyWith({
    int? id,
    int? leadId,
    String? candidateName,
    String? matrixRefNo,
    DateTime? verificationDatetime,
    String? addressProvided,
    String? addressConfirmed,
    String? confirmationMode,
    String? respondentName,
    String? respondentRelationship,
    String? matrixStatus,
    String? addressProofDetails,
    String? neighbourConfirmation,
    String? locationNature,
    String? landmark,
    String? policeStation,
    String? verificationComment,
    String? signatureOfRespondent,
    String? signAuthorizedMatrixRepresentative,
    String? nameAuthorizedMatrixRepresentative,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return MatrixVerificationModel(
      id: id ?? this.id,
      leadId: leadId ?? this.leadId,
      candidateName: candidateName ?? this.candidateName,
      matrixRefNo: matrixRefNo ?? this.matrixRefNo,
      verificationDatetime: verificationDatetime ?? this.verificationDatetime,
      addressProvided: addressProvided ?? this.addressProvided,
      addressConfirmed: addressConfirmed ?? this.addressConfirmed,
      confirmationMode: confirmationMode ?? this.confirmationMode,
      respondentName: respondentName ?? this.respondentName,
      respondentRelationship:
          respondentRelationship ?? this.respondentRelationship,
      matrixStatus: matrixStatus ?? this.matrixStatus,
      addressProofDetails: addressProofDetails ?? this.addressProofDetails,
      neighbourConfirmation:
          neighbourConfirmation ?? this.neighbourConfirmation,
      locationNature: locationNature ?? this.locationNature,
      landmark: landmark ?? this.landmark,
      policeStation: policeStation ?? this.policeStation,
      verificationComment: verificationComment ?? this.verificationComment,
      signatureOfRespondent:
          signatureOfRespondent ?? this.signatureOfRespondent,
      signAuthorizedMatrixRepresentative: signAuthorizedMatrixRepresentative ??
          this.signAuthorizedMatrixRepresentative,
      nameAuthorizedMatrixRepresentative: nameAuthorizedMatrixRepresentative ??
          this.nameAuthorizedMatrixRepresentative,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory MatrixVerificationModel.fromJson(Map<String, dynamic> json) {
    return MatrixVerificationModel(
      id: json['id'] is String ? int.tryParse(json['id']) : json['id'],
      leadId: json['lead_id'] is String
          ? int.tryParse(json['lead_id'])
          : json['lead_id'],
      candidateName: json['candidate_name'],
      matrixRefNo: json['matrix_ref_no'],
      verificationDatetime: json['verification_datetime'] != null
          ? DateTime.parse(json['verification_datetime'])
          : null,
      addressProvided: json['address_provided'],
      addressConfirmed: json['address_confirmed'],
      confirmationMode: json['confirmation_mode'],
      respondentName: json['respondent_name'],
      respondentRelationship: json['respondent_relationship'],
      matrixStatus: json['matrix_status'],
      addressProofDetails: json['address_proof_details'],
      neighbourConfirmation: json['neighbour_confirmation'],
      locationNature: json['location_nature'],
      landmark: json['landmark'],
      policeStation: json['police_station'],
      verificationComment: json['verification_comment'],
      signatureOfRespondent: json['signature_of_respondent'],
      signAuthorizedMatrixRepresentative:
          json['sign_AuthorizedMatrixRepresentative'],
      nameAuthorizedMatrixRepresentative:
          json['name_AuthorizedMatrixRepresentative'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    String? formatDateTime(DateTime? dateTime) {
      if (dateTime == null) return null;
      return DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
    }

    return {
      'id': id,
      'lead_id': leadId,
      'candidate_name': candidateName,
      'matrix_ref_no': matrixRefNo,
      'verification_datetime': formatDateTime(verificationDatetime),
      'address_provided': addressProvided,
      'address_confirmed': addressConfirmed,
      'confirmation_mode': confirmationMode,
      'respondent_name': respondentName,
      'respondent_relationship': respondentRelationship,
      'matrix_status': matrixStatus,
      'address_proof_details': addressProofDetails,
      'neighbour_confirmation': neighbourConfirmation,
      'location_nature': locationNature,
      'landmark': landmark,
      'police_station': policeStation,
      'verification_comment': verificationComment,
      'signature_of_respondent': signatureOfRespondent,
      'sign_AuthorizedMatrixRepresentative': signAuthorizedMatrixRepresentative,
      'name_AuthorizedMatrixRepresentative': nameAuthorizedMatrixRepresentative,
    };
  }
}
