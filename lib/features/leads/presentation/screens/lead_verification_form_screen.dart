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

  List<String> _uploadedImagePaths = [];

  @override
  void initState() {
    super.initState();
    _loadVerificationData();
    _loadImages();
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
          verificationData = _matrixVerification!.toJson();
        } else if (_isEmployeeAddressVerification &&
            _employeeAddressVerification != null) {
          tableName = 'lead_employee_address_verification';
          verificationData = _employeeAddressVerification!.toJson();
        } else if (_isInsuranceFormVerification &&
            _insuranceFormVerification != null) {
          tableName = 'lead_insurance';
          verificationData = _insuranceFormVerification!.toJson();
        }

        if (tableName != null && verificationData != null) {
          // Check internet connectivity
          final connectivityResult = await Connectivity().checkConnectivity();
          isOnline = connectivityResult != ConnectivityResult.none;

          if (isOnline) {
            // Online submission
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
            }
          } else {
            // Offline submission
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
          }
        }

        if (success) {
          Get.snackbar(
            'Success',
            isOnline
                ? 'Verification data submitted successfully'
                : 'Verification data saved offline',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
          Navigator.pop(context);
        } else {
          Get.snackbar(
            'Error',
            'Failed to submit verification data',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      } catch (e) {
        Get.snackbar(
          'Error',
          'Error: $e',
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
      final imageService = ImageService.instance;
      final images = await imageService.getLeadImages(widget.lead.id!);
      setState(() {
        _uploadedImagePaths = images;
      });
    }
  }

  void _handleImagesUploaded(List<String> paths) {
    setState(() {
      _uploadedImagePaths.addAll(paths);
    });
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

                  // Image Upload Section
                  if (widget.lead.id != null)
                    SectionCard(
                      title: 'Images',
                      children: [
                        ImageUploadWidget(
                          leadId: widget.lead.id!,
                          title: 'Upload Verification Images',
                          onImagesUploaded: _handleImagesUploaded,
                        ),
                        if (_uploadedImagePaths.isNotEmpty) ...[
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
                              itemCount: _uploadedImagePaths.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: Image.network(
                                    'https://bhagwatiassociate.in/${_uploadedImagePaths[index]}',
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ),
                                );
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
              _isInsuranceFormVerification)
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
