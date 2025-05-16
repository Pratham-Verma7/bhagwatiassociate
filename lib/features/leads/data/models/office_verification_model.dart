import 'package:intl/intl.dart';

class OfficeVerificationModel {
  final int? id;
  final int? leadId;
  final int? addressConfirm;
  final String? easeOfLocation;
  final DateTime? dateOfVisit;
  final DateTime? timeOfVisit;
  final String? meetPerson;
  final String? meetPersonDesignation;
  final String? customerDesignation;
  final String? workingTime;
  final String? houseStatus;
  final int? employeeCount;
  final int? salary;
  final String? businessNature;
  final bool? stockSeen;
  final bool? businessActivitySeen;
  final String? premises;
  final int? rentalAmount;
  final String? premiseOther;
  final String? companyCategory;
  final String? companyCategoryOther;
  final String? applicationOccupation;
  final int? distance;
  final String? additionalRemark;
  final String? neighbour1Name;
  final String? neighbour2Name;
  final String? neighbour1Address;
  final String? neighbour2Address;
  final String? neighbour1Status;
  final String? neighbour2Status;
  final String? status;
  final String? remark;
  final String? cpvStatus;
  final String? verifierName;
  final String? agencyName;
  final String? agencyManagerName;
  final String? dateOfCalling;
  final String? timeOfCalling;
  final String? nameOfApplicant;
  final String? contactNumber;
  final String? contacted;
  final String? spokenToDesignation;
  final String? applicantWorkingSince;
  final String? applicantDesignation;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  OfficeVerificationModel({
    this.id,
    this.leadId,
    this.addressConfirm,
    this.easeOfLocation,
    this.dateOfVisit,
    this.timeOfVisit,
    this.meetPerson,
    this.meetPersonDesignation,
    this.customerDesignation,
    this.workingTime,
    this.houseStatus,
    this.employeeCount,
    this.salary,
    this.businessNature,
    this.stockSeen,
    this.businessActivitySeen,
    this.premises,
    this.rentalAmount,
    this.premiseOther,
    this.companyCategory,
    this.companyCategoryOther,
    this.applicationOccupation,
    this.distance,
    this.additionalRemark,
    this.neighbour1Name,
    this.neighbour2Name,
    this.neighbour1Address,
    this.neighbour2Address,
    this.neighbour1Status,
    this.neighbour2Status,
    this.status,
    this.remark,
    this.cpvStatus,
    this.verifierName,
    this.agencyName,
    this.agencyManagerName,
    this.dateOfCalling,
    this.timeOfCalling,
    this.nameOfApplicant,
    this.contactNumber,
    this.contacted,
    this.spokenToDesignation,
    this.applicantWorkingSince,
    this.applicantDesignation,
    this.createdAt,
    this.updatedAt,
  });

  // Add copyWith method
  OfficeVerificationModel copyWith({
    int? id,
    int? leadId,
    int? addressConfirm,
    String? easeOfLocation,
    DateTime? dateOfVisit,
    DateTime? timeOfVisit,
    String? meetPerson,
    String? meetPersonDesignation,
    String? customerDesignation,
    String? workingTime,
    String? houseStatus,
    int? employeeCount,
    int? salary,
    String? businessNature,
    bool? stockSeen,
    bool? businessActivitySeen,
    String? premises,
    int? rentalAmount,
    String? premiseOther,
    String? companyCategory,
    String? companyCategoryOther,
    String? applicationOccupation,
    int? distance,
    String? additionalRemark,
    String? neighbour1Name,
    String? neighbour2Name,
    String? neighbour1Address,
    String? neighbour2Address,
    String? neighbour1Status,
    String? neighbour2Status,
    String? status,
    String? remark,
    String? cpvStatus,
    String? verifierName,
    String? agencyName,
    String? agencyManagerName,
    String? dateOfCalling,
    String? timeOfCalling,
    String? nameOfApplicant,
    String? contactNumber,
    String? contacted,
    String? spokenToDesignation,
    String? applicantWorkingSince,
    String? applicantDesignation,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return OfficeVerificationModel(
      id: id ?? this.id,
      leadId: leadId ?? this.leadId,
      addressConfirm: addressConfirm ?? this.addressConfirm,
      easeOfLocation: easeOfLocation ?? this.easeOfLocation,
      dateOfVisit: dateOfVisit ?? this.dateOfVisit,
      timeOfVisit: timeOfVisit ?? this.timeOfVisit,
      meetPerson: meetPerson ?? this.meetPerson,
      meetPersonDesignation:
          meetPersonDesignation ?? this.meetPersonDesignation,
      customerDesignation: customerDesignation ?? this.customerDesignation,
      workingTime: workingTime ?? this.workingTime,
      houseStatus: houseStatus ?? this.houseStatus,
      employeeCount: employeeCount ?? this.employeeCount,
      salary: salary ?? this.salary,
      businessNature: businessNature ?? this.businessNature,
      stockSeen: stockSeen ?? this.stockSeen,
      businessActivitySeen: businessActivitySeen ?? this.businessActivitySeen,
      premises: premises ?? this.premises,
      rentalAmount: rentalAmount ?? this.rentalAmount,
      premiseOther: premiseOther ?? this.premiseOther,
      companyCategory: companyCategory ?? this.companyCategory,
      companyCategoryOther: companyCategoryOther ?? this.companyCategoryOther,
      applicationOccupation:
          applicationOccupation ?? this.applicationOccupation,
      distance: distance ?? this.distance,
      additionalRemark: additionalRemark ?? this.additionalRemark,
      neighbour1Name: neighbour1Name ?? this.neighbour1Name,
      neighbour2Name: neighbour2Name ?? this.neighbour2Name,
      neighbour1Address: neighbour1Address ?? this.neighbour1Address,
      neighbour2Address: neighbour2Address ?? this.neighbour2Address,
      neighbour1Status: neighbour1Status ?? this.neighbour1Status,
      neighbour2Status: neighbour2Status ?? this.neighbour2Status,
      status: status ?? this.status,
      remark: remark ?? this.remark,
      cpvStatus: cpvStatus ?? this.cpvStatus,
      verifierName: verifierName ?? this.verifierName,
      agencyName: agencyName ?? this.agencyName,
      agencyManagerName: agencyManagerName ?? this.agencyManagerName,
      dateOfCalling: dateOfCalling ?? this.dateOfCalling,
      timeOfCalling: timeOfCalling ?? this.timeOfCalling,
      nameOfApplicant: nameOfApplicant ?? this.nameOfApplicant,
      contactNumber: contactNumber ?? this.contactNumber,
      contacted: contacted ?? this.contacted,
      spokenToDesignation: spokenToDesignation ?? this.spokenToDesignation,
      applicantWorkingSince:
          applicantWorkingSince ?? this.applicantWorkingSince,
      applicantDesignation: applicantDesignation ?? this.applicantDesignation,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory OfficeVerificationModel.empty() {
    return OfficeVerificationModel(
      id: null,
      leadId: null,
      addressConfirm: 0,
      easeOfLocation: null,
      dateOfVisit: DateTime.now(),
      timeOfVisit: DateTime.now(),
      meetPerson: null,
      meetPersonDesignation: null,
      customerDesignation: null,
      workingTime: null,
      houseStatus: null,
      employeeCount: null,
      salary: null,
      businessNature: null,
      stockSeen: false,
      businessActivitySeen: false,
      premises: null,
      rentalAmount: null,
      premiseOther: null,
      companyCategory: null,
      companyCategoryOther: null,
      applicationOccupation: null,
      distance: null,
      additionalRemark: null,
      neighbour1Name: null,
      neighbour2Name: null,
      neighbour1Address: null,
      neighbour2Address: null,
      neighbour1Status: null,
      neighbour2Status: null,
      status: null,
      remark: null,
      cpvStatus: null,
      verifierName: null,
      agencyName: null,
      agencyManagerName: null,
      dateOfCalling: null,
      timeOfCalling: null,
      nameOfApplicant: null,
      contactNumber: null,
      contacted: null,
      spokenToDesignation: null,
      applicantWorkingSince: null,
      applicantDesignation: null,
      createdAt: null,
      updatedAt: null,
    );
  }

  factory OfficeVerificationModel.fromJson(Map<String, dynamic> json) {
    return OfficeVerificationModel(
      id: json['id'] is String ? int.tryParse(json['id']) : json['id'],
      leadId: json['lead_id'] is String
          ? int.tryParse(json['lead_id'])
          : json['lead_id'],
      addressConfirm: json['address_confirm'] is String
          ? int.tryParse(json['address_confirm'])
          : json['address_confirm'],
      easeOfLocation: json['ease_of_location'],
      dateOfVisit: json['date_of_visit'] != null
          ? DateTime.parse(json['date_of_visit'])
          : null,
      timeOfVisit: json['time_of_visit'] != null
          ? DateTime.parse('2000-01-01 ${json['time_of_visit']}')
          : null,
      meetPerson: json['meet_person'],
      meetPersonDesignation: json['meet_person_designation'],
      customerDesignation: json['customer_designation'],
      workingTime: json['working_time'],
      houseStatus: json['house_status'],
      employeeCount: json['employee_count'] is String
          ? int.tryParse(json['employee_count'])
          : json['employee_count'],
      salary: json['salary'] is String
          ? int.tryParse(json['salary'])
          : json['salary'],
      businessNature: json['business_nature'],
      stockSeen: json['stock_seen'] == 1 ||
          json['stock_seen'] == '1' ||
          json['stock_seen'] == true,
      businessActivitySeen: json['business_activity_seen'] == 1 ||
          json['business_activity_seen'] == '1' ||
          json['business_activity_seen'] == true,
      premises: json['premises'],
      rentalAmount: json['rental_amount'] is String
          ? int.tryParse(json['rental_amount'])
          : json['rental_amount'],
      premiseOther: json['premise_other'],
      companyCategory: json['company_category'],
      companyCategoryOther: json['company_category_other'],
      applicationOccupation: json['application_occupation'],
      distance: json['distance'] is String
          ? int.tryParse(json['distance'])
          : json['distance'],
      additionalRemark: json['additional_remark'],
      neighbour1Name: json['neighbour1_name'],
      neighbour2Name: json['neighbour2_name'],
      neighbour1Address: json['neighbour1_address'],
      neighbour2Address: json['neighbour2_address'],
      neighbour1Status: json['neighbour1_status'],
      neighbour2Status: json['neighbour2_status'],
      status: json['status'],
      remark: json['remark'],
      cpvStatus: json['cpv_status'],
      verifierName: json['verifier_name'],
      agencyName: json['agency_name'],
      agencyManagerName: json['agency_manager_name'],
      dateOfCalling: json['date_of_calling'],
      timeOfCalling: json['time_of_calling'],
      nameOfApplicant: json['name_of_applicant'],
      contactNumber: json['contact_number'],
      contacted: json['contacted'],
      spokenToDesignation: json['spoken_to_designation'],
      applicantWorkingSince: json['applicant_working_since'],
      applicantDesignation: json['applicant_designation'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    String? formatDateOfVisit() {
      if (dateOfVisit == null) return null;
      return DateFormat('yyyy-MM-dd').format(dateOfVisit!);
    }

    String? formatTimeOfVisit() {
      if (timeOfVisit == null) return null;
      return DateFormat('HH:mm:ss').format(timeOfVisit!);
    }

    return {
      'id': id,
      'lead_id': leadId,
      'address_confirm': addressConfirm,
      'ease_of_location': easeOfLocation,
      'date_of_visit': formatDateOfVisit(),
      'time_of_visit': formatTimeOfVisit(),
      'meet_person': meetPerson,
      'meet_person_designation': meetPersonDesignation,
      'customer_designation': customerDesignation,
      'working_time': workingTime,
      'house_status': houseStatus,
      'employee_count': employeeCount,
      'salary': salary,
      'business_nature': businessNature,
      'stock_seen': stockSeen == true ? 1 : 0,
      'business_activity_seen': businessActivitySeen == true ? 1 : 0,
      'premises': premises,
      'rental_amount': rentalAmount,
      'premise_other': premiseOther,
      'company_category': companyCategory,
      'company_category_other': companyCategoryOther,
      'application_occupation': applicationOccupation,
      'distance': distance,
      'additional_remark': additionalRemark,
      'neighbour1_name': neighbour1Name,
      'neighbour2_name': neighbour2Name,
      'neighbour1_address': neighbour1Address,
      'neighbour2_address': neighbour2Address,
      'neighbour1_status': neighbour1Status,
      'neighbour2_status': neighbour2Status,
      'status': status,
      'remark': remark,
      'cpv_status': cpvStatus,
      'verifier_name': verifierName,
      'agency_name': agencyName,
      'agency_manager_name': agencyManagerName,
      'date_of_calling': dateOfCalling,
      'time_of_calling': timeOfCalling,
      'name_of_applicant': nameOfApplicant,
      'contact_number': contactNumber,
      'contacted': contacted,
      'spoken_to_designation': spokenToDesignation,
      'applicant_working_since': applicantWorkingSince,
      'applicant_designation': applicantDesignation,
    };
  }
}
