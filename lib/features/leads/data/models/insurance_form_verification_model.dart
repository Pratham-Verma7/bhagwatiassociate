import 'package:intl/intl.dart';

class InsuranceFormVerificationModel {
  final int? id;
  final int? leadId;
  final String? proposalNumberIf;
  final String? nameOfLifeAssuredIf;
  final String? lifeInsuredNameIf;
  final String? verificationStatusIf;
  final String? nameOfPersonMetIf;
  final String? relationshipWithApplicantIf;
  final String? applicantDobIf;
  final String? healthConditionIf;
  final String? appliedForPolicyIf;
  final String? receivedThePolicyIf;
  final String? anyMedicalHistoryIf;
  final String? medicalDoneIf;
  final String? educationIf;
  final String? occupationIf;
  final String? annualIncomeOfApplicantIf;
  final String? nameOfShopIf;
  final String? laInformedTheAgentIf;
  final String? existingInsuranceAgentIf;
  final String? nomineeRelationIf;
  final String? insuredPhotoTakenIf;
  final String? idProofTakenIf;
  final String? newAddressObtainedIf;
  final String? residenceLocalityIf;
  final String? residenceOwnershipIf;
  final String? periodOfStayIf;
  final String? phoneNumberIf;
  final String? dateOfVisitIf;
  final String? nameOfIndentityIf;
  final String? habitIf;
  final String? neighbor12If;
  final String? neighbor34If;
  final String? verifierNameIf;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  InsuranceFormVerificationModel({
    this.id,
    this.leadId,
    this.proposalNumberIf,
    this.nameOfLifeAssuredIf,
    this.lifeInsuredNameIf,
    this.verificationStatusIf,
    this.nameOfPersonMetIf,
    this.relationshipWithApplicantIf,
    this.applicantDobIf,
    this.healthConditionIf,
    this.appliedForPolicyIf,
    this.receivedThePolicyIf,
    this.anyMedicalHistoryIf,
    this.medicalDoneIf,
    this.educationIf,
    this.occupationIf,
    this.annualIncomeOfApplicantIf,
    this.nameOfShopIf,
    this.laInformedTheAgentIf,
    this.existingInsuranceAgentIf,
    this.nomineeRelationIf,
    this.insuredPhotoTakenIf,
    this.idProofTakenIf,
    this.newAddressObtainedIf,
    this.residenceLocalityIf,
    this.residenceOwnershipIf,
    this.periodOfStayIf,
    this.phoneNumberIf,
    this.dateOfVisitIf,
    this.nameOfIndentityIf,
    this.habitIf,
    this.neighbor12If,
    this.neighbor34If,
    this.verifierNameIf,
    this.createdAt,
    this.updatedAt,
  });

  factory InsuranceFormVerificationModel.empty() {
    return InsuranceFormVerificationModel(
      id: null,
      leadId: null,
      proposalNumberIf: null,
      nameOfLifeAssuredIf: null,
      lifeInsuredNameIf: null,
      verificationStatusIf: null,
      nameOfPersonMetIf: null,
      relationshipWithApplicantIf: null,
      applicantDobIf: null,
      healthConditionIf: null,
      appliedForPolicyIf: null,
      receivedThePolicyIf: null,
      anyMedicalHistoryIf: null,
      medicalDoneIf: null,
      educationIf: null,
      occupationIf: null,
      annualIncomeOfApplicantIf: null,
      nameOfShopIf: null,
      laInformedTheAgentIf: null,
      existingInsuranceAgentIf: null,
      nomineeRelationIf: null,
      insuredPhotoTakenIf: null,
      idProofTakenIf: null,
      newAddressObtainedIf: null,
      residenceLocalityIf: null,
      residenceOwnershipIf: null,
      periodOfStayIf: null,
      phoneNumberIf: null,
      dateOfVisitIf: null,
      nameOfIndentityIf: null,
      habitIf: null,
      neighbor12If: null,
      neighbor34If: null,
      verifierNameIf: null,
      createdAt: null,
      updatedAt: null,
    );
  }

  InsuranceFormVerificationModel copyWith({
    int? id,
    int? leadId,
    String? proposalNumberIf,
    String? nameOfLifeAssuredIf,
    String? lifeInsuredNameIf,
    String? verificationStatusIf,
    String? nameOfPersonMetIf,
    String? relationshipWithApplicantIf,
    String? applicantDobIf,
    String? healthConditionIf,
    String? appliedForPolicyIf,
    String? receivedThePolicyIf,
    String? anyMedicalHistoryIf,
    String? medicalDoneIf,
    String? educationIf,
    String? occupationIf,
    String? annualIncomeOfApplicantIf,
    String? nameOfShopIf,
    String? laInformedTheAgentIf,
    String? existingInsuranceAgentIf,
    String? nomineeRelationIf,
    String? insuredPhotoTakenIf,
    String? idProofTakenIf,
    String? newAddressObtainedIf,
    String? residenceLocalityIf,
    String? residenceOwnershipIf,
    String? periodOfStayIf,
    String? phoneNumberIf,
    String? dateOfVisitIf,
    String? nameOfIndentityIf,
    String? habitIf,
    String? neighbor12If,
    String? neighbor34If,
    String? verifierNameIf,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return InsuranceFormVerificationModel(
      id: id ?? this.id,
      leadId: leadId ?? this.leadId,
      proposalNumberIf: proposalNumberIf ?? this.proposalNumberIf,
      nameOfLifeAssuredIf: nameOfLifeAssuredIf ?? this.nameOfLifeAssuredIf,
      lifeInsuredNameIf: lifeInsuredNameIf ?? this.lifeInsuredNameIf,
      verificationStatusIf: verificationStatusIf ?? this.verificationStatusIf,
      nameOfPersonMetIf: nameOfPersonMetIf ?? this.nameOfPersonMetIf,
      relationshipWithApplicantIf:
          relationshipWithApplicantIf ?? this.relationshipWithApplicantIf,
      applicantDobIf: applicantDobIf ?? this.applicantDobIf,
      healthConditionIf: healthConditionIf ?? this.healthConditionIf,
      appliedForPolicyIf: appliedForPolicyIf ?? this.appliedForPolicyIf,
      receivedThePolicyIf: receivedThePolicyIf ?? this.receivedThePolicyIf,
      anyMedicalHistoryIf: anyMedicalHistoryIf ?? this.anyMedicalHistoryIf,
      medicalDoneIf: medicalDoneIf ?? this.medicalDoneIf,
      educationIf: educationIf ?? this.educationIf,
      occupationIf: occupationIf ?? this.occupationIf,
      annualIncomeOfApplicantIf:
          annualIncomeOfApplicantIf ?? this.annualIncomeOfApplicantIf,
      nameOfShopIf: nameOfShopIf ?? this.nameOfShopIf,
      laInformedTheAgentIf: laInformedTheAgentIf ?? this.laInformedTheAgentIf,
      existingInsuranceAgentIf:
          existingInsuranceAgentIf ?? this.existingInsuranceAgentIf,
      nomineeRelationIf: nomineeRelationIf ?? this.nomineeRelationIf,
      insuredPhotoTakenIf: insuredPhotoTakenIf ?? this.insuredPhotoTakenIf,
      idProofTakenIf: idProofTakenIf ?? this.idProofTakenIf,
      newAddressObtainedIf: newAddressObtainedIf ?? this.newAddressObtainedIf,
      residenceLocalityIf: residenceLocalityIf ?? this.residenceLocalityIf,
      residenceOwnershipIf: residenceOwnershipIf ?? this.residenceOwnershipIf,
      periodOfStayIf: periodOfStayIf ?? this.periodOfStayIf,
      phoneNumberIf: phoneNumberIf ?? this.phoneNumberIf,
      dateOfVisitIf: dateOfVisitIf ?? this.dateOfVisitIf,
      nameOfIndentityIf: nameOfIndentityIf ?? this.nameOfIndentityIf,
      habitIf: habitIf ?? this.habitIf,
      neighbor12If: neighbor12If ?? this.neighbor12If,
      neighbor34If: neighbor34If ?? this.neighbor34If,
      verifierNameIf: verifierNameIf ?? this.verifierNameIf,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory InsuranceFormVerificationModel.fromJson(Map<String, dynamic> json) {
    return InsuranceFormVerificationModel(
      id: json['id'] is String ? int.tryParse(json['id']) : json['id'],
      leadId: json['lead_id'] is String
          ? int.tryParse(json['lead_id'])
          : json['lead_id'],
      proposalNumberIf: json['proposal_number_if'],
      nameOfLifeAssuredIf: json['name_of_life_assured_if'],
      lifeInsuredNameIf: json['life_insured_name_if'],
      verificationStatusIf: json['verification_status_if'],
      nameOfPersonMetIf: json['name_of_person_met_if'],
      relationshipWithApplicantIf: json['relationship_with_applicant_if'],
      applicantDobIf: json['applicant_dob_if'],
      healthConditionIf: json['health_condition_if'],
      appliedForPolicyIf: json['applied_for_policy_if'],
      receivedThePolicyIf: json['received_the_policy_if'],
      anyMedicalHistoryIf: json['any_medical_history_if'],
      medicalDoneIf: json['medical_done_if'],
      educationIf: json['education_if'],
      occupationIf: json['occupation_if'],
      annualIncomeOfApplicantIf: json['annual_income_of_applicant_if'],
      nameOfShopIf: json['name_of_shop_if'],
      laInformedTheAgentIf: json['la_informed_the_agent_if'],
      existingInsuranceAgentIf: json['existing_insurance_agent_if'],
      nomineeRelationIf: json['nominee_relation_if'],
      insuredPhotoTakenIf: json['insured_photo_taken_if'],
      idProofTakenIf: json['id_proof_taken_if'],
      newAddressObtainedIf: json['new_address_obtained_if'],
      residenceLocalityIf: json['residence_locality_if'],
      residenceOwnershipIf: json['residence_ownership_if'],
      periodOfStayIf: json['period_of_stay_if'],
      phoneNumberIf: json['phone_number_if'],
      dateOfVisitIf: json['date_of_visit_if'],
      nameOfIndentityIf: json['name_of_indentity_if'],
      habitIf: json['habit_if'],
      neighbor12If: json['neighbor_1_2_if'],
      neighbor34If: json['neighbor_3_4_if'],
      verifierNameIf: json['verifier_name_if'],
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
      'proposal_number_if': proposalNumberIf,
      'name_of_life_assured_if': nameOfLifeAssuredIf,
      'life_insured_name_if': lifeInsuredNameIf,
      'verification_status_if': verificationStatusIf,
      'name_of_person_met_if': nameOfPersonMetIf,
      'relationship_with_applicant_if': relationshipWithApplicantIf,
      'applicant_dob_if': applicantDobIf,
      'health_condition_if': healthConditionIf,
      'applied_for_policy_if': appliedForPolicyIf,
      'received_the_policy_if': receivedThePolicyIf,
      'any_medical_history_if': anyMedicalHistoryIf,
      'medical_done_if': medicalDoneIf,
      'education_if': educationIf,
      'occupation_if': occupationIf,
      'annual_income_of_applicant_if': annualIncomeOfApplicantIf,
      'name_of_shop_if': nameOfShopIf,
      'la_informed_the_agent_if': laInformedTheAgentIf,
      'existing_insurance_agent_if': existingInsuranceAgentIf,
      'nominee_relation_if': nomineeRelationIf,
      'insured_photo_taken_if': insuredPhotoTakenIf,
      'id_proof_taken_if': idProofTakenIf,
      'new_address_obtained_if': newAddressObtainedIf,
      'residence_locality_if': residenceLocalityIf,
      'residence_ownership_if': residenceOwnershipIf,
      'period_of_stay_if': periodOfStayIf,
      'phone_number_if': phoneNumberIf,
      'date_of_visit_if': dateOfVisitIf,
      'name_of_indentity_if': nameOfIndentityIf,
      'habit_if': habitIf,
      'neighbor_1_2_if': neighbor12If,
      'neighbor_3_4_if': neighbor34If,
      'verifier_name_if': verifierNameIf,
    };
  }
}
