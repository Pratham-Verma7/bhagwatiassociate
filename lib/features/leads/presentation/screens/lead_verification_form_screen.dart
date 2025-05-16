import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bhagwatiassociate/features/leads/data/models/lead_model.dart';
import 'package:bhagwatiassociate/features/leads/data/models/residence_verification_model.dart';
import 'package:bhagwatiassociate/features/leads/data/models/office_verification_model.dart';
import 'package:bhagwatiassociate/features/leads/data/models/matrix_verification_model.dart';
import 'package:bhagwatiassociate/features/leads/data/models/employee_address_verification_model.dart';
import 'package:bhagwatiassociate/features/leads/data/services/residence_verification_service.dart';
import 'package:bhagwatiassociate/features/leads/data/services/office_verification_service.dart';
import 'package:bhagwatiassociate/features/leads/data/services/matrix_verification_service.dart';
import 'package:bhagwatiassociate/features/leads/data/services/employee_address_verification_service.dart';
import 'package:bhagwatiassociate/features/leads/presentation/widgets/residence_verification_form.dart';
import 'package:bhagwatiassociate/features/leads/presentation/widgets/office_verification_form.dart';
import 'package:bhagwatiassociate/features/leads/presentation/widgets/matrix_verification_form.dart';
import 'package:bhagwatiassociate/features/leads/presentation/widgets/employee_address_verification_form.dart';
import 'package:bhagwatiassociate/features/leads/presentation/widgets/verification_common_sections.dart';
import 'package:bhagwatiassociate/features/leads/presentation/widgets/verification_form_widgets.dart';

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

  // Verification models
  ResidenceVerificationModel? _residenceVerification;
  OfficeVerificationModel? _officeVerification;
  MatrixVerificationModel? _matrixVerification;
  EmployeeAddressVerificationModel? _employeeAddressVerification;

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

  @override
  void initState() {
    super.initState();
    _loadVerificationData();
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

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        bool success = false;

        if (_isResidenceVerification && _residenceVerification != null) {
          success = await _residenceVerificationService
              .submitVerification(_residenceVerification!);
        } else if (_isOfficeVerification && _officeVerification != null) {
          success = await _officeVerificationService
              .submitVerification(_officeVerification!);
        } else if (_isMatrixVerification && _matrixVerification != null) {
          success = await _matrixVerificationService
              .submitVerification(_matrixVerification!);
        } else if (_isEmployeeAddressVerification &&
            _employeeAddressVerification != null) {
          success = await _employeeAddressVerificationService
              .submitVerification(_employeeAddressVerification!);
        }

        if (success) {
          Get.snackbar(
            'Success',
            'Verification data submitted successfully',
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
                  else
                    Center(
                      child: Text(
                        'Unsupported verification type: ${widget.lead.verificationType}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                ],
              ),
            ),
      bottomNavigationBar: (_isResidenceVerification ||
              _isOfficeVerification ||
              _isMatrixVerification ||
              _isEmployeeAddressVerification)
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
