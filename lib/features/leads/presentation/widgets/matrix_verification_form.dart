import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:bhagwatiassociate/features/leads/data/models/matrix_verification_model.dart';
import 'package:bhagwatiassociate/features/leads/presentation/widgets/verification_form_widgets.dart';
import 'package:bhagwatiassociate/features/leads/presentation/widgets/verification_common_sections.dart';

class MatrixVerificationForm extends StatefulWidget {
  final MatrixVerificationModel verification;
  final void Function(MatrixVerificationModel) onUpdate;
  final GlobalKey<FormState> formKey;

  const MatrixVerificationForm({
    Key? key,
    required this.verification,
    required this.onUpdate,
    required this.formKey,
  }) : super(key: key);

  @override
  State<MatrixVerificationForm> createState() => _MatrixVerificationFormState();
}

class _MatrixVerificationFormState extends State<MatrixVerificationForm> {
  // Form controllers
  late TextEditingController _candidateNameController;
  late TextEditingController _matrixRefNoController;
  late DateTime _verificationDateTime;
  late TextEditingController _addressProvidedController;
  late TextEditingController _addressConfirmedController;
  late TextEditingController _confirmationModeController;
  late TextEditingController _respondentNameController;
  late TextEditingController _respondentRelationshipController;
  late TextEditingController _matrixStatusController;
  late TextEditingController _addressProofDetailsController;
  late TextEditingController _neighbourConfirmationController;
  late TextEditingController _locationNatureController;
  late TextEditingController _landmarkController;
  late TextEditingController _policeStationController;
  late TextEditingController _verificationCommentController;
  late TextEditingController _signatureOfRespondentController;
  late TextEditingController _signAuthorizedMatrixRepresentativeController;
  late TextEditingController _nameAuthorizedMatrixRepresentativeController;

  // Dropdown options
  final List<String> _confirmationModeOptions = ['Written', 'Verbal'];
  final List<String> _neighbourConfirmationOptions = ['Yes', 'No', 'NA'];
  final List<String> _locationNatureOptions = [
    'Lower',
    'Middle',
    'Upper Class'
  ];
  final List<String> _matrixStatusOptions = ['Positive', 'Negative', 'On Hold'];

  @override
  void initState() {
    super.initState();
    _initControllers();
  }

  void _initControllers() {
    _candidateNameController =
        TextEditingController(text: widget.verification.candidateName ?? '');
    _matrixRefNoController =
        TextEditingController(text: widget.verification.matrixRefNo ?? '');
    _verificationDateTime =
        widget.verification.verificationDatetime ?? DateTime.now();
    _addressProvidedController =
        TextEditingController(text: widget.verification.addressProvided ?? '');
    _addressConfirmedController =
        TextEditingController(text: widget.verification.addressConfirmed ?? '');
    _confirmationModeController =
        TextEditingController(text: widget.verification.confirmationMode ?? '');
    _respondentNameController =
        TextEditingController(text: widget.verification.respondentName ?? '');
    _respondentRelationshipController = TextEditingController(
        text: widget.verification.respondentRelationship ?? '');
    _matrixStatusController =
        TextEditingController(text: widget.verification.matrixStatus ?? '');
    _addressProofDetailsController = TextEditingController(
        text: widget.verification.addressProofDetails ?? '');
    _neighbourConfirmationController = TextEditingController(
        text: widget.verification.neighbourConfirmation ?? '');
    _locationNatureController =
        TextEditingController(text: widget.verification.locationNature ?? '');
    _landmarkController =
        TextEditingController(text: widget.verification.landmark ?? '');
    _policeStationController =
        TextEditingController(text: widget.verification.policeStation ?? '');
    _verificationCommentController = TextEditingController(
        text: widget.verification.verificationComment ?? '');
    _signatureOfRespondentController = TextEditingController(
        text: widget.verification.signatureOfRespondent ?? '');
    _signAuthorizedMatrixRepresentativeController = TextEditingController(
        text: widget.verification.signAuthorizedMatrixRepresentative ?? '');
    _nameAuthorizedMatrixRepresentativeController = TextEditingController(
        text: widget.verification.nameAuthorizedMatrixRepresentative ?? '');
  }

  @override
  void dispose() {
    _candidateNameController.dispose();
    _matrixRefNoController.dispose();
    _addressProvidedController.dispose();
    _addressConfirmedController.dispose();
    _confirmationModeController.dispose();
    _respondentNameController.dispose();
    _respondentRelationshipController.dispose();
    _matrixStatusController.dispose();
    _addressProofDetailsController.dispose();
    _neighbourConfirmationController.dispose();
    _locationNatureController.dispose();
    _landmarkController.dispose();
    _policeStationController.dispose();
    _verificationCommentController.dispose();
    _signatureOfRespondentController.dispose();
    _signAuthorizedMatrixRepresentativeController.dispose();
    _nameAuthorizedMatrixRepresentativeController.dispose();

    super.dispose();
  }

  void _updateVerification() {
    final updatedVerification = widget.verification.copyWith(
      candidateName: _candidateNameController.text,
      matrixRefNo: _matrixRefNoController.text,
      verificationDatetime: _verificationDateTime,
      addressProvided: _addressProvidedController.text,
      addressConfirmed: _addressConfirmedController.text,
      confirmationMode: _confirmationModeController.text,
      respondentName: _respondentNameController.text,
      respondentRelationship: _respondentRelationshipController.text,
      matrixStatus: _matrixStatusController.text,
      addressProofDetails: _addressProofDetailsController.text,
      neighbourConfirmation: _neighbourConfirmationController.text,
      locationNature: _locationNatureController.text,
      landmark: _landmarkController.text,
      policeStation: _policeStationController.text,
      verificationComment: _verificationCommentController.text,
      signatureOfRespondent: _signatureOfRespondentController.text,
      signAuthorizedMatrixRepresentative:
          _signAuthorizedMatrixRepresentativeController.text,
      nameAuthorizedMatrixRepresentative:
          _nameAuthorizedMatrixRepresentativeController.text,
    );

    widget.onUpdate(updatedVerification);
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
            'Matrix Verification Form',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(),

          // Basic Information
          SectionCard(
            title: 'Basic Information',
            children: [
              CustomTextField(
                controller: _candidateNameController,
                label: 'Candidate Name',
                isRequired: true,
              ),
              const SizedBox(height: 16),

              CustomTextField(
                controller: _matrixRefNoController,
                label: 'Matrix Reference Number',
                isRequired: true,
              ),
              const SizedBox(height: 16),

              // Verification Date and Time
              InkWell(
                onTap: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: _verificationDateTime,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );

                  if (pickedDate != null) {
                    final TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime:
                          TimeOfDay.fromDateTime(_verificationDateTime),
                    );

                    if (pickedTime != null) {
                      setState(() {
                        _verificationDateTime = DateTime(
                          pickedDate.year,
                          pickedDate.month,
                          pickedDate.day,
                          pickedTime.hour,
                          pickedTime.minute,
                        );
                      });
                      _updateVerification();
                    }
                  }
                },
                child: InputDecorator(
                  decoration: const InputDecoration(
                    labelText: 'Verification Date & Time',
                    border: OutlineInputBorder(),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(DateFormat('yyyy-MM-dd HH:mm')
                          .format(_verificationDateTime)),
                      const Icon(Icons.calendar_today),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Address Information
          SectionCard(
            title: 'Address Information',
            children: [
              CustomTextField(
                controller: _addressProvidedController,
                label: 'Address Provided',
                isRequired: true,
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _addressConfirmedController,
                label: 'Address Confirmed',
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
              CustomTextField(
                controller: _policeStationController,
                label: 'Police Station',
                isRequired: true,
              ),
            ],
          ),

          // Respondent Information
          SectionCard(
            title: 'Respondent Information',
            children: [
              CustomTextField(
                controller: _respondentNameController,
                label: 'Respondent Name',
                isRequired: true,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _respondentRelationshipController,
                label: 'Respondent Relationship',
                isRequired: true,
              ),
              const SizedBox(height: 16),
              CustomDropdownField(
                label: 'Confirmation Mode',
                value: _confirmationModeController.text,
                items: _confirmationModeOptions,
                isRequired: true,
                onChanged: (value) {
                  setState(() {
                    _confirmationModeController.text = value ?? '';
                  });
                  _updateVerification();
                },
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _addressProofDetailsController,
                label: 'Address Proof Details',
                isRequired: true,
              ),
            ],
          ),

          // Verification Details
          SectionCard(
            title: 'Verification Details',
            children: [
              CustomDropdownField(
                label: 'Neighbour Confirmation',
                value: _neighbourConfirmationController.text,
                items: _neighbourConfirmationOptions,
                isRequired: true,
                onChanged: (value) {
                  setState(() {
                    _neighbourConfirmationController.text = value ?? '';
                  });
                  _updateVerification();
                },
              ),
              const SizedBox(height: 16),
              CustomDropdownField(
                label: 'Location Nature',
                value: _locationNatureController.text,
                items: _locationNatureOptions,
                isRequired: true,
                onChanged: (value) {
                  setState(() {
                    _locationNatureController.text = value ?? '';
                  });
                  _updateVerification();
                },
              ),
              const SizedBox(height: 16),
              CustomDropdownField(
                label: 'Matrix Status',
                value: _matrixStatusController.text,
                items: _matrixStatusOptions,
                isRequired: true,
                onChanged: (value) {
                  setState(() {
                    _matrixStatusController.text = value ?? '';
                  });
                  _updateVerification();
                },
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _verificationCommentController,
                label: 'Verification Comment',
                maxLines: 3,
              ),
            ],
          ),

          // Authorization Section
          SectionCard(
            title: 'Authorization',
            children: [
              CustomTextField(
                controller: _signatureOfRespondentController,
                label: 'Signature of Respondent (URL or Base64)',
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _signAuthorizedMatrixRepresentativeController,
                label:
                    'Signature of Authorized Matrix Representative (URL or Base64)',
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _nameAuthorizedMatrixRepresentativeController,
                label: 'Name of Authorized Matrix Representative',
                isRequired: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
