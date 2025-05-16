import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:bhagwatiassociate/features/leads/data/models/residence_verification_model.dart';
import 'package:bhagwatiassociate/features/leads/presentation/widgets/verification_form_widgets.dart';
import 'package:bhagwatiassociate/features/leads/presentation/widgets/verification_common_sections.dart';

class ResidenceVerificationForm extends StatefulWidget {
  final ResidenceVerificationModel verification;
  final void Function(ResidenceVerificationModel) onUpdate;
  final GlobalKey<FormState> formKey;

  const ResidenceVerificationForm({
    Key? key,
    required this.verification,
    required this.onUpdate,
    required this.formKey,
  }) : super(key: key);

  @override
  State<ResidenceVerificationForm> createState() =>
      _ResidenceVerificationFormState();
}

class _ResidenceVerificationFormState extends State<ResidenceVerificationForm> {
  // Controllers for form fields
  late TextEditingController _easeOfLocationController;
  late TextEditingController _meetPersonController;
  late TextEditingController _meetPersonRelationController;
  late TextEditingController _livingTimeController;
  late TextEditingController _houseStatusController;
  late TextEditingController _maritalStatusController;
  late TextEditingController _customerAgeController;
  late TextEditingController _houseMemberController;
  late TextEditingController _earningPersonController;
  late TextEditingController _applicantWorkingController;

  // Co-applicant controllers
  late bool _hasCoApplicant;
  late TextEditingController _coApplicantNameController;
  late TextEditingController _coApplicantRelationController;
  late TextEditingController _coApplicantLivingTimeController;
  late TextEditingController _coApplicantAgeController;
  late TextEditingController _coApplicantMaritalStatusController;
  late TextEditingController _coApplicantWorkingController;

  // Other controllers
  late TextEditingController _childController;
  late TextEditingController _distanceController;
  late TextEditingController _neighbour1NameController;
  late TextEditingController _neighbour2NameController;
  late TextEditingController _neighbour1AddressController;
  late TextEditingController _neighbour2AddressController;
  late TextEditingController _neighbour1StatusController;
  late TextEditingController _neighbour2StatusController;
  late TextEditingController _statusController;
  late TextEditingController _additionalRemarkController;
  late TextEditingController _cpvStatusController;
  late TextEditingController _remarkController;

  // Date and time
  late DateTime _dateOfVisit;
  late TimeOfDay _timeOfVisit;

  // Dropdown options
  final List<String> _easeOfLocationOptions = [
    'Ease',
    'Difficult',
    'Untraceable'
  ];
  final List<String> _maritalStatusOptions = [
    'Married',
    'Single',
    'Divorced',
    'Widowed'
  ];
  final List<String> _statusOptions = ['Positive', 'Negative', 'Refer'];
  final List<String> _coApplicantMaritalStatusOptions = [
    'Married',
    'Single',
    'Divorced',
    'Widowed'
  ];

  @override
  void initState() {
    super.initState();
    _initControllers();
  }

  void _initControllers() {
    // Initialize controllers with values from the model
    _easeOfLocationController =
        TextEditingController(text: widget.verification.easeOfLocation ?? '');
    _meetPersonController =
        TextEditingController(text: widget.verification.meetPerson ?? '');
    _meetPersonRelationController = TextEditingController(
        text: widget.verification.meetPersonRelation ?? '');
    _livingTimeController =
        TextEditingController(text: widget.verification.livingTime ?? '');
    _houseStatusController =
        TextEditingController(text: widget.verification.houseStatus ?? '');
    _maritalStatusController =
        TextEditingController(text: widget.verification.maritalStatus ?? '');
    _customerAgeController = TextEditingController(
        text: widget.verification.customerAge?.toString() ?? '');
    _houseMemberController =
        TextEditingController(text: widget.verification.houseMember ?? '');
    _earningPersonController =
        TextEditingController(text: widget.verification.earningPerson ?? '');
    _applicantWorkingController =
        TextEditingController(text: widget.verification.applicantWorking ?? '');

    // Co-applicant data
    _hasCoApplicant = (widget.verification.coApplicantCheck ?? 0) > 0;
    _coApplicantNameController =
        TextEditingController(text: widget.verification.coApplicantName ?? '');
    _coApplicantRelationController = TextEditingController(
        text: widget.verification.coApplicantRelation ?? '');
    _coApplicantLivingTimeController = TextEditingController(
        text: widget.verification.coApplicantLivingTime ?? '');
    _coApplicantAgeController = TextEditingController(
        text: widget.verification.coApplicantAge?.toString() ?? '');
    _coApplicantMaritalStatusController = TextEditingController(
        text: widget.verification.coApplicantMaritalStatus ?? '');
    _coApplicantWorkingController = TextEditingController(
        text: widget.verification.coApplicantWorking ?? '');

    // Other details
    _childController = TextEditingController(
        text: widget.verification.child?.toString() ?? '');
    _distanceController = TextEditingController(
        text: widget.verification.distance?.toString() ?? '');
    _neighbour1NameController =
        TextEditingController(text: widget.verification.neighbour1Name ?? '');
    _neighbour2NameController =
        TextEditingController(text: widget.verification.neighbour2Name ?? '');
    _neighbour1AddressController = TextEditingController(
        text: widget.verification.neighbour1Address ?? '');
    _neighbour2AddressController = TextEditingController(
        text: widget.verification.neighbour2Address ?? '');
    _neighbour1StatusController =
        TextEditingController(text: widget.verification.neighbour1Status ?? '');
    _neighbour2StatusController =
        TextEditingController(text: widget.verification.neighbour2Status ?? '');
    _statusController =
        TextEditingController(text: widget.verification.status ?? '');
    _additionalRemarkController =
        TextEditingController(text: widget.verification.additionalRemark ?? '');
    _cpvStatusController =
        TextEditingController(text: widget.verification.cpvStatus ?? '');
    _remarkController =
        TextEditingController(text: widget.verification.remark ?? '');

    // Date and time
    _dateOfVisit = widget.verification.dateOfVisit ?? DateTime.now();
    _timeOfVisit = widget.verification.timeOfVisit != null
        ? TimeOfDay.fromDateTime(widget.verification.timeOfVisit!)
        : TimeOfDay.now();
  }

  @override
  void dispose() {
    // Dispose all controllers
    _easeOfLocationController.dispose();
    _meetPersonController.dispose();
    _meetPersonRelationController.dispose();
    _livingTimeController.dispose();
    _houseStatusController.dispose();
    _maritalStatusController.dispose();
    _customerAgeController.dispose();
    _houseMemberController.dispose();
    _earningPersonController.dispose();
    _applicantWorkingController.dispose();

    _coApplicantNameController.dispose();
    _coApplicantRelationController.dispose();
    _coApplicantLivingTimeController.dispose();
    _coApplicantAgeController.dispose();
    _coApplicantMaritalStatusController.dispose();
    _coApplicantWorkingController.dispose();

    _childController.dispose();
    _distanceController.dispose();
    _neighbour1NameController.dispose();
    _neighbour2NameController.dispose();
    _neighbour1AddressController.dispose();
    _neighbour2AddressController.dispose();
    _neighbour1StatusController.dispose();
    _neighbour2StatusController.dispose();
    _statusController.dispose();
    _additionalRemarkController.dispose();
    _cpvStatusController.dispose();
    _remarkController.dispose();

    super.dispose();
  }

  // Method to update the model with form data
  void _updateVerification() {
    // Check if detailed form data should be included
    final easeOfLocation = _easeOfLocationController.text;
    final bool includeDetailedData =
        easeOfLocation == 'Ease' || easeOfLocation == 'Difficult';

    final updatedVerification = widget.verification.copyWith(
      easeOfLocation: _easeOfLocationController.text,
      // Include these fields only if ease of location is 'Ease' or 'Difficult'
      dateOfVisit: includeDetailedData ? _dateOfVisit : null,
      timeOfVisit: includeDetailedData
          ? DateTime(
              _dateOfVisit.year,
              _dateOfVisit.month,
              _dateOfVisit.day,
              _timeOfVisit.hour,
              _timeOfVisit.minute,
            )
          : null,
      meetPerson: includeDetailedData ? _meetPersonController.text : null,
      meetPersonRelation:
          includeDetailedData ? _meetPersonRelationController.text : null,
      livingTime: includeDetailedData ? _livingTimeController.text : null,
      houseStatus: includeDetailedData ? _houseStatusController.text : null,
      maritalStatus: includeDetailedData ? _maritalStatusController.text : null,
      customerAge: includeDetailedData
          ? int.tryParse(_customerAgeController.text)
          : null,
      houseMember: includeDetailedData ? _houseMemberController.text : null,
      earningPerson: includeDetailedData ? _earningPersonController.text : null,
      applicantWorking:
          includeDetailedData ? _applicantWorkingController.text : null,
      // Co-applicant data (only included if _hasCoApplicant is true)
      coApplicantCheck: _hasCoApplicant ? 1 : 0,
      coApplicantName: _hasCoApplicant ? _coApplicantNameController.text : null,
      coApplicantRelation:
          _hasCoApplicant ? _coApplicantRelationController.text : null,
      coApplicantLivingTime:
          _hasCoApplicant ? _coApplicantLivingTimeController.text : null,
      coApplicantAge:
          _hasCoApplicant ? int.tryParse(_coApplicantAgeController.text) : null,
      coApplicantMaritalStatus:
          _hasCoApplicant ? _coApplicantMaritalStatusController.text : null,
      coApplicantWorking:
          _hasCoApplicant ? _coApplicantWorkingController.text : null,
      // Other fields included for all types
      child: int.tryParse(_childController.text),
      distance: int.tryParse(_distanceController.text),
      neighbour1Name: _neighbour1NameController.text,
      neighbour2Name: _neighbour2NameController.text,
      neighbour1Address: _neighbour1AddressController.text,
      neighbour2Address: _neighbour2AddressController.text,
      neighbour1Status: _neighbour1StatusController.text,
      neighbour2Status: _neighbour2StatusController.text,
      status: _statusController.text,
      additionalRemark: _additionalRemarkController.text,
      cpvStatus: _cpvStatusController.text,
      remark: _remarkController.text,
    );

    widget.onUpdate(updatedVerification);
  }

  @override
  Widget build(BuildContext context) {
    // Get the selected ease of location value
    final easeOfLocation = _easeOfLocationController.text;
    final bool showDetailedForm =
        easeOfLocation == 'Ease' || easeOfLocation == 'Difficult';

    return Form(
      key: widget.formKey,
      onChanged: _updateVerification,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Residence Verification Form',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(),

          // Visit Details
          SectionCard(
            title: 'Visit Details',
            children: [
              // Ease of Location dropdown
              CustomDropdownField(
                label: 'Ease of Location',
                value: _easeOfLocationController.text,
                items: _easeOfLocationOptions,
                isRequired: true,
                onChanged: (value) {
                  setState(() {
                    _easeOfLocationController.text = value ?? '';
                    // Handle co-applicant visibility based on selected value
                    if (value == 'Untraceable') {
                      _hasCoApplicant = false;
                    }
                  });
                  _updateVerification();
                },
              ),
              const SizedBox(height: 16),

              // Only show these fields if ease of location is 'Ease' or 'Difficult'
              if (showDetailedForm) ...[
                // Date of Visit
                DatePickerField(
                  label: 'Date of Visit',
                  value: _dateOfVisit,
                  onChanged: (date) {
                    setState(() {
                      _dateOfVisit = date;
                    });
                    _updateVerification();
                  },
                ),
                const SizedBox(height: 16),

                // Time of Visit
                TimePickerField(
                  label: 'Time of Visit',
                  value: _timeOfVisit,
                  onChanged: (time) {
                    setState(() {
                      _timeOfVisit = time;
                    });
                    _updateVerification();
                  },
                ),
              ],
            ],
          ),

          // Only show these sections if ease of location is 'Ease' or 'Difficult'
          if (showDetailedForm) ...[
            // Person Met Details
            SectionCard(
              title: 'Person Met Details',
              children: [
                CustomTextField(
                  controller: _meetPersonController,
                  label: 'Person Met',
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _meetPersonRelationController,
                  label: 'Relation with Applicant',
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _livingTimeController,
                  label: 'Living Since',
                ),
              ],
            ),

            // House Details
            SectionCard(
              title: 'House Details',
              children: [
                CustomTextField(
                  controller: _houseStatusController,
                  label: 'House Status (Owned/Rented)',
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _houseMemberController,
                  label: 'Number of House Members',
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _earningPersonController,
                  label: 'Earning Members',
                ),
              ],
            ),

            // Applicant Details
            SectionCard(
              title: 'Applicant Details',
              children: [
                CustomTextField(
                  controller: _customerAgeController,
                  label: 'Applicant Age',
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                CustomDropdownField(
                  label: 'Marital Status',
                  value: _maritalStatusController.text,
                  items: _maritalStatusOptions,
                  onChanged: (value) {
                    setState(() {
                      _maritalStatusController.text = value ?? '';
                    });
                    _updateVerification();
                  },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _applicantWorkingController,
                  label: 'Applicant Occupation',
                ),
              ],
            ),
          ],

          // Co-Applicant Section (conditional on _hasCoApplicant)
          _buildCoApplicantSection(),

          // Neighbour Verification
          SectionCard(
            title: 'Neighbour Verification',
            children: [
              CustomTextField(
                controller: _neighbour1NameController,
                label: 'Neighbour 1 Name',
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _neighbour1AddressController,
                label: 'Neighbour 1 Address',
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              CustomDropdownField(
                label: 'Neighbour 1 Status',
                value: _neighbour1StatusController.text,
                items: _statusOptions,
                onChanged: (value) {
                  setState(() {
                    _neighbour1StatusController.text = value ?? '';
                  });
                  _updateVerification();
                },
              ),
              const SizedBox(height: 24),
              CustomTextField(
                controller: _neighbour2NameController,
                label: 'Neighbour 2 Name',
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _neighbour2AddressController,
                label: 'Neighbour 2 Address',
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              CustomDropdownField(
                label: 'Neighbour 2 Status',
                value: _neighbour2StatusController.text,
                items: _statusOptions,
                onChanged: (value) {
                  setState(() {
                    _neighbour2StatusController.text = value ?? '';
                  });
                  _updateVerification();
                },
              ),
            ],
          ),

          // Additional Details
          SectionCard(
            title: 'Additional Details',
            children: [
              CustomDropdownField(
                label: 'Status',
                value: _statusController.text,
                items: _statusOptions,
                onChanged: (value) {
                  setState(() {
                    _statusController.text = value ?? '';
                  });
                  _updateVerification();
                },
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _cpvStatusController,
                label: 'CPV Status',
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _additionalRemarkController,
                label: 'Additional Remarks',
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _remarkController,
                label: 'Remarks',
                maxLines: 3,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCoApplicantSection() {
    return SectionCard(
      title: 'Co-Applicant Details',
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Include Co-Applicant',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Switch(
              value: _hasCoApplicant,
              onChanged: (value) {
                setState(() {
                  _hasCoApplicant = value;
                });
                _updateVerification();
              },
            ),
          ],
        ),
        if (_hasCoApplicant) ...[
          const SizedBox(height: 16),
          CustomTextField(
            controller: _coApplicantNameController,
            label: 'Co-Applicant Name',
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: _coApplicantRelationController,
            label: 'Relation with Applicant',
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: _coApplicantAgeController,
            label: 'Co-Applicant Age',
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          CustomDropdownField(
            label: 'Co-Applicant Marital Status',
            value: _coApplicantMaritalStatusController.text,
            items: _coApplicantMaritalStatusOptions,
            onChanged: (value) {
              setState(() {
                _coApplicantMaritalStatusController.text = value ?? '';
              });
              _updateVerification();
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: _coApplicantWorkingController,
            label: 'Co-Applicant Occupation',
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: _coApplicantLivingTimeController,
            label: 'Co-Applicant Living Since',
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: _childController,
            label: 'Number of Children',
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: _distanceController,
            label: 'Distance from Reference Point (km)',
            keyboardType: TextInputType.number,
          ),
        ],
      ],
    );
  }
}
