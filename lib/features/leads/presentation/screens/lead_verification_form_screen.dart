import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bhagwatiassociate/features/leads/data/models/lead_model.dart';
import 'package:bhagwatiassociate/features/leads/data/models/residence_verification_model.dart';
import 'package:bhagwatiassociate/features/leads/data/models/office_verification_model.dart';
import 'package:bhagwatiassociate/features/leads/data/models/matrix_verification_model.dart';
import 'package:bhagwatiassociate/features/leads/data/models/employee_address_verification_model.dart';
import 'package:bhagwatiassociate/features/leads/data/models/insurance_form_verification_model.dart';
import 'package:bhagwatiassociate/features/leads/data/services/residence_verification_service.dart';
import 'package:bhagwatiassociate/features/leads/data/services/office_verification_service.dart';
import 'package:bhagwatiassociate/features/leads/data/services/matrix_verification_service.dart';
import 'package:bhagwatiassociate/features/leads/data/services/employee_address_verification_service.dart';
import 'package:bhagwatiassociate/features/leads/data/services/insurance_form_verification_service.dart';
import 'package:bhagwatiassociate/features/leads/presentation/widgets/residence_verification_form.dart';
import 'package:bhagwatiassociate/features/leads/presentation/widgets/office_verification_form.dart';
import 'package:bhagwatiassociate/features/leads/presentation/widgets/matrix_verification_form.dart';
import 'package:bhagwatiassociate/features/leads/presentation/widgets/employee_address_verification_form.dart';
import 'package:bhagwatiassociate/features/leads/presentation/widgets/insurance_form_verification_form.dart';
import 'package:bhagwatiassociate/features/leads/presentation/widgets/verification_common_sections.dart';
import 'package:bhagwatiassociate/features/leads/presentation/widgets/verification_form_widgets.dart';
import 'package:bhagwatiassociate/utils/http/http_client.dart';
import 'package:bhagwatiassociate/features/leads/presentation/widgets/image_upload_widget.dart';
import 'package:bhagwatiassociate/features/leads/data/services/image_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:bhagwatiassociate/utils/services/offline_sync_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:path/path.dart' as path_lib;
import 'package:bhagwatiassociate/utils/database/database_helper.dart';

class LeadVerificationFormScreen extends StatefulWidget {
  final LeadModel lead;

  const LeadVerificationFormScreen({Key? key, required this.lead})
      : super(key: key);

  @override
  State<LeadVerificationFormScreen> createState() =>
      _LeadVerificationFormScreenState();
}

class _LeadVerificationFormScreenState
    extends State<LeadVerificationFormScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = true;

  // Service instances
  final _residenceVerificationService = ResidenceVerificationService.instance;
  final _officeVerificationService = OfficeVerificationService.instance;
  final _matrixVerificationService = MatrixVerificationService.instance;
  final _employeeAddressVerificationService =
      EmployeeAddressVerificationService.instance;
  final _insuranceFormVerificationService =
      InsuranceFormVerificationService.instance;
  final _imageService = ImageService.instance;
  final _dbHelper = DatabaseHelper.instance;

  // Verification models
  ResidenceVerificationModel? _residenceVerification;
  OfficeVerificationModel? _officeVerification;
  MatrixVerificationModel? _matrixVerification;
  EmployeeAddressVerificationModel? _employeeAddressVerification;
  InsuranceFormVerificationModel? _insuranceFormVerification;

  // Determine which form to show based on verification type
  bool get _isResidenceVerification =>
      widget.lead.verificationType == 'residence_verification';
  bool get _isOfficeVerification =>
      widget.lead.verificationType == 'office_verification';
  bool get _isMatrixVerification =>
      widget.lead.verificationType == 'matrix_verification' ||
      widget.lead.verificationType == 'matrix';
  bool get _isEmployeeAddressVerification =>
      widget.lead.verificationType == 'employee_address_verification';
  bool get _isInsuranceFormVerification =>
      widget.lead.verificationType == 'insurance_form';

  // Form controllers for calling and verifier sections
  final _dateOfCallingController = TextEditingController();
  final _timeOfCallingController = TextEditingController();
  final _contactNumberController = TextEditingController();
  final _nameOfApplicantController = TextEditingController();
  final _contactedController = TextEditingController();
  final _spokenToController = TextEditingController();
  final _relationWithApplicantController = TextEditingController();
  final _numberOfYearStayingController = TextEditingController();
  final _ownershipOfStayingController = TextEditingController();
  final _alternateContactNoController = TextEditingController();
  final _verifierNameController = TextEditingController();
  final _agencyManagerNameController = TextEditingController();
  final _agencyNameController = TextEditingController();

  // Lists for selected and uploaded images
  final List<File> _imagesToUpload = [];
  List<String> _uploadedImageUrls = [];

  @override
  void initState() {
    super.initState();
    _loadVerificationData();
    _loadImages(); // Load already uploaded images
  }

  @override
  void dispose() {
    // Dispose controllers for common sections
    _dateOfCallingController.dispose();
    _timeOfCallingController.dispose();
    _contactNumberController.dispose();
    _nameOfApplicantController.dispose();
    _contactedController.dispose();
    _spokenToController.dispose();
    _relationWithApplicantController.dispose();
    _numberOfYearStayingController.dispose();
    _ownershipOfStayingController.dispose();
    _alternateContactNoController.dispose();
    _verifierNameController.dispose();
    _agencyManagerNameController.dispose();
    _agencyNameController.dispose();

    super.dispose();
  }

  Future<void> _loadVerificationData() async {
    try {
      if (widget.lead.id == null) {
        throw Exception('Lead ID is null');
      }

      if (_isResidenceVerification) {
        await _loadResidenceVerificationData(widget.lead.id!);
      } else if (_isOfficeVerification) {
        await _loadOfficeVerificationData(widget.lead.id!);
      } else if (_isMatrixVerification) {
        await _loadMatrixVerificationData(widget.lead.id!);
      } else if (_isEmployeeAddressVerification) {
        await _loadEmployeeAddressVerificationData(widget.lead.id!);
      } else if (_isInsuranceFormVerification) {
        await _loadInsuranceFormVerificationData(widget.lead.id!);
      } else {
        throw Exception(
            'Unsupported verification type: ${widget.lead.verificationType}');
      }
    } catch (e) {
      print('Error loading verification data: $e');
      // Create empty verification objects in case of error
      _createEmptyVerifications();
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _loadResidenceVerificationData(int leadId) async {
    try {
      final verification =
          await _residenceVerificationService.getVerificationByLeadId(leadId);

      if (verification != null) {
        // Existing verification data found
        setState(() {
          _residenceVerification = verification;
        });
      } else {
        // No existing data, create new verification
        setState(() {
          _residenceVerification = ResidenceVerificationModel.empty();
          _residenceVerification =
              _residenceVerification!.copyWith(leadId: leadId);
        });
      }
    } catch (e) {
      print('Error loading residence verification data: $e');
      // Create a new empty verification
      setState(() {
        _residenceVerification = ResidenceVerificationModel.empty();
        _residenceVerification =
            _residenceVerification!.copyWith(leadId: leadId);
      });
    }
  }

  Future<void> _loadOfficeVerificationData(int leadId) async {
    try {
      final verification =
          await _officeVerificationService.getVerificationByLeadId(leadId);

      if (verification != null) {
        // Existing verification data found
        setState(() {
          _officeVerification = verification;
        });
      } else {
        // No existing data, create new verification
        setState(() {
          _officeVerification = OfficeVerificationModel.empty();
          _officeVerification = _officeVerification!.copyWith(leadId: leadId);
        });
      }
    } catch (e) {
      print('Error loading office verification data: $e');
      // Create a new empty verification
      setState(() {
        _officeVerification = OfficeVerificationModel.empty();
        _officeVerification = _officeVerification!.copyWith(leadId: leadId);
      });
    }
  }

  Future<void> _loadMatrixVerificationData(int leadId) async {
    try {
      final verification =
          await _matrixVerificationService.getVerificationByLeadId(leadId);

      if (verification != null) {
        // Existing verification data found
        setState(() {
          _matrixVerification = verification;
        });
      } else {
        // No existing data, create new verification
        setState(() {
          _matrixVerification = MatrixVerificationModel.empty();
          _matrixVerification = _matrixVerification!.copyWith(leadId: leadId);
        });
      }
    } catch (e) {
      print('Error loading matrix verification data: $e');
      // Create a new empty verification
      setState(() {
        _matrixVerification = MatrixVerificationModel.empty();
        _matrixVerification = _matrixVerification!.copyWith(leadId: leadId);
      });
    }
  }

  Future<void> _loadEmployeeAddressVerificationData(int leadId) async {
    try {
      final verification = await _employeeAddressVerificationService
          .getVerificationByLeadId(leadId);

      if (verification != null) {
        // Existing verification data found
        setState(() {
          _employeeAddressVerification = verification;
        });
      } else {
        // No existing data, create new verification
        setState(() {
          _employeeAddressVerification =
              EmployeeAddressVerificationModel.empty();
          _employeeAddressVerification =
              _employeeAddressVerification!.copyWith(leadId: leadId);
        });
      }
    } catch (e) {
      print('Error loading employee address verification data: $e');
      // Create a new empty verification
      setState(() {
        _employeeAddressVerification = EmployeeAddressVerificationModel.empty();
        _employeeAddressVerification =
            _employeeAddressVerification!.copyWith(leadId: leadId);
      });
    }
  }

  Future<void> _loadInsuranceFormVerificationData(int leadId) async {
    try {
      final verification = await _insuranceFormVerificationService
          .getVerificationByLeadId(leadId);

      if (verification != null) {
        // Existing verification data found
        setState(() {
          _insuranceFormVerification = verification;
        });
      } else {
        // No existing data, create new verification
        setState(() {
          _insuranceFormVerification = InsuranceFormVerificationModel.empty();
          _insuranceFormVerification =
              _insuranceFormVerification!.copyWith(leadId: leadId);
        });
      }
    } catch (e) {
      print('Error loading insurance form verification data: $e');
      // Create a new empty verification
      setState(() {
        _insuranceFormVerification = InsuranceFormVerificationModel.empty();
        _insuranceFormVerification =
            _insuranceFormVerification!.copyWith(leadId: leadId);
      });
    }
  }

  void _createEmptyVerifications() {
    // Create empty models for verification types
    if (_isResidenceVerification) {
      setState(() {
        _residenceVerification = ResidenceVerificationModel.empty();
        _residenceVerification =
            _residenceVerification!.copyWith(leadId: widget.lead.id);
      });
    } else if (_isOfficeVerification) {
      setState(() {
        _officeVerification = OfficeVerificationModel.empty();
        _officeVerification =
            _officeVerification!.copyWith(leadId: widget.lead.id);
      });
    } else if (_isMatrixVerification) {
      setState(() {
        _matrixVerification = MatrixVerificationModel.empty();
        _matrixVerification =
            _matrixVerification!.copyWith(leadId: widget.lead.id);
      });
    } else if (_isEmployeeAddressVerification) {
      setState(() {
        _employeeAddressVerification = EmployeeAddressVerificationModel.empty();
        _employeeAddressVerification =
            _employeeAddressVerification!.copyWith(leadId: widget.lead.id);
      });
    } else if (_isInsuranceFormVerification) {
      setState(() {
        _insuranceFormVerification = InsuranceFormVerificationModel.empty();
        _insuranceFormVerification =
            _insuranceFormVerification!.copyWith(leadId: widget.lead.id);
      });
    }
  }

  void _updateResidenceVerification(ResidenceVerificationModel verification) {
    setState(() {
      _residenceVerification = verification;
    });
  }

  void _updateOfficeVerification(OfficeVerificationModel verification) {
    setState(() {
      _officeVerification = verification;
    });
  }

  void _updateMatrixVerification(MatrixVerificationModel verification) {
    setState(() {
      _matrixVerification = verification;
    });
  }

  void _updateEmployeeAddressVerification(
      EmployeeAddressVerificationModel verification) {
    setState(() {
      _employeeAddressVerification = verification;
    });
  }

  void _updateInsuranceFormVerification(
      InsuranceFormVerificationModel verification) {
    setState(() {
      _insuranceFormVerification = verification;
    });
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        bool success = false;
        String? tableName;
        dynamic verificationData;
        bool isOnline = true;

        if (_isResidenceVerification && _residenceVerification != null) {
          tableName = 'residence_lead_verifications';
          verificationData = _residenceVerification!.toJson();
        } else if (_isOfficeVerification && _officeVerification != null) {
          tableName = 'office_lead_verifications';
          verificationData = _officeVerification!.toJson();
        } else if (_isMatrixVerification && _matrixVerification != null) {
          tableName = 'lead_matrix';
          // Handle signature image uploads for Matrix Verification
          if (isOnline) {
            String? respondentSignatureUrl =
                _matrixVerification!.signatureOfRespondent;
            String? authorizedSignatureUrl =
                _matrixVerification!.signAuthorizedMatrixRepresentative;

            // Check if signatures are local file paths (not URLs)
            if (respondentSignatureUrl != null &&
                !respondentSignatureUrl.startsWith('http')) {
              try {
                final uploadedUrl = await _imageService
                    .uploadSingleImageForSync(File(respondentSignatureUrl));
                respondentSignatureUrl = uploadedUrl;
              } catch (e) {
                print('Error uploading respondent signature: $e');
                Get.snackbar(
                  'Error',
                  'Failed to upload respondent signature',
                  snackPosition: SnackPosition.BOTTOM,
                );
                return;
              }
            }

            if (authorizedSignatureUrl != null &&
                !authorizedSignatureUrl.startsWith('http')) {
              try {
                final uploadedUrl = await _imageService
                    .uploadSingleImageForSync(File(authorizedSignatureUrl));
                authorizedSignatureUrl = uploadedUrl;
              } catch (e) {
                print('Error uploading authorized signature: $e');
                Get.snackbar(
                  'Error',
                  'Failed to upload authorized signature',
                  snackPosition: SnackPosition.BOTTOM,
                );
                return;
              }
            }

            // Update verification model with uploaded URLs
            _matrixVerification = _matrixVerification!.copyWith(
              signatureOfRespondent: respondentSignatureUrl,
              signAuthorizedMatrixRepresentative: authorizedSignatureUrl,
            );
          }
          verificationData = _matrixVerification!.toJson();
        } else if (_isEmployeeAddressVerification &&
            _employeeAddressVerification != null) {
          tableName = 'lead_employee_address_verification';
          // Handle signature image upload for Employee Address Verification
          if (isOnline) {
            String? signatureUrl = _employeeAddressVerification!.signatureEav;

            // Check if signature is a local file path (not URL)
            if (signatureUrl != null && !signatureUrl.startsWith('http')) {
              try {
                final uploadedUrl = await _imageService
                    .uploadSingleImageForSync(File(signatureUrl));
                signatureUrl = uploadedUrl;
              } catch (e) {
                print('Error uploading employee address signature: $e');
                Get.snackbar(
                  'Error',
                  'Failed to upload employee address signature',
                  snackPosition: SnackPosition.BOTTOM,
                );
                return;
              }
            }

            // Update verification model with uploaded URL
            _employeeAddressVerification =
                _employeeAddressVerification!.copyWith(
              signatureEav: signatureUrl,
            );
          }
          verificationData = _employeeAddressVerification!.toJson();
        } else if (_isInsuranceFormVerification &&
            _insuranceFormVerification != null) {
          tableName = 'lead_insurance';
          // Handle insured photo upload for Insurance Form Verification
          if (isOnline) {
            String? insuredPhotoUrl =
                _insuranceFormVerification!.insuredPhotoTakenIf;

            // Check if photo is a local file path (not URL)
            if (insuredPhotoUrl != null &&
                !insuredPhotoUrl.startsWith('http')) {
              try {
                final uploadedUrl = await _imageService
                    .uploadSingleImageForSync(File(insuredPhotoUrl));
                insuredPhotoUrl = uploadedUrl;
              } catch (e) {
                print('Error uploading insured photo: $e');
                Get.snackbar(
                  'Error',
                  'Failed to upload insured photo',
                  snackPosition: SnackPosition.BOTTOM,
                );
                return;
              }
            }

            // Update verification model with uploaded URL
            _insuranceFormVerification = _insuranceFormVerification!.copyWith(
              insuredPhotoTakenIf: insuredPhotoUrl,
            );
          }
          verificationData = _insuranceFormVerification!.toJson();
        }

        // Check internet connectivity
        final connectivityResult = await Connectivity().checkConnectivity();
        isOnline = connectivityResult != ConnectivityResult.none;

        if (isOnline) {
          bool imageUploadSuccess = false;
          // --- Image Upload and Saving (Online) ---
          if (_imagesToUpload.isNotEmpty && widget.lead.id != null) {
            try {
              final uploadedImageUrls = await _imageService.uploadImages(
                widget.lead.id!,
                _imagesToUpload,
              );

              for (final imageUrl in uploadedImageUrls) {
                // Extract the path from the full URL
                final uri = Uri.parse(imageUrl);
                final imagePath =
                    'api_files/${uri.pathSegments.last}'; // e.g., api_files/image_name.jpg

                // Save image path to the 'images' table
                await SHttpHelper.post('api/add/images', {
                  'lead_id': widget.lead.id,
                  'path': imagePath,
                  'created_at': DateTime.now().toIso8601String(),
                  'updated_at': DateTime.now().toIso8601String(),
                });
              }
              // Clear images to upload after successful upload and saving
              setState(() {
                _imagesToUpload.clear();
              });
              imageUploadSuccess = true;
              _loadImages(); // Refresh the list of uploaded images
            } catch (e) {
              print('Error uploading or saving images: $e');
              imageUploadSuccess = false;
              Get.snackbar(
                'Image Upload Error',
                'Failed to upload or save some images: $e',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.red,
                colorText: Colors.white,
              );
            }
          }
          // --- End Image Upload and Saving (Online) ---

          if (tableName != null && verificationData != null) {
            // Online submission of verification data
            final addResponse =
                await SHttpHelper.post('api/add/$tableName', verificationData);
            if (addResponse != null &&
                (addResponse['success'] == true || addResponse['id'] != null)) {
              // Update lead status to 2 using PUT method
              final leadId = widget.lead.id;
              if (leadId != null) {
                await SHttpHelper.put(
                    'api/update/leads/$leadId', {'status': 2});
              }
              success = true;
            } else {
              success = false; // Main form submission failed
            }
          } else {
            // Handle case where no verification data is available to submit
            if (_imagesToUpload.isEmpty && _uploadedImageUrls.isEmpty) {
              Get.snackbar(
                'No Data',
                'No verification data or images to submit.',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.orange,
                colorText: Colors.white,
              );
              success = false; // No data to submit
            } else {
              // Images were handled, but no main verification data. Consider this a success if images uploaded.
              success = imageUploadSuccess;
            }
          }
        } else {
          // Offline mode
          // --- Offline Saving (Form Data) ---
          if (tableName != null && verificationData != null) {
            await OfflineSyncService.instance.saveOfflineLead(
              leadId: widget.lead.id,
              verificationType: widget.lead.verificationType ?? '',
              formData: verificationData,
            );
            success = true;
            Get.snackbar(
              'Offline Mode',
              'Lead saved offline. Will be submitted when internet connection is available.',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.orange,
              colorText: Colors.white,
            );
          } else {
            success = false; // Cannot save main form data offline if empty
          }

          // --- Offline Saving (Images) ---
          if (_imagesToUpload.isNotEmpty && widget.lead.id != null) {
            for (final imageFile in _imagesToUpload) {
              try {
                await _dbHelper.insertOfflineImage({
                  'lead_id': widget.lead.id,
                  'local_path': imageFile.path,
                });
              } catch (e) {
                print('Error saving image offline: $e');
                Get.snackbar(
                  'Offline Image Save Error',
                  'Failed to save some images offline: $e',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                );
              }
            }
            setState(() {
              _imagesToUpload.clear(); // Clear images after saving them offline
            });
            // Even if form data wasn't saved, if images were saved offline, consider it a partial success for user feedback
            if (!success) success = _imagesToUpload.isNotEmpty;
          }

          // Show a message if neither form data nor images were saved offline
          if (!success) {
            Get.snackbar(
              'No Data Saved',
              'No verification data or images were saved offline.',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.orange,
              colorText: Colors.white,
            );
          }
        }

        // Final success/error messages based on overall outcome
        if (isOnline && success) {
          Get.snackbar(
            'Success',
            'Verification data and images submitted successfully',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
          Navigator.pop(context);
        } else if (!isOnline && success) {
          // Success message for offline save (either form data or images)
          // The specific offline save success snackbar is shown within the offline blocks above.
          // We can add a general one here if needed, but it might be redundant.
          // Navigator.pop(context); // Decide if you want to pop on successful offline save
        } else if (isOnline &&
            !success &&
            (tableName != null || _imagesToUpload.isNotEmpty)) {
          // Show a general failure message for online mode if submission was attempted
          Get.snackbar(
            'Error',
            'Failed to submit verification data or images online.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        } else if (!isOnline &&
            !success &&
            (tableName != null || _imagesToUpload.isNotEmpty)) {
          // Show a message if offline save failed but data was present
          // Already handled by the specific offline save error snackbars above.
        }
      } catch (e) {
        // Catch any unexpected errors during the submission process
        Get.snackbar(
          'Error',
          'An unexpected error occurred: $e',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _loadImages() async {
    if (widget.lead.id != null) {
      try {
        final imageService = ImageService.instance;
        // Assuming the backend endpoint for fetching images is now correct and returns full URLs
        final images = await imageService.getLeadImages(widget.lead.id!);
        setState(() {
          _uploadedImageUrls = images;
        });
      } catch (e) {
        print('Error loading uploaded images: $e');
        // Handle error loading images, maybe show a message or empty the list
        setState(() {
          _uploadedImageUrls = [];
        });
      }
    }
  }

  // Widget to build uploaded image display
  Widget _buildUploadedImageDisplay(String imageUrl) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: imageUrl,
            height: 100,
            width: 100,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              height: 100,
              width: 100,
              color: Colors.grey[200],
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            errorWidget: (context, url, error) => Container(
              height: 100,
              width: 100,
              color: Colors.grey[200],
              child: const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 30,
              ),
            ),
          ),
          // Option to remove already uploaded images? Requires backend delete endpoint
          // Positioned(
          //   right: 0,
          //   top: 0,
          //   child: IconButton(
          //     icon: const Icon(
          //       Icons.remove_circle,
          //       color: Colors.red,
          //     ),
          //     onPressed: () => _removeUploadedImage(index), // Need to implement remove logic
          //   ),
          // ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verification Form'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Lead details card
                  LeadDetailsCard(
                    name: widget.lead.name,
                    clientName: widget.lead.clientName,
                    product: widget.lead.product,
                    bankName: widget.lead.bankName,
                    addressType: widget.lead.addressType,
                    address: widget.lead.address,
                    applicationNo: widget.lead.applicationNo,
                    verificationType: widget.lead.verificationType,
                    typeOfVisit: widget.lead.typeOfVisit,
                    contactNo: widget.lead.contactNo,
                  ),

                  const SizedBox(height: 16),

                  // Appropriate verification form based on type
                  if (_isResidenceVerification &&
                      _residenceVerification != null)
                    ResidenceVerificationForm(
                      verification: _residenceVerification!,
                      onUpdate: _updateResidenceVerification,
                      formKey: _formKey,
                    )
                  else if (_isOfficeVerification && _officeVerification != null)
                    OfficeVerificationForm(
                      verification: _officeVerification!,
                      onUpdate: _updateOfficeVerification,
                      formKey: _formKey,
                    )
                  else if (_isMatrixVerification && _matrixVerification != null)
                    MatrixVerificationForm(
                      verification: _matrixVerification!,
                      onUpdate: _updateMatrixVerification,
                      formKey: _formKey,
                    )
                  else if (_isEmployeeAddressVerification &&
                      _employeeAddressVerification != null)
                    EmployeeAddressVerificationForm(
                      verification: _employeeAddressVerification!,
                      onUpdate: _updateEmployeeAddressVerification,
                      formKey: _formKey,
                    )
                  else if (_isInsuranceFormVerification &&
                      _insuranceFormVerification != null)
                    InsuranceFormVerificationForm(
                      verification: _insuranceFormVerification!,
                      onUpdate: _updateInsuranceFormVerification,
                      formKey: _formKey,
                    )
                  else
                    Center(
                      child: Text(
                        'Unsupported verification type: ${widget.lead.verificationType}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  const SizedBox(height: 16),

                  // Image Upload Section (for selecting new images)
                  if (widget.lead.id != null)
                    SectionCard(
                      title: 'Images',
                      children: [
                        ImageUploadWidget(
                          leadId: widget.lead.id!,
                          title: 'Select Images to Upload',
                          selectedImages:
                              _imagesToUpload, // Pass the list to the widget
                        ),
                        // Display already uploaded images here
                        if (_uploadedImageUrls.isNotEmpty) ...[
                          const SizedBox(height: 16),
                          const Text(
                            'Uploaded Images:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            height: 100,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _uploadedImageUrls.length,
                              itemBuilder: (context, index) {
                                return _buildUploadedImageDisplay(
                                    _uploadedImageUrls[index]);
                              },
                            ),
                          ),
                        ],
                      ],
                    ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
      bottomNavigationBar: (_isResidenceVerification ||
              _isOfficeVerification ||
              _isMatrixVerification ||
              _isEmployeeAddressVerification ||
              _isInsuranceFormVerification || // Check if any form is displayed
              _imagesToUpload
                  .isNotEmpty || // Also show submit if there are images to upload
              _uploadedImageUrls
                  .isNotEmpty) // Also show submit if there are already uploaded images to view
          ? Container(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: _isLoading ? null : _submitForm,
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Submit Verification'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
              ),
            )
          : null,
    );
  }
}
