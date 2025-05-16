import 'package:flutter/material.dart';
import 'package:bhagwatiassociate/features/leads/data/models/lead_model.dart';
import 'package:bhagwatiassociate/features/leads/data/services/lead_service.dart';
import 'package:bhagwatiassociate/coman/widgets/appbar/appbar.dart';

class LeadDetailScreen extends StatefulWidget {
  final int leadId;

  const LeadDetailScreen({Key? key, required this.leadId}) : super(key: key);

  @override
  State<LeadDetailScreen> createState() => _LeadDetailScreenState();
}

class _LeadDetailScreenState extends State<LeadDetailScreen> {
  final LeadService _leadService = LeadService.instance;
  bool _isLoading = true;
  String _errorMessage = '';
  LeadModel? _lead;

  @override
  void initState() {
    super.initState();
    _fetchLead();
  }

  Future<void> _fetchLead() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      final leads = await _leadService.getLeadsByUserId();
      final lead = leads.firstWhere(
        (l) => l.id == widget.leadId,
        orElse: () => LeadModel.empty(),
      );

      setState(() {
        _lead = lead;
        _isLoading = false;
        if (lead.id == null) {
          _errorMessage = 'No lead found with ID: ${widget.leadId}';
        }
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Error loading lead: $e';
      });
    }
  }

  String _getStatusText(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
      case '1':
        return 'Pending';
      case 'in_progress':
      case '2':
        return 'In Progress';
      case 'completed':
      case '3':
        return 'Completed';
      case 'rejected':
      case '4':
        return 'Rejected';
      default:
        return 'Unknown';
    }
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
      case '1':
        return Colors.orange;
      case 'in_progress':
      case '2':
        return Colors.blue;
      case 'completed':
      case '3':
        return Colors.green;
      case 'rejected':
      case '4':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SAppBar(
        title: Text('Lead #${widget.leadId}'),
        showBackArrow: true,
        centertitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _fetchLead,
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_errorMessage.isNotEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 16),
              Text(
                _errorMessage,
                style: const TextStyle(color: Colors.red),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _fetchLead,
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    if (_lead == null || _lead?.id == null) {
      return const Center(child: Text('No lead data available'));
    }

    // Display lead details
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Lead ID and basic info
              _buildLeadHeader(),
              const Divider(height: 32),

              // Lead details
              _buildDetailSection('Basic Information', [
                _buildDetailRow('Name', _lead?.name ?? 'N/A'),
                _buildDetailRow('Bank Name', _lead?.bankName ?? 'N/A'),
                _buildDetailRow('Product', _lead?.product ?? 'N/A'),
                _buildDetailRow(
                    'Application No', _lead?.applicationNo ?? 'N/A'),
              ]),
              const SizedBox(height: 24),

              // Address details
              _buildDetailSection('Address Details', [
                _buildDetailRow('Address Type', _lead?.addressType ?? 'N/A'),
                _buildDetailRow('Address', _lead?.address ?? 'N/A'),
                _buildDetailRow(
                    'Verification Type', _lead?.verificationType ?? 'N/A'),
              ]),
              const SizedBox(height: 24),

              // Assignment details
              _buildDetailSection('Assignment Details', [
                _buildDetailRow('Assigned To',
                    _lead?.assignedTo?.toString() ?? 'Not assigned'),
                _buildDetailRow('Assigned By',
                    _lead?.assignedBy?.toString() ?? 'Not specified'),
                _buildDetailRow(
                    'Status', _getStatusText(_lead?.status?.toString() ?? '')),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLeadHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: Colors.blue,
          radius: 24,
          child: Text(
            _lead?.name?.isNotEmpty == true
                ? _lead!.name![0].toUpperCase()
                : '#',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _lead?.name ?? 'Unnamed Lead',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'ID: ${_lead?.id}',
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 8),
              _buildStatusChip(_lead?.status?.toString() ?? ''),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetailSection(String title, List<Widget> details) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        ...details,
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChip(String status) {
    return Chip(
      label: Text(
        _getStatusText(status),
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: _getStatusColor(status),
    );
  }
}
