import 'package:flutter/material.dart';
import '../models/user_data.dart';
import 'registration_page1.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserData? _userData;

  Future<void> _navigateToRegistration() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const RegistrationPage1(),
      ),
    );

    // Update state if data was returned
    if (result != null && result is UserData) {
      setState(() {
        _userData = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              // Welcome Section
              const Icon(
                Icons.app_registration,
                size: 80,
                color: Colors.blue,
              ),
              const SizedBox(height: 24),
              const Text(
                'Registration Form App',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'Complete your registration by filling out a simple two-page form. Your information will be securely stored and displayed below.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              
              // Get Started Button
              ElevatedButton(
                onPressed: _navigateToRegistration,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              
              const SizedBox(height: 40),
              
              // Display submitted data if available
              if (_userData != null) ...[
                const Divider(thickness: 2),
                const SizedBox(height: 24),
                const Text(
                  'Registration Details',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                _buildDataCard(),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDataCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDataRow(Icons.person, 'Full Name', _userData!.fullName),
            const Divider(height: 24),
            _buildDataRow(Icons.email, 'Email', _userData!.email),
            const Divider(height: 24),
            _buildDataRow(Icons.phone, 'Phone Number', _userData!.phoneNumber),
            const Divider(height: 24),
            _buildDataRow(Icons.cake, 'Age', '${_userData!.age} years old'),
            const Divider(height: 24),
            _buildDataRow(Icons.wc, 'Gender', _userData!.gender),
            const Divider(height: 24),
            _buildDataRow(Icons.location_on, 'Country', _userData!.country),
            if (_userData!.bio != null && _userData!.bio!.isNotEmpty) ...[
              const Divider(height: 24),
              _buildDataRow(Icons.info, 'Bio', _userData!.bio!),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildDataRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.blue, size: 24),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}