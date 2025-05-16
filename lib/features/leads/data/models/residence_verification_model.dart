import 'package:intl/intl.dart';

class ResidenceVerificationModel {
  final int? id;
  final int? leadId;
  final String? easeOfLocation;
  final DateTime? dateOfVisit;
  final DateTime? timeOfVisit;
  final String? meetPerson;
  final String? meetPersonRelation;
  final String? livingTime;
  final String? houseStatus;
  final String? maritalStatus;
  final int? customerAge;
  final String? houseMember;
  final String? earningPerson;
  final String? applicantWorking;
  final int? coApplicantCheck;
  final String? coApplicantName;
  final String? coApplicantRelation;
  final String? coApplicantLivingTime;
  final int? coApplicantAge;
  final String? coApplicantMaritalStatus;
  final String? coApplicantWorking;
  final int? child;
  final int? distance;
  final String? neighbour1Name;
  final String? neighbour2Name;
  final String? neighbour1Address;
  final String? neighbour2Address;
  final String? neighbour1Status;
  final String? neighbour2Status;
  final String? status;
  final String? additionalRemark;
  final String? cpvStatus;
  final String? remark;
  final String? dateOfCalling;
  final String? timeOfCalling;
  final String? contactNumber;
  final String? nameOfApplicant;
  final String? contacted;
  final String? spokenTo;
  final String? relationWithApplicant;
  final String? numberOfYearStaying;
  final String? ownershipOfStaying;
  final String? alternateContactNo;
  final String? verifierName;
  final String? agencyManagerName;
  final String? agencyName;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ResidenceVerificationModel({
    this.id,
    this.leadId,
    this.easeOfLocation,
    this.dateOfVisit,
    this.timeOfVisit,
    this.meetPerson,
    this.meetPersonRelation,
    this.livingTime,
    this.houseStatus,
    this.maritalStatus,
    this.customerAge,
    this.houseMember,
    this.earningPerson,
    this.applicantWorking,
    this.coApplicantCheck,
    this.coApplicantName,
    this.coApplicantRelation,
    this.coApplicantLivingTime,
    this.coApplicantAge,
    this.coApplicantMaritalStatus,
    this.coApplicantWorking,
    this.child,
    this.distance,
    this.neighbour1Name,
    this.neighbour2Name,
    this.neighbour1Address,
    this.neighbour2Address,
    this.neighbour1Status,
    this.neighbour2Status,
    this.status,
    this.additionalRemark,
    this.cpvStatus,
    this.remark,
    this.dateOfCalling,
    this.timeOfCalling,
    this.contactNumber,
    this.nameOfApplicant,
    this.contacted,
    this.spokenTo,
    this.relationWithApplicant,
    this.numberOfYearStaying,
    this.ownershipOfStaying,
    this.alternateContactNo,
    this.verifierName,
    this.agencyManagerName,
    this.agencyName,
    this.createdAt,
    this.updatedAt,
  });

  // Add copyWith method
  ResidenceVerificationModel copyWith({
    int? id,
    int? leadId,
    String? easeOfLocation,
    DateTime? dateOfVisit,
    DateTime? timeOfVisit,
    String? meetPerson,
    String? meetPersonRelation,
    String? livingTime,
    String? houseStatus,
    String? maritalStatus,
    int? customerAge,
    String? houseMember,
    String? earningPerson,
    String? applicantWorking,
    int? coApplicantCheck,
    String? coApplicantName,
    String? coApplicantRelation,
    String? coApplicantLivingTime,
    int? coApplicantAge,
    String? coApplicantMaritalStatus,
    String? coApplicantWorking,
    int? child,
    int? distance,
    String? neighbour1Name,
    String? neighbour2Name,
    String? neighbour1Address,
    String? neighbour2Address,
    String? neighbour1Status,
    String? neighbour2Status,
    String? status,
    String? additionalRemark,
    String? cpvStatus,
    String? remark,
    String? dateOfCalling,
    String? timeOfCalling,
    String? contactNumber,
    String? nameOfApplicant,
    String? contacted,
    String? spokenTo,
    String? relationWithApplicant,
    String? numberOfYearStaying,
    String? ownershipOfStaying,
    String? alternateContactNo,
    String? verifierName,
    String? agencyManagerName,
    String? agencyName,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ResidenceVerificationModel(
      id: id ?? this.id,
      leadId: leadId ?? this.leadId,
      easeOfLocation: easeOfLocation ?? this.easeOfLocation,
      dateOfVisit: dateOfVisit ?? this.dateOfVisit,
      timeOfVisit: timeOfVisit ?? this.timeOfVisit,
      meetPerson: meetPerson ?? this.meetPerson,
      meetPersonRelation: meetPersonRelation ?? this.meetPersonRelation,
      livingTime: livingTime ?? this.livingTime,
      houseStatus: houseStatus ?? this.houseStatus,
      maritalStatus: maritalStatus ?? this.maritalStatus,
      customerAge: customerAge ?? this.customerAge,
      houseMember: houseMember ?? this.houseMember,
      earningPerson: earningPerson ?? this.earningPerson,
      applicantWorking: applicantWorking ?? this.applicantWorking,
      coApplicantCheck: coApplicantCheck ?? this.coApplicantCheck,
      coApplicantName: coApplicantName ?? this.coApplicantName,
      coApplicantRelation: coApplicantRelation ?? this.coApplicantRelation,
      coApplicantLivingTime:
          coApplicantLivingTime ?? this.coApplicantLivingTime,
      coApplicantAge: coApplicantAge ?? this.coApplicantAge,
      coApplicantMaritalStatus:
          coApplicantMaritalStatus ?? this.coApplicantMaritalStatus,
      coApplicantWorking: coApplicantWorking ?? this.coApplicantWorking,
      child: child ?? this.child,
      distance: distance ?? this.distance,
      neighbour1Name: neighbour1Name ?? this.neighbour1Name,
      neighbour2Name: neighbour2Name ?? this.neighbour2Name,
      neighbour1Address: neighbour1Address ?? this.neighbour1Address,
      neighbour2Address: neighbour2Address ?? this.neighbour2Address,
      neighbour1Status: neighbour1Status ?? this.neighbour1Status,
      neighbour2Status: neighbour2Status ?? this.neighbour2Status,
      status: status ?? this.status,
      additionalRemark: additionalRemark ?? this.additionalRemark,
      cpvStatus: cpvStatus ?? this.cpvStatus,
      remark: remark ?? this.remark,
      dateOfCalling: dateOfCalling ?? this.dateOfCalling,
      timeOfCalling: timeOfCalling ?? this.timeOfCalling,
      contactNumber: contactNumber ?? this.contactNumber,
      nameOfApplicant: nameOfApplicant ?? this.nameOfApplicant,
      contacted: contacted ?? this.contacted,
      spokenTo: spokenTo ?? this.spokenTo,
      relationWithApplicant:
          relationWithApplicant ?? this.relationWithApplicant,
      numberOfYearStaying: numberOfYearStaying ?? this.numberOfYearStaying,
      ownershipOfStaying: ownershipOfStaying ?? this.ownershipOfStaying,
      alternateContactNo: alternateContactNo ?? this.alternateContactNo,
      verifierName: verifierName ?? this.verifierName,
      agencyManagerName: agencyManagerName ?? this.agencyManagerName,
      agencyName: agencyName ?? this.agencyName,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory ResidenceVerificationModel.empty() {
    return ResidenceVerificationModel(
      id: null,
      leadId: null,
      easeOfLocation: null,
      dateOfVisit: DateTime.now(),
      timeOfVisit: DateTime.now(),
      meetPerson: null,
      meetPersonRelation: null,
      livingTime: null,
      houseStatus: null,
      maritalStatus: null,
      customerAge: null,
      houseMember: null,
      earningPerson: null,
      applicantWorking: null,
      coApplicantCheck: 0,
      coApplicantName: null,
      coApplicantRelation: null,
      coApplicantLivingTime: null,
      coApplicantAge: null,
      coApplicantMaritalStatus: null,
      coApplicantWorking: null,
      child: null,
      distance: null,
      neighbour1Name: null,
      neighbour2Name: null,
      neighbour1Address: null,
      neighbour2Address: null,
      neighbour1Status: null,
      neighbour2Status: null,
      status: null,
      additionalRemark: null,
      cpvStatus: null,
      remark: null,
      dateOfCalling: null,
      timeOfCalling: null,
      contactNumber: null,
      nameOfApplicant: null,
      contacted: null,
      spokenTo: null,
      relationWithApplicant: null,
      numberOfYearStaying: null,
      ownershipOfStaying: null,
      alternateContactNo: null,
      verifierName: null,
      agencyManagerName: null,
      agencyName: null,
      createdAt: null,
      updatedAt: null,
    );
  }

  factory ResidenceVerificationModel.fromJson(Map<String, dynamic> json) {
    return ResidenceVerificationModel(
      id: json['id'],
      leadId: json['lead_id'],
      easeOfLocation: json['ease_of_location'],
      dateOfVisit: json['date_of_visit'] != null
          ? DateTime.parse(json['date_of_visit'])
          : null,
      timeOfVisit: json['time_of_visit'] != null
          ? DateFormat('HH:mm:ss').parse(json['time_of_visit'])
          : null,
      meetPerson: json['meet_person'],
      meetPersonRelation: json['meet_person_relation'],
      livingTime: json['living_time'],
      houseStatus: json['house_status'],
      maritalStatus: json['marital_status'],
      customerAge: json['customer_age'],
      houseMember: json['house_member'],
      earningPerson: json['earning_person'],
      applicantWorking: json['applicant_working'],
      coApplicantCheck: json['co_applicant_check'],
      coApplicantName: json['co_applicant_name'],
      coApplicantRelation: json['co_applicant_relation'],
      coApplicantLivingTime: json['co_applicant_living_time'],
      coApplicantAge: json['co_applicant_age'],
      coApplicantMaritalStatus: json['co_applicant_marital_status'],
      coApplicantWorking: json['co_applicant_working'],
      child: json['child'],
      distance: json['distance'],
      neighbour1Name: json['neighbour1_name'],
      neighbour2Name: json['neighbour2_name'],
      neighbour1Address: json['neighbour1_address'],
      neighbour2Address: json['neighbour2_address'],
      neighbour1Status: json['neighbour1_status'],
      neighbour2Status: json['neighbour2_status'],
      status: json['status'],
      additionalRemark: json['additional_remark'],
      cpvStatus: json['cpv_status'],
      remark: json['remark'],
      dateOfCalling: json['date_of_calling'],
      timeOfCalling: json['time_of_calling'],
      contactNumber: json['contact_number'],
      nameOfApplicant: json['name_of_applicant'],
      contacted: json['contacted'],
      spokenTo: json['spoken_to'],
      relationWithApplicant: json['relation_with_applicant'],
      numberOfYearStaying: json['number_of_year_staying'],
      ownershipOfStaying: json['ownership_of_staying'],
      alternateContactNo: json['alternate_contact_no'],
      verifierName: json['verifier_name'],
      agencyManagerName: json['agency_manager_name'],
      agencyName: json['agency_name'],
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
      'ease_of_location': easeOfLocation,
      'date_of_visit': dateOfVisit != null
          ? DateFormat('yyyy-MM-dd').format(dateOfVisit!)
          : null,
      'time_of_visit': timeOfVisit != null
          ? DateFormat('HH:mm:ss').format(timeOfVisit!)
          : null,
      'meet_person': meetPerson,
      'meet_person_relation': meetPersonRelation,
      'living_time': livingTime,
      'house_status': houseStatus,
      'marital_status': maritalStatus,
      'customer_age': customerAge,
      'house_member': houseMember,
      'earning_person': earningPerson,
      'applicant_working': applicantWorking,
      'co_applicant_check': coApplicantCheck,
      'co_applicant_name': coApplicantName,
      'co_applicant_relation': coApplicantRelation,
      'co_applicant_living_time': coApplicantLivingTime,
      'co_applicant_age': coApplicantAge,
      'co_applicant_marital_status': coApplicantMaritalStatus,
      'co_applicant_working': coApplicantWorking,
      'child': child,
      'distance': distance,
      'neighbour1_name': neighbour1Name,
      'neighbour2_name': neighbour2Name,
      'neighbour1_address': neighbour1Address,
      'neighbour2_address': neighbour2Address,
      'neighbour1_status': neighbour1Status,
      'neighbour2_status': neighbour2Status,
      'status': status,
      'additional_remark': additionalRemark,
      'cpv_status': cpvStatus,
      'remark': remark,
      'date_of_calling': dateOfCalling,
      'time_of_calling': timeOfCalling,
      'contact_number': contactNumber,
      'name_of_applicant': nameOfApplicant,
      'contacted': contacted,
      'spoken_to': spokenTo,
      'relation_with_applicant': relationWithApplicant,
      'number_of_year_staying': numberOfYearStaying,
      'ownership_of_staying': ownershipOfStaying,
      'alternate_contact_no': alternateContactNo,
      'verifier_name': verifierName,
      'agency_manager_name': agencyManagerName,
      'agency_name': agencyName,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
