import 'package:flutter/material.dart';
import 'package:bhagwatiassociate/features/leads/presentation/widgets/verification_form_widgets.dart';

class CallingDetailsSection extends StatelessWidget {
  final TextEditingController dateOfCallingController;
  final TextEditingController timeOfCallingController;
  final TextEditingController contactNumberController;
  final TextEditingController nameOfApplicantController;
  final TextEditingController contactedController;
  final TextEditingController spokenToController;
  final Function() onChanged;

  // Optional fields based on verification type
  final TextEditingController? relationWithApplicantController;
  final TextEditingController? numberOfYearsController;
  final TextEditingController? ownershipController;
  final TextEditingController? alternateContactController;

  const CallingDetailsSection({
    Key? key,
    required this.dateOfCallingController,
    required this.timeOfCallingController,
    required this.contactNumberController,
    required this.nameOfApplicantController,
    required this.contactedController,
    required this.spokenToController,
    required this.onChanged,
    this.relationWithApplicantController,
    this.numberOfYearsController,
    this.ownershipController,
    this.alternateContactController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'Calling Details',
      children: [
        CustomTextField(
          controller: dateOfCallingController,
          label: 'Date of Calling',
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: timeOfCallingController,
          label: 'Time of Calling',
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: contactNumberController,
          label: 'Contact Number',
          keyboardType: TextInputType.phone,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: nameOfApplicantController,
          label: 'Name of Applicant',
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: contactedController,
          label: 'Contacted',
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: spokenToController,
          label: relationWithApplicantController != null
              ? 'Spoken To'
              : 'Spoken To Designation',
        ),
        const SizedBox(height: 16),
        if (relationWithApplicantController != null) ...[
          CustomTextField(
            controller: relationWithApplicantController!,
            label: 'Relation with Applicant',
          ),
          const SizedBox(height: 16),
        ],
        if (numberOfYearsController != null) ...[
          CustomTextField(
            controller: numberOfYearsController!,
            label: numberOfYearsController != null
                ? 'Number of Years Staying'
                : 'Applicant Working Since',
          ),
          const SizedBox(height: 16),
        ],
        if (ownershipController != null) ...[
          CustomTextField(
            controller: ownershipController!,
            label: ownershipController != null
                ? 'Ownership Status'
                : 'Applicant Designation',
          ),
          const SizedBox(height: 16),
        ],
        if (alternateContactController != null) ...[
          CustomTextField(
            controller: alternateContactController!,
            label: 'Alternate Contact Number',
            keyboardType: TextInputType.phone,
          ),
        ],
      ],
    );
  }
}

class VerifierDetailsSection extends StatelessWidget {
  final TextEditingController verifierNameController;
  final TextEditingController agencyManagerNameController;
  final TextEditingController agencyNameController;
  final Function() onChanged;

  const VerifierDetailsSection({
    Key? key,
    required this.verifierNameController,
    required this.agencyManagerNameController,
    required this.agencyNameController,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'Verifier Details',
      children: [
        CustomTextField(
          controller: verifierNameController,
          label: 'Verifier Name',
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: agencyManagerNameController,
          label: 'Agency Manager Name',
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: agencyNameController,
          label: 'Agency Name',
        ),
      ],
    );
  }
}

class LeadDetailsCard extends StatelessWidget {
  final String? name;
  final String? clientName;
  final String? product;
  final String? bankName;
  final String? addressType;
  final String? address;
  final String? applicationNo;
  final String? verificationType;
  final String? typeOfVisit;
  final String? contactNo;

  const LeadDetailsCard({
    Key? key,
    this.name,
    this.clientName,
    this.product,
    this.bankName,
    this.addressType,
    this.address,
    this.applicationNo,
    this.verificationType,
    this.typeOfVisit,
    this.contactNo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Lead Details (Non-editable)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            InfoRow(label: 'Name', value: name),
            InfoRow(label: 'Client Name', value: clientName),
            InfoRow(label: 'Product', value: product),
            InfoRow(label: 'Bank Name', value: bankName),
            InfoRow(label: 'Address Type', value: addressType),
            InfoRow(label: 'Address', value: address),
            InfoRow(label: 'Application No', value: applicationNo),
            InfoRow(label: 'Verification Type', value: verificationType),
            InfoRow(label: 'Type of Visit', value: typeOfVisit),
            InfoRow(label: 'Contact No', value: contactNo),
          ],
        ),
      ),
    );
  }
}
