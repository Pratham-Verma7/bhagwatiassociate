import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bhagwatiassociate/features/leads/data/models/lead_model.dart';
import 'package:bhagwatiassociate/features/leads/data/services/lead_service.dart';
import 'package:bhagwatiassociate/utils/loaders/loaders.dart';
import 'package:bhagwatiassociate/utils/exceptions/appexceptions.dart';
import 'package:bhagwatiassociate/utils/http/http_client.dart';
import 'package:bhagwatiassociate/features/leads/presentation/screens/lead_verification_form_screen.dart';
import 'package:bhagwatiassociate/common/widgets/custom_app_bar.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../Dashboard/screens/widgets/sidebar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:async';

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
  late final GetStorage storage;
  late final Map<String, dynamic>? userDetails;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  // Lead data
  List<LeadModel> _leads = [];
  String _errorMessage = '';

  final LeadService _leadService = LeadService.instance;

  @override
  void initState() {
    super.initState();
    storage = GetStorage();
    userDetails = storage.read<Map<String, dynamic>>('userDetails');
    _loadLeads();
    _connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result != ConnectivityResult.none) {
        // Internet connection is back, reload leads
        print('Connectivity changed: Online. Reloading leads...');
        _loadLeads();
      }
    });
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel(); // Cancel the subscription in dispose
    // Dispose controllers for common sections
    _searchController.dispose(); // Dispose the search controller
    super.dispose();
  }

  Future<void> _loadLeads() async {
    setState(() {
      _isLoading = true;
      _errorMessage = ''; // Clear previous errors
    });

    try {
      final connectivityResult = await Connectivity().checkConnectivity();
      final isOnline = connectivityResult != ConnectivityResult.none;

      if (!isOnline) {
        // Offline: Try to load from local storage
        print('Offline mode: Attempting to load leads from storage...');
        final storedLeads = _leadService.getStoredLeadsData();
        if (storedLeads != null && storedLeads.isNotEmpty) {
          print(
              'Offline mode: Loaded ${storedLeads.length} leads from storage.');
          setState(() {
            _leads = storedLeads;
          });
        } else {
          print('Offline mode: No leads found in storage.');
          setState(() {
            _errorMessage =
                'You are offline and no leads were found in your local storage.';
          });
        }
      } else {
        // Online: Fetch from API
        print('Online mode: Fetching leads from API...');
        final fetchedLeads = await _leadService.getLeadsByUserId();
        print('Online mode: Fetched ${fetchedLeads.length} leads from API.');
        if (fetchedLeads.isNotEmpty) {
          setState(() {
            _leads = fetchedLeads;
          });
          // Store fetched leads locally for offline access
          await _leadService.storeLeadsData(fetchedLeads);
          print('Online mode: Stored ${fetchedLeads.length} leads locally.');
        } else {
          setState(() {
            _errorMessage = 'No leads found.';
          });
        }
      }
    } catch (e) {
      print('Error loading leads: $e');
      setState(() {
        _errorMessage = 'Failed to load leads: ${e.toString()}';
      });
    } finally {
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
      appBar: CustomAppBar(
        title: 'Lead List',
        scaffoldKey: _scaffoldKey,
        onSearchChanged: (value) {
          // TODO: Implement search functionality
        },
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
                                          userDetails?['name'] ?? 'User', 120)),
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
                                            lead.status?.toString() ?? 'N/A',
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

    // If this is a residence/office/matrix/employee_address/insurance_form verification lead, open the verification form directly
    if (lead.verificationType == 'residence_verification' ||
        lead.verificationType == 'office_verification' ||
        lead.verificationType == 'matrix_verification' ||
        lead.verificationType == 'matrix' ||
        lead.verificationType == 'employee_address_verification' ||
        lead.verificationType == 'insurance_form') {
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
        _loadLeads();

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
