import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:bhagwatiassociate/features/leads/data/models/matrix_verification_model.dart';
import 'package:bhagwatiassociate/features/leads/presentation/widgets/verification_form_widgets.dart';
import 'package:bhagwatiassociate/features/leads/presentation/widgets/verification_common_sections.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';

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
  late TextEditingController _nameAuthorizedMatrixRepresentativeController;

  // Local state for signature images
  File? _signatureOfRespondentImageFile;
  File? _signAuthorizedMatrixRepresentativeImageFile;

  // Dropdown options
  final List<String> _confirmationModeOptions = ['Written', 'Verbal'];
  final List<String> _neighbourConfirmationOptions = ['Yes', 'No', 'NA'];
  final List<String> _locationNatureOptions = [
    'Lower',
    'Middle',
    'Upper Class'
  ];
  final List<String> _matrixStatusOptions = ['Positive', 'Negative', 'On Hold'];
  final List<String> _addressProofOptions = [
    'Gas Bill',
    'Ration Card',
    'Voter ID',
    'Telephone Bill',
    'Water Bill',
    'Electricity Bill',
    'Driving License',
    'Passport',
    'Bank Passbook',
    'Aadhar Card',
    'Other'
  ];

  // Additional controller for "Other" address proof
  late TextEditingController _addressProofOtherController;

  @override
  void initState() {
    super.initState();
    _initControllers();
    // Initialize image files if verification model already has URLs
    if (widget.verification.signatureOfRespondent != null &&
        widget.verification.signatureOfRespondent!.isNotEmpty) {
      // We store URLs in the model, not local paths directly in the form state
      // The parent screen is responsible for loading/displaying uploaded images.
      // This form state will only hold *newly selected* images before submission.
    }
    if (widget.verification.signAuthorizedMatrixRepresentative != null &&
        widget.verification.signAuthorizedMatrixRepresentative!.isNotEmpty) {
      // Same as above for authorized representative signature
    }
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
    _nameAuthorizedMatrixRepresentativeController = TextEditingController(
        text: widget.verification.nameAuthorizedMatrixRepresentative ?? '');
    _matrixStatusController =
        TextEditingController(text: widget.verification.matrixStatus ?? '');

    // Initialize the "Other" address proof controller
    _addressProofOtherController = TextEditingController(text: '');

    // If the stored address proof isn't in the dropdown options, it's probably an "Other" value
    if (_addressProofDetailsController.text.isNotEmpty &&
        !_addressProofOptions.contains(_addressProofDetailsController.text) &&
        _addressProofDetailsController.text != 'Other') {
      _addressProofOtherController.text = _addressProofDetailsController.text;
      _addressProofDetailsController.text = 'Other';
    }
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
    _nameAuthorizedMatrixRepresentativeController.dispose();
    _matrixStatusController.dispose();
    _addressProofOtherController.dispose();
    super.dispose();
  }

  void _updateVerification() {
    // Determine actual address proof value
    String addressProofValue = _addressProofDetailsController.text;
    if (addressProofValue == 'Other' &&
        _addressProofOtherController.text.isNotEmpty) {
      addressProofValue = _addressProofOtherController.text;
    }

    // Create updated model, storing local file paths for signatures if new images selected
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
      addressProofDetails: addressProofValue,
      neighbourConfirmation: _neighbourConfirmationController.text,
      locationNature: _locationNatureController.text,
      landmark: _landmarkController.text,
      policeStation: _policeStationController.text,
      verificationComment: _verificationCommentController.text,
      signatureOfRespondent: _signatureOfRespondentImageFile?.path ??
          widget.verification.signatureOfRespondent,
      signAuthorizedMatrixRepresentative:
          _signAuthorizedMatrixRepresentativeImageFile?.path ??
              widget.verification.signAuthorizedMatrixRepresentative,
      nameAuthorizedMatrixRepresentative:
          _nameAuthorizedMatrixRepresentativeController.text,
    );

    widget.onUpdate(updatedVerification);
  }

  Future<void> _pickImage(Function(File?) onImagePicked) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final File imageFile = File(image.path);
      onImagePicked(imageFile);
      _updateVerification(); // Trigger form update with the new file path
    }
  }

  Widget _buildImagePickerField(
      {required String label,
      File? imageFile,
      String? imageUrl,
      required void Function(File?) onImagePicked}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Row(
          children: [
            ElevatedButton.icon(
              onPressed: () => _pickImage(onImagePicked),
              icon: const Icon(Icons.add_photo_alternate),
              label: const Text('Select Image'),
            ),
            const SizedBox(width: 8),
            // Display selected local image or uploaded network image
            if (imageFile != null) // Display newly selected local image
              Image.file(
                imageFile,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.error_outline, color: Colors.red),
              )
            else if (imageUrl != null &&
                imageUrl.isNotEmpty) // Display already uploaded network image
              CachedNetworkImage(
                imageUrl: imageUrl,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error_outline, color: Colors.red),
              ),
            // Option to clear selected image
            if (imageFile != null) // Only for newly selected local image
              IconButton(
                icon: const Icon(Icons.remove_circle, color: Colors.red),
                onPressed: () =>
                    onImagePicked(null), // Clear the selected image
              ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: SingleChildScrollView(
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
                CustomDropdownField(
                  label: 'Address Proof',
                  value: _addressProofDetailsController.text,
                  items: _addressProofOptions,
                  isRequired: true,
                  onChanged: (value) {
                    setState(() {
                      _addressProofDetailsController.text = value ?? '';
                    });
                    _updateVerification();
                  },
                ),
                const SizedBox(height: 16),
                if (_addressProofDetailsController.text == 'Other') ...[
                  CustomTextField(
                    controller: _addressProofOtherController,
                    label: 'Other Address Proof Details',
                    isRequired: true,
                  ),
                  const SizedBox(height: 16),
                ],
              ],
            ),

            // Verification Details
            SectionCard(
              title: 'Verification Details',
              children: [
                CustomDropdownField(
                  label:
                      'If Residence is locked, confirmed with neighbours? (Yes/No/NA)',
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

            // Signature Section
            SectionCard(
              title: 'Signatures',
              children: [
                _buildImagePickerField(
                  label: 'Signature of Respondent',
                  imageFile: _signatureOfRespondentImageFile,
                  imageUrl: widget.verification.signatureOfRespondent,
                  onImagePicked: (file) {
                    setState(() {
                      _signatureOfRespondentImageFile = file;
                    });
                    _updateVerification();
                  },
                ),
                const SizedBox(height: 16),
                _buildImagePickerField(
                  label: 'Signature of Authorized Matrix Representative',
                  imageFile: _signAuthorizedMatrixRepresentativeImageFile,
                  imageUrl:
                      widget.verification.signAuthorizedMatrixRepresentative,
                  onImagePicked: (file) {
                    setState(() {
                      _signAuthorizedMatrixRepresentativeImageFile = file;
                    });
                    _updateVerification();
                  },
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
      ),
    );
  }
}
