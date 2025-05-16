import 'package:flutter/material.dart';
import 'package:bhagwatiassociate/coman/widgets/appbar/appbar.dart';
import 'package:bhagwatiassociate/features/leads/screens/lead_detail_screen.dart';
import 'package:bhagwatiassociate/features/leads/data/services/lead_service.dart';
import 'package:bhagwatiassociate/features/leads/data/models/lead_model.dart';

class LeadLookupScreen extends StatefulWidget {
  const LeadLookupScreen({Key? key}) : super(key: key);

  @override
  State<LeadLookupScreen> createState() => _LeadLookupScreenState();
}

class _LeadLookupScreenState extends State<LeadLookupScreen> {
  final TextEditingController _leadIdController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final LeadService _leadService = LeadService.instance;
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void dispose() {
    _leadIdController.dispose();
    super.dispose();
  }

  Future<void> _lookupLead() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });

      try {
        final leadId = int.parse(_leadIdController.text.trim());
        final leads = await _leadService.getLeadsByUserId();
        final lead = leads.firstWhere(
          (l) => l.id == leadId,
          orElse: () => LeadModel.empty(),
        );

        if (lead.id == null) {
          setState(() {
            _errorMessage = 'No lead found with ID: $leadId';
            _isLoading = false;
          });
          return;
        }

        if (!mounted) return;

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LeadDetailScreen(leadId: leadId),
          ),
        );
      } catch (e) {
        setState(() {
          _errorMessage = 'Error looking up lead: $e';
        });
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SAppBar(
        title: Text('Lead Lookup'),
        showBackArrow: true,
        centertitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Enter Lead ID',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _leadIdController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Lead ID',
                  hintText: 'Enter the numeric lead ID',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a lead ID';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid numeric ID';
                  }
                  return null;
                },
              ),
              if (_errorMessage != null) ...[
                const SizedBox(height: 8),
                Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              ],
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _isLoading ? null : _lookupLead,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: _isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      )
                    : const Text('View Lead Details'),
              ),
              const SizedBox(height: 32),
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Instructions',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '1. Enter the numeric lead ID in the field above',
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        '2. Press the "View Lead Details" button to fetch the lead',
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        '3. The lead details will be displayed if found',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
