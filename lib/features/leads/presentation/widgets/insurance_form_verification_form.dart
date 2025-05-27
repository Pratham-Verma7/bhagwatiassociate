import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:bhagwatiassociate/features/leads/data/models/insurance_form_verification_model.dart';
import 'package:bhagwatiassociate/features/leads/presentation/widgets/verification_form_widgets.dart';
import 'package:bhagwatiassociate/features/leads/presentation/widgets/verification_common_sections.dart';

class InsuranceFormVerificationForm extends StatefulWidget {
  final InsuranceFormVerificationModel verification;
  final void Function(InsuranceFormVerificationModel) onUpdate;
  final GlobalKey<FormState> formKey;

  const InsuranceFormVerificationForm({
    Key? key,
    required this.verification,
    required this.onUpdate,
    required this.formKey,
  }) : super(key: key);

  @override
  State<InsuranceFormVerificationForm> createState() =>
      _InsuranceFormVerificationFormState();
}

class _InsuranceFormVerificationFormState
    extends State<InsuranceFormVerificationForm> {
  // Form controllers
  late TextEditingController _proposalNumberController;
  late TextEditingController _nameOfLifeAssuredController;
  late TextEditingController _lifeInsuredNameController;
  late TextEditingController _verificationStatusController;
  late TextEditingController _nameOfPersonMetController;
  late TextEditingController _relationshipWithApplicantController;
  late TextEditingController _applicantDobController;
  late TextEditingController _healthConditionController;
  late TextEditingController _appliedForPolicyController;
  late TextEditingController _receivedThePolicyController;
  late TextEditingController _anyMedicalHistoryController;
  late TextEditingController _medicalDoneController;
  late TextEditingController _educationController;
  late TextEditingController _occupationController;
  late TextEditingController _annualIncomeOfApplicantController;
  late TextEditingController _nameOfShopController;
  late TextEditingController _laInformedTheAgentController;
  late TextEditingController _existingInsuranceAgentController;
  late TextEditingController _nomineeRelationController;
  late TextEditingController _insuredPhotoTakenController;
  late TextEditingController _idProofTakenController;
  late TextEditingController _newAddressObtainedController;
  late TextEditingController _residenceLocalityController;
  late TextEditingController _residenceOwnershipController;
  late TextEditingController _periodOfStayController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _dateOfVisitController;
  late TextEditingController _nameOfIndentityController;
  late TextEditingController _habitController;
  late TextEditingController _neighbor12Controller;
  late TextEditingController _neighbor34Controller;
  late TextEditingController _verifierNameController;



  @override
  void initState() {
    super.initState();
    _initControllers();
  }

  void _initControllers() {
    _proposalNumberController =
        TextEditingController(text: widget.verification.proposalNumberIf ?? '');
    _nameOfLifeAssuredController = TextEditingController(
        text: widget.verification.nameOfLifeAssuredIf ?? '');
    _lifeInsuredNameController = TextEditingController(
        text: widget.verification.lifeInsuredNameIf ?? '');
    _verificationStatusController = TextEditingController(
        text: widget.verification.verificationStatusIf ?? '');
    _nameOfPersonMetController = TextEditingController(
        text: widget.verification.nameOfPersonMetIf ?? '');
    _relationshipWithApplicantController = TextEditingController(
        text: widget.verification.relationshipWithApplicantIf ?? '');
    _applicantDobController =
        TextEditingController(text: widget.verification.applicantDobIf ?? '');
    _healthConditionController = TextEditingController(
        text: widget.verification.healthConditionIf ?? '');
    _appliedForPolicyController = TextEditingController(
        text: widget.verification.appliedForPolicyIf ?? '');
    _receivedThePolicyController = TextEditingController(
        text: widget.verification.receivedThePolicyIf ?? '');
    _anyMedicalHistoryController = TextEditingController(
        text: widget.verification.anyMedicalHistoryIf ?? '');
    _medicalDoneController =
        TextEditingController(text: widget.verification.medicalDoneIf ?? '');
    _educationController =
        TextEditingController(text: widget.verification.educationIf ?? '');
    _occupationController =
        TextEditingController(text: widget.verification.occupationIf ?? '');
    _annualIncomeOfApplicantController = TextEditingController(
        text: widget.verification.annualIncomeOfApplicantIf ?? '');
    _nameOfShopController =
        TextEditingController(text: widget.verification.nameOfShopIf ?? '');
    _laInformedTheAgentController = TextEditingController(
        text: widget.verification.laInformedTheAgentIf ?? '');
    _existingInsuranceAgentController = TextEditingController(
        text: widget.verification.existingInsuranceAgentIf ?? '');
    _nomineeRelationController = TextEditingController(
        text: widget.verification.nomineeRelationIf ?? '');
    _insuredPhotoTakenController = TextEditingController(
        text: widget.verification.insuredPhotoTakenIf ?? '');
    _idProofTakenController =
        TextEditingController(text: widget.verification.idProofTakenIf ?? '');
    _newAddressObtainedController = TextEditingController(
        text: widget.verification.newAddressObtainedIf ?? '');
    _residenceLocalityController = TextEditingController(
        text: widget.verification.residenceLocalityIf ?? '');
    _residenceOwnershipController = TextEditingController(
        text: widget.verification.residenceOwnershipIf ?? '');
    _periodOfStayController =
        TextEditingController(text: widget.verification.periodOfStayIf ?? '');
    _phoneNumberController =
        TextEditingController(text: widget.verification.phoneNumberIf ?? '');
    _dateOfVisitController =
        TextEditingController(text: widget.verification.dateOfVisitIf ?? '');
    _nameOfIndentityController = TextEditingController(
        text: widget.verification.nameOfIndentityIf ?? '');
    _habitController =
        TextEditingController(text: widget.verification.habitIf ?? '');
    _neighbor12Controller =
        TextEditingController(text: widget.verification.neighbor12If ?? '');
    _neighbor34Controller =
        TextEditingController(text: widget.verification.neighbor34If ?? '');
    _verifierNameController =
        TextEditingController(text: widget.verification.verifierNameIf ?? '');
  }

  @override
  void dispose() {
    _proposalNumberController.dispose();
    _nameOfLifeAssuredController.dispose();
    _lifeInsuredNameController.dispose();
    _verificationStatusController.dispose();
    _nameOfPersonMetController.dispose();
    _relationshipWithApplicantController.dispose();
    _applicantDobController.dispose();
    _healthConditionController.dispose();
    _appliedForPolicyController.dispose();
    _receivedThePolicyController.dispose();
    _anyMedicalHistoryController.dispose();
    _medicalDoneController.dispose();
    _educationController.dispose();
    _occupationController.dispose();
    _annualIncomeOfApplicantController.dispose();
    _nameOfShopController.dispose();
    _laInformedTheAgentController.dispose();
    _existingInsuranceAgentController.dispose();
    _nomineeRelationController.dispose();
    _insuredPhotoTakenController.dispose();
    _idProofTakenController.dispose();
    _newAddressObtainedController.dispose();
    _residenceLocalityController.dispose();
    _residenceOwnershipController.dispose();
    _periodOfStayController.dispose();
    _phoneNumberController.dispose();
    _dateOfVisitController.dispose();
    _nameOfIndentityController.dispose();
    _habitController.dispose();
    _neighbor12Controller.dispose();
    _neighbor34Controller.dispose();
    _verifierNameController.dispose();
    super.dispose();
  }

  void _updateVerification() {
    final updatedVerification = widget.verification.copyWith(
      proposalNumberIf: _proposalNumberController.text,
      nameOfLifeAssuredIf: _nameOfLifeAssuredController.text,
      lifeInsuredNameIf: _lifeInsuredNameController.text,
      verificationStatusIf: _verificationStatusController.text,
      nameOfPersonMetIf: _nameOfPersonMetController.text,
      relationshipWithApplicantIf: _relationshipWithApplicantController.text,
      applicantDobIf: _applicantDobController.text,
      healthConditionIf: _healthConditionController.text,
      appliedForPolicyIf: _appliedForPolicyController.text,
      receivedThePolicyIf: _receivedThePolicyController.text,
      anyMedicalHistoryIf: _anyMedicalHistoryController.text,
      medicalDoneIf: _medicalDoneController.text,
      educationIf: _educationController.text,
      occupationIf: _occupationController.text,
      annualIncomeOfApplicantIf: _annualIncomeOfApplicantController.text,
      nameOfShopIf: _nameOfShopController.text,
      laInformedTheAgentIf: _laInformedTheAgentController.text,
      existingInsuranceAgentIf: _existingInsuranceAgentController.text,
      nomineeRelationIf: _nomineeRelationController.text,
      insuredPhotoTakenIf: _insuredPhotoTakenController.text,
      idProofTakenIf: _idProofTakenController.text,
      newAddressObtainedIf: _newAddressObtainedController.text,
      residenceLocalityIf: _residenceLocalityController.text,
      residenceOwnershipIf: _residenceOwnershipController.text,
      periodOfStayIf: _periodOfStayController.text,
      phoneNumberIf: _phoneNumberController.text,
      dateOfVisitIf: _dateOfVisitController.text,
      nameOfIndentityIf: _nameOfIndentityController.text,
      habitIf: _habitController.text,
      neighbor12If: _neighbor12Controller.text,
      neighbor34If: _neighbor34Controller.text,
      verifierNameIf: _verifierNameController.text,
    );

    widget.onUpdate(updatedVerification);
  }

  Future<void> _selectDate(TextEditingController controller) async {
    final DateTime now = DateTime.now();
    DateTime? initialDate;
    try {
      initialDate = DateFormat('yyyy-MM-dd').parse(controller.text);
    } catch (e) {
      initialDate = now;
    }

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      controller.text = DateFormat('yyyy-MM-dd').format(picked);
      _updateVerification();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      onChanged: _updateVerification,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Insurance Form Verification',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(),

          // Basic Information Section
          SectionCard(
            title: 'Basic Information',
            children: [
              CustomTextField(
                controller: _proposalNumberController,
                label: 'Proposal Number',
                isRequired: true,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _nameOfLifeAssuredController,
                label: 'Name of Life Assured',
                isRequired: true,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _lifeInsuredNameController,
                label: 'Life Insured Name',
                isRequired: true,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _verificationStatusController,
                label: 'Verification Status',
                isRequired: true,
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () => _selectDate(_dateOfVisitController),
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: 'Date of Visit',
                    border: const OutlineInputBorder(),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_dateOfVisitController.text.isEmpty
                          ? 'Select Date'
                          : _dateOfVisitController.text),
                      const Icon(Icons.calendar_today),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Respondent Information
          SectionCard(
            title: 'Respondent Information',
            children: [
              CustomTextField(
                controller: _nameOfPersonMetController,
                label: 'Name of Person Met',
                isRequired: true,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _relationshipWithApplicantController,
                label: 'Relationship with Applicant',
                isRequired: true,
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () => _selectDate(_applicantDobController),
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: 'Applicant Date of Birth',
                    border: const OutlineInputBorder(),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_applicantDobController.text.isEmpty
                          ? 'Select Date'
                          : _applicantDobController.text),
                      const Icon(Icons.calendar_today),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _phoneNumberController,
                label: 'Phone Number',
                keyboardType: TextInputType.phone,
                isRequired: true,
              ),
            ],
          ),

          // Health and Policy Information
          SectionCard(
            title: 'Health and Policy Information',
            children: [
              CustomTextField(
                controller: _healthConditionController,
                label: 'Health Condition',
                isRequired: true,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _appliedForPolicyController,
                label: 'Applied for Policy',
                isRequired: true,
                hintText: 'Yes/No',
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _receivedThePolicyController,
                label: 'Received the Policy',
                isRequired: true,
                hintText: 'Yes/No',
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _anyMedicalHistoryController,
                label: 'Any Medical History',
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _medicalDoneController,
                label: 'Medical Done',
                isRequired: true,
                hintText: 'Yes/No',
              ),
            ],
          ),

          // Applicant Background
          SectionCard(
            title: 'Applicant Background',
            children: [
              CustomTextField(
                controller: _educationController,
                label: 'Education',
                isRequired: true,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _occupationController,
                label: 'Occupation',
                isRequired: true,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _annualIncomeOfApplicantController,
                label: 'Annual Income of Applicant',
                keyboardType: TextInputType.number,
                isRequired: true,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _nameOfShopController,
                label: 'Name of Shop/Business',
              ),
            ],
          ),

          // Agent Information
          SectionCard(
            title: 'Agent Information',
            children: [
              CustomTextField(
                controller: _laInformedTheAgentController,
                label: 'LA Informed the Agent',
                isRequired: true,
                hintText: 'Yes/No',
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _existingInsuranceAgentController,
                label: 'Existing Insurance Agent',
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _nomineeRelationController,
                label: 'Nominee Relation',
                isRequired: true,
              ),
            ],
          ),

          // Documentation
          SectionCard(
            title: 'Documentation',
            children: [
              CustomTextField(
                controller: _insuredPhotoTakenController,
                label: 'Insured Photo Taken',
                isRequired: true,
                hintText: 'Yes/No',
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _idProofTakenController,
                label: 'ID Proof Taken',
                isRequired: true,
                hintText: 'Yes/No',
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _newAddressObtainedController,
                label: 'New Address Obtained',
                isRequired: true,
                hintText: 'Yes/No',
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _nameOfIndentityController,
                label: 'Name of Identity Document',
              ),
            ],
          ),

          // Residence Information
          SectionCard(
            title: 'Residence Information',
            children: [
              CustomTextField(
                controller: _residenceLocalityController,
                label: 'Residence Locality',
                isRequired: true,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _residenceOwnershipController,
                label: 'Residence Ownership',
                isRequired: true,
                hintText: 'Owned/Rented/Company Provided/Other',
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _periodOfStayController,
                label: 'Period of Stay',
                isRequired: true,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _habitController,
                label: 'Habit',
              ),
            ],
          ),

          // Neighbor Information
          SectionCard(
            title: 'Neighbor Information',
            children: [
              CustomTextField(
                controller: _neighbor12Controller,
                label: 'Neighbor 1-2 Information',
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _neighbor34Controller,
                label: 'Neighbor 3-4 Information',
                maxLines: 3,
              ),
            ],
          ),

          // Verifier Information
          SectionCard(
            title: 'Verifier Information',
            children: [
              CustomTextField(
                controller: _verifierNameController,
                label: 'Verifier Name',
                isRequired: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
