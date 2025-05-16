import 'package:flutter/material.dart';
import 'package:bhagwatiassociate/coman/widgets/appbar/appbar.dart';
import 'package:bhagwatiassociate/features/leads/screens/lead_detail_screen.dart';
import 'package:bhagwatiassociate/features/leads/data/services/lead_service.dart';
import 'package:bhagwatiassociate/features/leads/data/models/lead_model.dart';

class SearchLeadScreen extends StatefulWidget {
  const SearchLeadScreen({Key? key}) : super(key: key);

  @override
  State<SearchLeadScreen> createState() => _SearchLeadScreenState();
}

class _SearchLeadScreenState extends State<SearchLeadScreen> {
  final TextEditingController _searchController = TextEditingController();
  final LeadService _leadService = LeadService.instance;
  List<LeadModel> _searchResults = [];
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _searchLeads() async {
    final query = _searchController.text.trim();
    if (query.isEmpty) {
      setState(() {
        _errorMessage = 'Please enter a search term';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final leads = await _leadService.getLeadsByUserId();
      final results = leads.where((lead) {
        final name = lead.name?.toLowerCase() ?? '';
        final clientName = lead.clientName?.toLowerCase() ?? '';
        final applicationNo = lead.applicationNo?.toLowerCase() ?? '';
        final searchTerm = query.toLowerCase();

        return name.contains(searchTerm) ||
            clientName.contains(searchTerm) ||
            applicationNo.contains(searchTerm);
      }).toList();

      setState(() {
        _searchResults = results;
        if (results.isEmpty) {
          _errorMessage = 'No leads found matching "$query"';
        }
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Error searching leads: $e';
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _viewLeadDetails(LeadModel lead) {
    if (lead.id == null) {
      setState(() {
        _errorMessage = 'Invalid lead ID';
      });
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LeadDetailScreen(leadId: lead.id!),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SAppBar(
        title: Text('Search Leads'),
        showBackArrow: true,
        centertitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                hintText: 'Search by name, client, or application number',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    setState(() {
                      _searchResults = [];
                      _errorMessage = null;
                    });
                  },
                ),
                border: const OutlineInputBorder(),
              ),
              onSubmitted: (_) => _searchLeads(),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _isLoading ? null : _searchLeads,
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
                  : const Text('Search'),
            ),
            if (_errorMessage != null) ...[
              const SizedBox(height: 8),
              Text(
                _errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            ],
            const SizedBox(height: 16),
            Expanded(
              child: _searchResults.isEmpty
                  ? const Center(
                      child: Text(
                        'No results to display',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _searchResults.length,
                      itemBuilder: (context, index) {
                        final lead = _searchResults[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: ListTile(
                            title: Text(lead.name ?? 'Unnamed Lead'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (lead.clientName != null)
                                  Text('Client: ${lead.clientName}'),
                                if (lead.applicationNo != null)
                                  Text('Application: ${lead.applicationNo}'),
                              ],
                            ),
                            trailing: const Icon(Icons.chevron_right),
                            onTap: () => _viewLeadDetails(lead),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
