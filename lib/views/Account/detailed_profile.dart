import 'package:flutter/material.dart';

class DetailedProfileScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  // Controllers to hold the user input
  final TextEditingController emailController = TextEditingController(text: "yyiui");
  final TextEditingController idController = TextEditingController(text: "123456789");
  final TextEditingController birthDateController = TextEditingController(text: "Not updated");

  // ValueNotifiers for dropdowns and radio buttons
  final ValueNotifier<String> selectedCity = ValueNotifier<String>('Ho Chi Minh City');
  final ValueNotifier<String> selectedDistrict = ValueNotifier<String>('District 4');
  final ValueNotifier<String> selectedGender = ValueNotifier<String>('Male');

  DetailedProfileScreen({super.key}); // Default gender

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Save profile changes
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Profile Saved')));
              }
            },
            child: const Text('Save', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildHeader(),
              const Divider(),
              _buildEditableField('Email', emailController, 'Enter your email'),
              _buildEditableField('ID Number', idController, 'Enter your ID'),
              _buildEditableField('Date of Birth', birthDateController, 'Enter your birthdate'),
              _buildDropdownField('City', selectedCity, ['Ho Chi Minh City', 'Hanoi', 'Da Nang']),
              _buildDropdownField('District', selectedDistrict, ['District 1', 'District 4', 'District 7']),
              _buildGenderSelection(),
              const Divider(),
              _buildLinkedAccount('Facebook Account'),
              _buildLinkedAccount('Zalo Account'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: const Column(
        children: [
          CircleAvatar(
            radius: 40,
            child: Icon(Icons.person, size: 40),
          ),
          SizedBox(height: 10),
          Text('NGHINHTHU', style: TextStyle(fontSize: 22)),
          Text('Silver • 110 Points'),
        ],
      ),
    );
  }

  // Widget for Editable TextFormField
  Widget _buildEditableField(String label, TextEditingController controller, String hintText) {
    return ListTile(
      title: Text(label),
      subtitle: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your $label';
          }
          return null;
        },
      ),
    );
  }

  // Widget for Dropdown Field
  Widget _buildDropdownField(String label, ValueNotifier<String> selectedValue, List<String> items) {
    return ListTile(
      title: Text(label),
      subtitle: ValueListenableBuilder<String>(
        valueListenable: selectedValue,
        builder: (context, value, child) {
          return DropdownButtonFormField<String>(
            value: value,
            items: items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              if (newValue != null) {
                selectedValue.value = newValue;
              }
            },
          );
        },
      ),
    );
  }

  // Widget for Gender Radio Button Selection
  Widget _buildGenderSelection() {
    return ListTile(
      title: const Text('Gender'),
      subtitle: ValueListenableBuilder<String>(
        valueListenable: selectedGender,
        builder: (context, value, child) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Radio<String>(
                    value: 'Male',
                    groupValue: value,
                    onChanged: (String? selected) {
                      if (selected != null) {
                        selectedGender.value = selected;
                      }
                    },
                  ),
                  const Text('Male'),
                ],
              ),
              Row(
                children: [
                  Radio<String>(
                    value: 'Female',
                    groupValue: value,
                    onChanged: (String? selected) {
                      if (selected != null) {
                        selectedGender.value = selected;
                      }
                    },
                  ),
                  const Text('Female'),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  // Widget for linked accounts
  Widget _buildLinkedAccount(String platform) {
    return ListTile(
      title: Text(platform),
      trailing: ElevatedButton(
        onPressed: () {
          // Logic for linking accounts goes here
        },
        child: const Text('Link'),
      ),
    );
  }
}
