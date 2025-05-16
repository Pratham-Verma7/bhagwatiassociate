import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bhagwatiassociate/features/leads/data/models/lead_model.dart';
import 'package:bhagwatiassociate/features/leads/presentation/screens/lead_verification_form_screen.dart';

class LeadActionButton extends StatelessWidget {
  final LeadModel lead;

  const LeadActionButton({Key? key, required this.lead}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(Icons.edit_document),
      label: Text('Fill Form'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      onPressed: () {
        // Navigate to the verification form screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LeadVerificationFormScreen(lead: lead),
          ),
        );
      },
    );
  }
}

// Extension function to easily add this to any widget
extension LeadDetailExtension on Widget {
  Widget addVerificationButton(BuildContext context, LeadModel lead) {
    return Column(
      children: [
        this,
        SizedBox(height: 16),
        if (lead.verificationType == 'residence_verification')
          LeadActionButton(lead: lead),
      ],
    );
  }
}
