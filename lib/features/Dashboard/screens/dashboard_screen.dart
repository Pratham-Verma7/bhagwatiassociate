// screens/dashboard_screen.dart
import 'package:bhagwatiassociate/features/Dashboard/screens/widgets/dashboard_card.dart';
import 'package:bhagwatiassociate/features/Dashboard/screens/widgets/sidebar.dart';
import 'package:bhagwatiassociate/features/leads/data/services/lead_service.dart';
import 'package:bhagwatiassociate/utils/exceptions/appexceptions.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:bhagwatiassociate/features/leads/screens/lead_list.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isLoading = true;
  String _errorMessage = '';
  int _leadCount = 0;
  final Storage = GetStorage();
  // Current user ID (this would typically come from auth state)
  // Replace with actual user ID from auth
  late String _currentUserId;

  @override
  void initState() {
    super.initState();

    final userDetails = Storage.read('userDetails');
    if (userDetails != null && userDetails is Map<String, dynamic>) {
      _currentUserId = userDetails['id'].toString(); // Ensure it's a String
      print("User ID: $_currentUserId");
    } else {
      _currentUserId = '';
      print("User details not found in storage.");
    }

    _fetchDashboardData();
  }

  Future<void> _fetchDashboardData() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      final leads = await LeadService.instance.getLeadsByUserId();
      setState(() {
        _leadCount = leads.length;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        if (e is AppException) {
          _errorMessage = e.message;
        } else {
          _errorMessage = 'Failed to load dashboard data. Please try again.';
          print('Dashboard error: $e'); // Log the actual error
        }
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : _errorMessage.isNotEmpty
                ? Center(
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
                          onPressed: _fetchDashboardData,
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header with refresh button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Dashboard Overview',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.refresh),
                              onPressed: _fetchDashboardData,
                              tooltip: 'Refresh data',
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // Summary cards
                        Wrap(
                          spacing: 16,
                          runSpacing: 16,
                          children: [
                            DashboardCard(
                              title: 'Assigned Leads',
                              count: _leadCount > 0
                                  ? _leadCount.toString()
                                  : 'No data',
                              color: const Color(0xFF1DC7A4),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const LeadListScreen(),
                                  ),
                                ).then((_) =>
                                    _fetchDashboardData()); // Refresh when returning
                              },
                            ),
                            DashboardCard(
                              title: 'Pending Leads',
                              count: '0',
                              color: const Color(0xFF3B82F6),
                              onTap: () {
                                // Navigate to pending leads when implemented
                              },
                            ),
                          ],
                        ),

                        const SizedBox(height: 24),

                        // Data status
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Data Status',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                _leadCount > 0
                                    ? Text(
                                        'Successfully loaded $_leadCount leads from the inspiration database.')
                                    : const Text(
                                        'No leads found. You can add new leads from the lead management screen.',
                                        style: TextStyle(color: Colors.orange),
                                      ),
                                const SizedBox(height: 8),
                                if (_leadCount == 0)
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const LeadListScreen(),
                                        ),
                                      );
                                    },
                                    child: const Text('Go to Lead Management'),
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
