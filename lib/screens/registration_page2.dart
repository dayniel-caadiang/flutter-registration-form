import 'package:flutter/material.dart';
import '../models/user_data.dart';

class RegistrationPage2 extends StatefulWidget {
  final String fullName;
  final String email;
  final String phoneNumber;
  final String password;

  const RegistrationPage2({
    super.key,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });

  @override
  State<RegistrationPage2> createState() => _RegistrationPage2State();
}

class _RegistrationPage2State extends State<RegistrationPage2> {
  final _formKey = GlobalKey<FormState>();
  final _ageController = TextEditingController();
  final _countryController = TextEditingController();
  final _bioController = TextEditingController();

  String _selectedGender = 'Male';

  @override
  void dispose() {
    _ageController.dispose();
    _countryController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  void _submitRegistration() {
    if (_formKey.currentState!.validate()) {
      final userData = UserData(
        fullName: widget.fullName,
        email: widget.email,
        phoneNumber: widget.phoneNumber,
        password: widget.password,
        age: int.parse(_ageController.text),
        gender: _selectedGender,
        country: _countryController.text,
        bio: _bioController.text.isEmpty ? null : _bioController.text,
      );

      // Return data to previous screen
      Navigator.pop(context, userData);
    }
  }

  String? _validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your age';
    }
    final age = int.tryParse(value);
    if (age == null) {
      return 'Please enter a valid number';
    }
    if (age < 18) {
      return 'You must be at least 18 years old';
    }
    if (age > 120) {
      return 'Please enter a valid age';
    }
    return null;
  }

  String? _validateCountry(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your country';
    }
    if (value.length < 2) {
      return 'Please enter a valid country name';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration - Step 2 of 2'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Additional Information',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Just a few more details to complete your profile',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 32),

                // Age Field
                TextFormField(
                  controller: _ageController,
                  decoration: const InputDecoration(
                    labelText: 'Age',
                    hintText: 'Enter your age',
                    prefixIcon: Icon(Icons.cake),
                  ),
                  validator: _validateAge,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 24),

                // Gender Selection
                const Text(
                  'Gender',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      RadioListTile<String>(
                        title: const Text('Male'),
                        value: 'Male',
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value!;
                          });
                        },
                      ),
                      RadioListTile<String>(
                        title: const Text('Female'),
                        value: 'Female',
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value!;
                          });
                        },
                      ),
                      RadioListTile<String>(
                        title: const Text('Other'),
                        value: 'Other',
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Country Field
                TextFormField(
                  controller: _countryController,
                  decoration: const InputDecoration(
                    labelText: 'Country',
                    hintText: 'Enter your country',
                    prefixIcon: Icon(Icons.location_on),
                  ),
                  validator: _validateCountry,
                  textCapitalization: TextCapitalization.words,
                ),
                const SizedBox(height: 16),

                // Bio Field (Optional)
                TextFormField(
                  controller: _bioController,
                  decoration: const InputDecoration(
                    labelText: 'Bio (Optional)',
                    hintText: 'Tell us about yourself',
                    prefixIcon: Icon(Icons.info),
                    alignLabelWithHint: true,
                  ),
                  maxLines: 4,
                  textCapitalization: TextCapitalization.sentences,
                ),
                const SizedBox(height: 32),

                // Submit Button
                ElevatedButton(
                  onPressed: _submitRegistration,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 16),

                // Back Button
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Back',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}