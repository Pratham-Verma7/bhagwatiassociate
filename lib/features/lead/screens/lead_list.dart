// screens/lead_list_screen.dart
import 'package:flutter/material.dart';

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

  // Sample data for the table
  final List<Map<String, dynamic>> _leads = [
    {
      'id': 1,
      'application_no': '123456',
      'name': ',m m,',
      'product': 'kjnj',
      'bank_name': 'bank',
      'address_type': 'mklmkl',
      'address': ',,m',
      'verification_type': 'office_verification',
      'assigned_to': 'yogesh parihar',
      'status': 'Assigned',
    },
  ];

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
                      const Text(
                        'Lead List',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Table controls
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Text('Show'),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey.shade300),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: DropdownButton<String>(
                                  value: _selectedRowsPerPage,
                                  underline: Container(),
                                  items: ['10', '25', '50', '100'].map((String value) {
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
                          SizedBox(
                            width: 250,
                            child: Row(
                              children: [
                                const Text('Search:'),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: TextField(
                                    controller: _searchController,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Data Table
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SingleChildScrollView(
                            child: DataTable(
                              headingRowColor: MaterialStateProperty.all(
                                Colors.indigo.shade600,
                              ),
                              columnSpacing: 20,
                              columns: [
                                _buildSortableColumn('#', Colors.white),
                                _buildSortableColumn('Application No', Colors.white),
                                _buildSortableColumn('Name', Colors.white),
                                _buildSortableColumn('Product', Colors.white),
                                _buildSortableColumn('Bank Name', Colors.white),
                                _buildSortableColumn('Address Type', Colors.white),
                                _buildSortableColumn('Address', Colors.white),
                                _buildSortableColumn('Verification Type', Colors.white),
                                _buildSortableColumn('Assigned To', Colors.white),
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
                                    DataCell(Text(lead['id'].toString())),
                                    DataCell(Text(lead['application_no'])),
                                    DataCell(Text(lead['name'])),
                                    DataCell(Text(lead['product'])),
                                    DataCell(Text(lead['bank_name'])),
                                    DataCell(Text(lead['address_type'])),
                                    DataCell(Text(lead['address'])),
                                    DataCell(Text(lead['verification_type'])),
                                    DataCell(Text(lead['assigned_to'])),
                                    DataCell(
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: Text(
                                          lead['status'],
                                          style: const TextStyle(color: Colors.white, fontSize: 12),
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.green,
                                          padding: const EdgeInsets.symmetric(horizontal: 16),
                                        ),
                                        onPressed: () {},
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

                      // Pagination
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Showing 1 to 1 of 1 entries'),
                            Row(
                              children: [
                                _buildPaginationButton('Previous', _currentPage > 1, () {
                                  if (_currentPage > 1) {
                                    setState(() {
                                      _currentPage--;
                                    });
                                  }
                                }),
                                _buildPageButton(1, _currentPage == 1),
                                _buildPaginationButton('Next', _currentPage < _totalPages, () {
                                  if (_currentPage < _totalPages) {
                                    setState(() {
                                      _currentPage++;
                                    });
                                  }
                                }),
                              ],
                            ),
                          ],
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

  DataColumn _buildSortableColumn(String label, Color textColor) {
    return DataColumn(
      label: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(width: 4),
          const Icon(Icons.swap_vert, color: Colors.white, size: 16),
        ],
      ),
      onSort: (columnIndex, ascending) {
        // Implement sorting logic here
      },
    );
  }

  Widget _buildPaginationButton(String text, bool isEnabled, VoidCallback onPressed) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.grey.shade200,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          disabledBackgroundColor: Colors.grey.shade100,
          disabledForegroundColor: Colors.grey.shade400,
        ),
        onPressed: isEnabled ? onPressed : null,
        child: Text(text),
      ),
    );
  }

  Widget _buildPageButton(int pageNumber, bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isActive ? Colors.indigo.shade600 : Colors.grey.shade200,
          foregroundColor: isActive ? Colors.white : Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        onPressed: () {
          setState(() {
            _currentPage = pageNumber;
          });
        },
        child: Text(pageNumber.toString()),
      ),
    );
  }
}