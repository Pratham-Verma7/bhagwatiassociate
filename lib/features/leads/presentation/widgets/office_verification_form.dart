import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:bhagwatiassociate/features/leads/data/models/office_verification_model.dart';
import 'package:bhagwatiassociate/features/leads/presentation/widgets/verification_form_widgets.dart';
import 'package:bhagwatiassociate/features/leads/presentation/widgets/verification_common_sections.dart';

class OfficeVerificationForm extends StatefulWidget {
  final OfficeVerificationModel verification;
  final void Function(OfficeVerificationModel) onUpdate;
  final GlobalKey<FormState> formKey;

  const OfficeVerificationForm({
    Key? key,
    required this.verification,
    required this.onUpdate,
    required this.formKey,
  }) : super(key: key);

  @override
  State<OfficeVerificationForm> createState() => _OfficeVerificationFormState();
}

class _OfficeVerificationFormState extends State<OfficeVerificationForm> {
  // Form controllers for office verification
  late TextEditingController _easeOfLocationController;
  late TextEditingController _addressConfirmController;
  late TextEditingController _meetPersonController;
  late TextEditingController _meetPersonDesignationController;
  late TextEditingController _customerDesignationController;
  late TextEditingController _workingTimeController;
  late TextEditingController _houseStatusController;
  late TextEditingController _employeeCountController;
  late TextEditingController _salaryController;
  late TextEditingController _businessNatureController;
  late TextEditingController _premisesController;
  late TextEditingController _rentalAmountController;
  late TextEditingController _premiseOtherController;
  late TextEditingController _companyCategoryController;
  late TextEditingController _companyCategoryOtherController;
  late TextEditingController _applicationOccupationController;
  late bool _stockSeen;
  late bool _businessActivitySeen;

  // Common fields
  late TextEditingController _distanceController;
  late TextEditingController _additionalRemarkController;
  late TextEditingController _neighbour1NameController;
  late TextEditingController _neighbour2NameController;
  late TextEditingController _neighbour1AddressController;
  late TextEditingController _neighbour2AddressController;
  late TextEditingController _neighbour1StatusController;
  late TextEditingController _neighbour2StatusController;
  late TextEditingController _statusController;
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
  final List<String> _statusOptions = ['Positive', 'Negative', 'Refer'];
  final List<String> _premisesOptions = [
    'Owned',
    'Rented',
    'Leased',
    'Shared',
    'Other'
  ];
  final List<String> _companyCategoryOptions = [
    'Small',
    'Medium',
    'Large',
    'Corporate',
    'Other'
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
    _addressConfirmController = TextEditingController(
        text: widget.verification.addressConfirm?.toString() ?? '0');
    _meetPersonController =
        TextEditingController(text: widget.verification.meetPerson ?? '');
    _meetPersonDesignationController = TextEditingController(
        text: widget.verification.meetPersonDesignation ?? '');
    _customerDesignationController = TextEditingController(
        text: widget.verification.customerDesignation ?? '');
    _workingTimeController =
        TextEditingController(text: widget.verification.workingTime ?? '');
    _houseStatusController =
        TextEditingController(text: widget.verification.houseStatus ?? '');
    _employeeCountController = TextEditingController(
        text: widget.verification.employeeCount?.toString() ?? '');
    _salaryController = TextEditingController(
        text: widget.verification.salary?.toString() ?? '');
    _businessNatureController =
        TextEditingController(text: widget.verification.businessNature ?? '');
    _premisesController =
        TextEditingController(text: widget.verification.premises ?? '');
    _rentalAmountController = TextEditingController(
        text: widget.verification.rentalAmount?.toString() ?? '');
    _premiseOtherController =
        TextEditingController(text: widget.verification.premiseOther ?? '');
    _companyCategoryController =
        TextEditingController(text: widget.verification.companyCategory ?? '');
    _companyCategoryOtherController = TextEditingController(
        text: widget.verification.companyCategoryOther ?? '');
    _applicationOccupationController = TextEditingController(
        text: widget.verification.applicationOccupation ?? '');
    _stockSeen = widget.verification.stockSeen ?? false;
    _businessActivitySeen = widget.verification.businessActivitySeen ?? false;

    // Common fields
    _distanceController = TextEditingController(
        text: widget.verification.distance?.toString() ?? '');
    _additionalRemarkController =
        TextEditingController(text: widget.verification.additionalRemark ?? '');
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
    _addressConfirmController.dispose();
    _meetPersonController.dispose();
    _meetPersonDesignationController.dispose();
    _customerDesignationController.dispose();
    _workingTimeController.dispose();
    _houseStatusController.dispose();
    _employeeCountController.dispose();
    _salaryController.dispose();
    _businessNatureController.dispose();
    _premisesController.dispose();
    _rentalAmountController.dispose();
    _premiseOtherController.dispose();
    _companyCategoryController.dispose();
    _companyCategoryOtherController.dispose();
    _applicationOccupationController.dispose();

    _distanceController.dispose();
    _additionalRemarkController.dispose();
    _neighbour1NameController.dispose();
    _neighbour2NameController.dispose();
    _neighbour1AddressController.dispose();
    _neighbour2AddressController.dispose();
    _neighbour1StatusController.dispose();
    _neighbour2StatusController.dispose();
    _statusController.dispose();
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
      addressConfirm: int.tryParse(_addressConfirmController.text) ?? 0,
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
      meetPersonDesignation:
          includeDetailedData ? _meetPersonDesignationController.text : null,
      customerDesignation:
          includeDetailedData ? _customerDesignationController.text : null,
      workingTime: includeDetailedData ? _workingTimeController.text : null,
      houseStatus: includeDetailedData ? _houseStatusController.text : null,
      employeeCount: includeDetailedData
          ? int.tryParse(_employeeCountController.text)
          : null,
      salary: includeDetailedData ? int.tryParse(_salaryController.text) : null,
      businessNature:
          includeDetailedData ? _businessNatureController.text : null,
      stockSeen: includeDetailedData ? _stockSeen : false,
      businessActivitySeen: includeDetailedData ? _businessActivitySeen : false,
      premises: includeDetailedData ? _premisesController.text : null,
      rentalAmount: includeDetailedData
          ? int.tryParse(_rentalAmountController.text)
          : null,
      premiseOther: includeDetailedData ? _premiseOtherController.text : null,
      companyCategory:
          includeDetailedData ? _companyCategoryController.text : null,
      companyCategoryOther:
          includeDetailedData ? _companyCategoryOtherController.text : null,
      applicationOccupation:
          includeDetailedData ? _applicationOccupationController.text : null,

      // Common fields included for all types
      distance: int.tryParse(_distanceController.text),
      additionalRemark: _additionalRemarkController.text,
      neighbour1Name: _neighbour1NameController.text,
      neighbour2Name: _neighbour2NameController.text,
      neighbour1Address: _neighbour1AddressController.text,
      neighbour2Address: _neighbour2AddressController.text,
      neighbour1Status: _neighbour1StatusController.text,
      neighbour2Status: _neighbour2StatusController.text,
      status: _statusController.text,
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
            'Office Verification Form',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(),

          // Address Confirmation and Visit Details Section
          SectionCard(
            title: 'Visit Details',
            children: [
              // Address Confirmation
              SwitchField(
                label: 'Address Confirmed',
                value: _addressConfirmController.text == '1',
                onChanged: (value) {
                  setState(() {
                    _addressConfirmController.text = value ? '1' : '0';
                  });
                  _updateVerification();
                },
              ),
              const SizedBox(height: 16),

              // Ease of Location dropdown
              CustomDropdownField(
                label: 'Ease of Location',
                value: _easeOfLocationController.text,
                items: _easeOfLocationOptions,
                isRequired: true,
                onChanged: (value) {
                  setState(() {
                    _easeOfLocationController.text = value ?? '';
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
                  controller: _meetPersonDesignationController,
                  label: 'Person Met Designation',
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _customerDesignationController,
                  label: 'Customer Designation',
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _workingTimeController,
                  label: 'Working Since',
                ),
              ],
            ),

            // Office Details
            SectionCard(
              title: 'Office Details',
              children: [
                CustomTextField(
                  controller: _houseStatusController,
                  label: 'Office Status (Owned/Rented)',
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _employeeCountController,
                  label: 'Number of Employees',
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _salaryController,
                  label: 'Salary',
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _businessNatureController,
                  label: 'Nature of Business',
                ),
                const SizedBox(height: 16),
                SwitchField(
                  label: 'Stock Seen',
                  value: _stockSeen,
                  onChanged: (value) {
                    setState(() {
                      _stockSeen = value;
                    });
                    _updateVerification();
                  },
                ),
                const SizedBox(height: 16),
                SwitchField(
                  label: 'Business Activity Seen',
                  value: _businessActivitySeen,
                  onChanged: (value) {
                    setState(() {
                      _businessActivitySeen = value;
                    });
                    _updateVerification();
                  },
                ),
              ],
            ),

            // Premises Details
            SectionCard(
              title: 'Premises Details',
              children: [
                CustomDropdownField(
                  label: 'Premises Type',
                  value: _premisesController.text,
                  items: _premisesOptions,
                  onChanged: (value) {
                    setState(() {
                      _premisesController.text = value ?? '';
                    });
                    _updateVerification();
                  },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _rentalAmountController,
                  label: 'Rental Amount',
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _premiseOtherController,
                  label: 'Premise Other Details',
                ),
                const SizedBox(height: 16),
                CustomDropdownField(
                  label: 'Company Category',
                  value: _companyCategoryController.text,
                  items: _companyCategoryOptions,
                  onChanged: (value) {
                    setState(() {
                      _companyCategoryController.text = value ?? '';
                    });
                    _updateVerification();
                  },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _companyCategoryOtherController,
                  label: 'Company Category Other',
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _applicationOccupationController,
                  label: 'Application Occupation',
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _distanceController,
                  label: 'Distance from Reference Point (km)',
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ],

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
}
