import 'package:basic_loyalty/views/Account/detailed_profile.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Navigate to detailed profile screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailedProfileScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            const Divider(),
            _buildMenuItem(Icons.history, 'Transaction History'),
            _buildMenuItem(Icons.card_giftcard, 'Reward History'),
            _buildMenuItem(Icons.help_outline, 'FAQ'),
            const Divider(),
            ListTile(
              title: const Text('Change Language'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('English'),
                  Switch(value: false, onChanged: (bool value) {}),
                ],
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text('Logout'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Delete Account', style: TextStyle(color: Colors.red)),
              onTap: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Mall'),
          BottomNavigationBarItem(icon: Icon(Icons.directions_car), label: 'Book a Ride'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Profile'),
        ],
        currentIndex: 2,
        onTap: (index) {},
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 40,
            child: Icon(Icons.person, size: 40),
          ),
          const SizedBox(height: 10),
          const Text('NGHINHTHU', style: TextStyle(fontSize: 22)),
          const Text('Silver • 110 Points'),
          const SizedBox(height: 20),
          const Text('036053AR'),
          const SizedBox(height: 20),
          Image.asset('assets/barcode.png', height: 40), // Replace with barcode image
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey),
      title: Text(title),
      onTap: () {},
    );
  }
}
