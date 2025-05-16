import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:bhagwatiassociate/features/leads/data/models/employee_address_verification_model.dart';
import 'package:bhagwatiassociate/features/leads/presentation/widgets/verification_form_widgets.dart';
import 'package:bhagwatiassociate/features/leads/presentation/widgets/verification_common_sections.dart';

class EmployeeAddressVerificationForm extends StatefulWidget {
  final EmployeeAddressVerificationModel verification;
  final void Function(EmployeeAddressVerificationModel) onUpdate;
  final GlobalKey<FormState> formKey;

  const EmployeeAddressVerificationForm({
    Key? key,
    required this.verification,
    required this.onUpdate,
    required this.formKey,
  }) : super(key: key);

  @override
  State<EmployeeAddressVerificationForm> createState() =>
      _EmployeeAddressVerificationFormState();
}

class _EmployeeAddressVerificationFormState
    extends State<EmployeeAddressVerificationForm> {
  // Form controllers
  late TextEditingController _candidateNameController;
  late TextEditingController _fatherNameController;
  late TextEditingController _addressController;
  late TextEditingController _dobController;
  late TextEditingController _periodOfStayController;
  late TextEditingController _contactNumberController;
  late TextEditingController _dateTimeAtVisitController;
  late TextEditingController _nameOfRespondentController;
  late TextEditingController _relationController;
  late TextEditingController _landmarkController;
  late TextEditingController _propertyTypeController;
  late TextEditingController _addressTypeController;
  late TextEditingController _periodOfStayFromController;
  late TextEditingController _periodOfStayToController;
  late TextEditingController _noOfFamilyMemberController;
  late TextEditingController _signatureController;
  late TextEditingController _remarksController;
  late TextEditingController _refNoController;

  // Dropdown options
  final List<String> _propertyTypeOptions = [
    'Owned',
    'Rented',
    'Company Provided',
    'PG/Hostel',
    'Paying Guest',
    'With Parents',
    'Other'
  ];
  final List<String> _addressTypeOptions = ['Current', 'Permanent', 'Office'];

  @override
  void initState() {
    super.initState();
    _initControllers();
  }

  void _initControllers() {
    _candidateNameController =
        TextEditingController(text: widget.verification.candidateNameEav ?? '');
    _fatherNameController =
        TextEditingController(text: widget.verification.fatherNameEav ?? '');
    _addressController =
        TextEditingController(text: widget.verification.addressEav ?? '');
    _dobController =
        TextEditingController(text: widget.verification.dobEav ?? '');
    _periodOfStayController =
        TextEditingController(text: widget.verification.periodOfStayEav ?? '');
    _contactNumberController =
        TextEditingController(text: widget.verification.contactNumberEav ?? '');
    _dateTimeAtVisitController = TextEditingController(
        text: widget.verification.dateTimeAtVisitEav ?? '');
    _nameOfRespondentController = TextEditingController(
        text: widget.verification.nameOfRespondentEav ?? '');
    _relationController =
        TextEditingController(text: widget.verification.relationEav ?? '');
    _landmarkController =
        TextEditingController(text: widget.verification.landmarkEav ?? '');
    _propertyTypeController =
        TextEditingController(text: widget.verification.propertyTypeEav ?? '');
    _addressTypeController =
        TextEditingController(text: widget.verification.addressTypeEav ?? '');
    _periodOfStayFromController = TextEditingController(
        text: widget.verification.periodOfStayFromEav ?? '');
    _periodOfStayToController = TextEditingController(
        text: widget.verification.periodOfStayToEav ?? '');
    _noOfFamilyMemberController = TextEditingController(
        text: widget.verification.noOfFamilyMemberEav ?? '');
    _signatureController =
        TextEditingController(text: widget.verification.signatureEav ?? '');
    _remarksController =
        TextEditingController(text: widget.verification.remarksEav ?? '');
    _refNoController =
        TextEditingController(text: widget.verification.refNoEav ?? '');
  }

  @override
  void dispose() {
    _candidateNameController.dispose();
    _fatherNameController.dispose();
    _addressController.dispose();
    _dobController.dispose();
    _periodOfStayController.dispose();
    _contactNumberController.dispose();
    _dateTimeAtVisitController.dispose();
    _nameOfRespondentController.dispose();
    _relationController.dispose();
    _landmarkController.dispose();
    _propertyTypeController.dispose();
    _addressTypeController.dispose();
    _periodOfStayFromController.dispose();
    _periodOfStayToController.dispose();
    _noOfFamilyMemberController.dispose();
    _signatureController.dispose();
    _remarksController.dispose();
    _refNoController.dispose();
    super.dispose();
  }

  void _updateVerification() {
    final updatedVerification = widget.verification.copyWith(
      candidateNameEav: _candidateNameController.text,
      fatherNameEav: _fatherNameController.text,
      addressEav: _addressController.text,
      dobEav: _dobController.text,
      periodOfStayEav: _periodOfStayController.text,
      contactNumberEav: _contactNumberController.text,
      dateTimeAtVisitEav: _dateTimeAtVisitController.text,
      nameOfRespondentEav: _nameOfRespondentController.text,
      relationEav: _relationController.text,
      landmarkEav: _landmarkController.text,
      propertyTypeEav: _propertyTypeController.text,
      addressTypeEav: _addressTypeController.text,
      periodOfStayFromEav: _periodOfStayFromController.text,
      periodOfStayToEav: _periodOfStayToController.text,
      noOfFamilyMemberEav: _noOfFamilyMemberController.text,
      signatureEav: _signatureController.text,
      remarksEav: _remarksController.text,
      refNoEav: _refNoController.text,
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
            'Employee Address Verification Form',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(),

          // Reference Information
          SectionCard(
            title: 'Reference Information',
            children: [
              CustomTextField(
                controller: _refNoController,
                label: 'Reference Number',
                isRequired: true,
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () => _selectDate(_dateTimeAtVisitController),
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: 'Date & Time of Visit',
                    border: const OutlineInputBorder(),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_dateTimeAtVisitController.text.isEmpty
                          ? 'Select Date & Time'
                          : _dateTimeAtVisitController.text),
                      const Icon(Icons.calendar_today),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Candidate Information
          SectionCard(
            title: 'Candidate Information',
            children: [
              CustomTextField(
                controller: _candidateNameController,
                label: 'Candidate Name',
                isRequired: true,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _fatherNameController,
                label: 'Father\'s Name',
                isRequired: true,
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () => _selectDate(_dobController),
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: 'Date of Birth',
                    border: const OutlineInputBorder(),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_dobController.text.isEmpty
                          ? 'Select Date of Birth'
                          : _dobController.text),
                      const Icon(Icons.calendar_today),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _contactNumberController,
                label: 'Contact Number',
                keyboardType: TextInputType.phone,
                isRequired: true,
              ),
            ],
          ),

          // Address Information
          SectionCard(
            title: 'Address Information',
            children: [
              CustomTextField(
                controller: _addressController,
                label: 'Address',
                isRequired: true,
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _landmarkController,
                label: 'Landmark',
                isRequired: true,
              ),
              const SizedBox(height: 16),
              CustomDropdownField(
                label: 'Address Type',
                value: _addressTypeController.text,
                items: _addressTypeOptions,
                isRequired: true,
                onChanged: (value) {
                  setState(() {
                    _addressTypeController.text = value ?? '';
                  });
                  _updateVerification();
                },
              ),
              const SizedBox(height: 16),
              CustomDropdownField(
                label: 'Property Type',
                value: _propertyTypeController.text,
                items: _propertyTypeOptions,
                isRequired: true,
                onChanged: (value) {
                  setState(() {
                    _propertyTypeController.text = value ?? '';
                  });
                  _updateVerification();
                },
              ),
            ],
          ),

          // Stay Information
          SectionCard(
            title: 'Stay Information',
            children: [
              CustomTextField(
                controller: _periodOfStayController,
                label: 'Period of Stay (Years/Months)',
                isRequired: true,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => _selectDate(_periodOfStayFromController),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Stay From',
                          border: const OutlineInputBorder(),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(_periodOfStayFromController.text.isEmpty
                                ? 'From Date'
                                : _periodOfStayFromController.text),
                            const Icon(Icons.calendar_today, size: 16),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: InkWell(
                      onTap: () => _selectDate(_periodOfStayToController),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Stay To',
                          border: const OutlineInputBorder(),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(_periodOfStayToController.text.isEmpty
                                ? 'To Date'
                                : _periodOfStayToController.text),
                            const Icon(Icons.calendar_today, size: 16),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _noOfFamilyMemberController,
                label: 'Number of Family Members',
                keyboardType: TextInputType.number,
              ),
            ],
          ),

          // Respondent Information
          SectionCard(
            title: 'Respondent Information',
            children: [
              CustomTextField(
                controller: _nameOfRespondentController,
                label: 'Name of Respondent',
                isRequired: true,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _relationController,
                label: 'Relation with Candidate',
                isRequired: true,
              ),
            ],
          ),

          // Additional Information
          SectionCard(
            title: 'Additional Information',
            children: [
              CustomTextField(
                controller: _signatureController,
                label: 'Signature (URL or Base64)',
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _remarksController,
                label: 'Remarks',
                maxLines: 3,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
