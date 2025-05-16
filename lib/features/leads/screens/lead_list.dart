import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bhagwatiassociate/features/leads/data/models/lead_model.dart';
import 'package:bhagwatiassociate/features/leads/data/services/lead_service.dart';
import 'package:bhagwatiassociate/utils/loaders/loaders.dart';
import 'package:bhagwatiassociate/utils/exceptions/appexceptions.dart';
import 'package:bhagwatiassociate/utils/http/http_client.dart';
import 'package:bhagwatiassociate/features/leads/screens/lead_detail_screen.dart';
import 'package:bhagwatiassociate/features/leads/presentation/screens/lead_verification_form_screen.dart';

import '../../Dashboard/screens/widgets/sidebar.dart';

class LeadListScreen extends StatefulWidget {
  const LeadListScreen({Key? key}) : super(key: key);

  @override
  State<LeadListScreen> createState() => _LeadListScreenState();
}

class _LeadListScreenState extends State<LeadListScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _selectedRowsPerPage = '100';
  final TextEditingController _searchController = TextEditingController();
  int _currentPage = 1;
  final int _totalPages = 1;
  bool _isLoading = true;

  // Lead data
  List<LeadModel> _leads = [];
  String _errorMessage = '';

  final LeadService _leadService = LeadService.instance;

  @override
  void initState() {
    super.initState();
    _loadLeads();
  }

  Future<void> _loadLeads() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final leads = await _leadService.getLeadsByUserId();
      setState(() {
        _leads = leads;
        _isLoading = false;
      });
    } catch (e) {
      print('Error loading leads: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const Sidebar(),
      backgroundColor: Color(0xFFF7FAFC),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: const Text(
          'Dashboard',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.purple,
                  radius: 16,
                  child: const Text(
                    'YP',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Icon(Icons.keyboard_arrow_down, color: Colors.black),
              ],
            ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title and refresh button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Lead List',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.refresh),
                            tooltip: 'Refresh leads',
                            onPressed: _loadLeads,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Table controls
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Entries dropdown in a separate row to prevent overflow
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text('Show'),
                                const SizedBox(width: 8),
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey.shade300),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: DropdownButton<String>(
                                    isDense: true,
                                    value: _selectedRowsPerPage,
                                    underline: Container(),
                                    menuMaxHeight: 200,
                                    items: ['10', '25', '50', '100']
                                        .map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (newValue) {
                                      setState(() {
                                        _selectedRowsPerPage = newValue!;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Text('entries'),
                              ],
                            ),
                            const SizedBox(height: 12),
                            // Search in a separate row
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: TextField(
                                controller: _searchController,
                                decoration: const InputDecoration(
                                  hintText: 'Search...',
                                  prefixIcon: Icon(Icons.search),
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Loading indicator or error message
                      if (_isLoading)
                        const Expanded(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      else if (_errorMessage.isNotEmpty)
                        Expanded(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  _errorMessage,
                                  style: const TextStyle(color: Colors.red),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 16),
                                ElevatedButton(
                                  onPressed: _loadLeads,
                                  child: const Text('Retry'),
                                ),
                              ],
                            ),
                          ),
                        )
                      else if (_leads.isEmpty)
                        Expanded(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.info_outline,
                                  color: Colors.blue,
                                  size: 48,
                                ),
                                const SizedBox(height: 16),
                                const Text(
                                  'No lead records found',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'There are no leads available in the system.',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                const SizedBox(height: 24),
                                ElevatedButton.icon(
                                  icon: const Icon(Icons.refresh),
                                  label: const Text('Refresh'),
                                  onPressed: _loadLeads,
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 24, vertical: 12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      else
                        // Data Table
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: SingleChildScrollView(
                              child: DataTable(
                                headingRowColor: MaterialStateProperty.all(
                                  Colors.indigo.shade600,
                                ),
                                columnSpacing: 16,
                                horizontalMargin: 10,
                                columns: [
                                  _buildSortableColumn('#', Colors.white,
                                      width: 40),
                                  _buildSortableColumn(
                                      'Application No', Colors.white),
                                  _buildSortableColumn('Name', Colors.white),
                                  _buildSortableColumn('Product', Colors.white),
                                  _buildSortableColumn(
                                      'Bank Name', Colors.white),
                                  _buildSortableColumn(
                                      'Address Type', Colors.white),
                                  _buildSortableColumn('Address', Colors.white),
                                  _buildSortableColumn(
                                      'Verification Type', Colors.white),
                                  _buildSortableColumn(
                                      'Assigned To', Colors.white),
                                  _buildSortableColumn('Status', Colors.white),
                                  const DataColumn(
                                    label: Text(
                                      'Action',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                                rows: _leads.map((lead) {
                                  return DataRow(
                                    cells: [
                                      DataCell(Text(lead.id.toString())),
                                      DataCell(_buildLimitedText(
                                          lead.applicationNo ?? 'N/A', 120)),
                                      DataCell(_buildLimitedText(
                                          lead.name ?? 'N/A', 120)),
                                      DataCell(_buildLimitedText(
                                          lead.product ?? 'N/A', 100)),
                                      DataCell(_buildLimitedText(
                                          lead.bankName ?? 'N/A', 100)),
                                      DataCell(_buildLimitedText(
                                          lead.addressType ?? 'N/A', 100)),
                                      DataCell(_buildLimitedText(
                                          lead.address ?? 'N/A', 150)),
                                      DataCell(_buildLimitedText(
                                          lead.verificationType ?? 'N/A', 120)),
                                      DataCell(_buildLimitedText(
                                          lead.assignedTo?.toString() ?? 'N/A',
                                          120)),
                                      DataCell(
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 4),
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          child: Text(
                                            lead.status?.toString() ??
                                                'Unknown',
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.green,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16),
                                          ),
                                          onPressed: () {
                                            _viewLeadDetails(lead.id);
                                          },
                                          child: const Text('Fill'),
                                        ),
                                      ),
                                    ],
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _viewLeadDetails(int? id) {
    if (id == null) {
      print('Cannot view lead details: ID is null');
      return;
    }

    // First find the lead in our list to check its verificationType
    final lead = _leads.firstWhere(
      (lead) => lead.id == id,
      orElse: () => LeadModel.empty(),
    );

    // If this is a residence/office/matrix/employee_address verification lead, open the verification form directly
    if (lead.verificationType == 'residence_verification' ||
        lead.verificationType == 'office_verification' ||
        lead.verificationType == 'matrix_verification' ||
        lead.verificationType == 'matrix' ||
        lead.verificationType == 'employee_address_verification') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LeadVerificationFormScreen(lead: lead),
        ),
      ).then((_) {
        // Refresh the list when coming back from the form
        _loadLeads();
      });
    } else {
      // For other types, navigate to the regular lead details screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LeadDetailScreen(leadId: id),
        ),
      ).then((_) {
        // Refresh the list when coming back from the detail screen
        _loadLeads();
      });
    }
  }

  DataColumn _buildSortableColumn(String label, Color textColor,
      {double? width}) {
    return DataColumn(
      label: Container(
        width: width,
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
      numeric: false,
      tooltip: label,
    );
  }

  Text _buildLimitedText(String text, int maxLength) {
    if (text.length > maxLength) {
      return Text(
        '${text.substring(0, maxLength)}...',
        overflow: TextOverflow.ellipsis,
      );
    } else {
      return Text(text);
    }
  }
}
