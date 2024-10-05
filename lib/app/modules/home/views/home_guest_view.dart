import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeGuestView extends StatefulWidget {
  @override
  _HomeGuestViewState createState() => _HomeGuestViewState();
}

class _HomeGuestViewState extends State<HomeGuestView> {
  int _selectedIndex = 0; // Track selected tab index

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Guest"),
        backgroundColor: Colors.green, // Header color
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () {
              // Show custom design for Agenda (Prompt guest to login)
              _showCartOrAgendaPrompt();
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Show custom design for Cart (Prompt guest to login)
              _showCartOrAgendaPrompt();
            },
          ),
        ],
      ),
      body: _getSelectedContent(), // Get content based on tab
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white, // Bottom navigation bar color
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
                color: _selectedIndex == 0 ? Colors.green : Colors.black),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history,
                color: _selectedIndex == 1 ? Colors.green : Colors.black),
            label: "Riwayat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications,
                color: _selectedIndex == 2 ? Colors.green : Colors.black),
            label: "Notifikasi",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services,
                color: _selectedIndex == 3 ? Colors.green : Colors.black),
            label: "Resep",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,
                color: _selectedIndex == 4 ? Colors.green : Colors.black),
            label: "Profil",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped, // Handle tab change
        selectedItemColor: Colors.green, // Selected tab color
        unselectedItemColor: Colors.black, // Unselected tab color
      ),
    );
  }

  // Method to build content based on the selected tab
  Widget _getSelectedContent() {
    switch (_selectedIndex) {
      case 0:
        return _buildHomeContent(); // Home content
      case 4:
        return _buildProfilePrompt(); // Show profile prompt for guest
      default:
        return _buildMustLoginContent(); // For other tabs show login prompt
    }
  }

  // Build Home Tab Content
  Widget _buildHomeContent() {
    return Container(
      color: Colors.green.withOpacity(0.2), // Main content background color
      padding: EdgeInsets.all(16.0),
      child: ListView(
        children: [
          _productCard(
            imageUrl: 'assets/paracetamol.png',
            title: 'Paracetamol',
            type: 'Tablet',
            price: 'Rp20.000',
          ),
          SizedBox(height: 10),
          _productCard(
            imageUrl: 'assets/bodrex.png',
            title: 'Bodrex',
            type: 'Tablet',
            price: 'Rp10.000',
          ),
          SizedBox(height: 10),
          _productCard(
            imageUrl: 'assets/cerini.png',
            title: 'Cerini',
            type: 'Sirup',
            price: 'Rp30.000',
          ),
        ],
      ),
    );
  }

  // Profile Prompt for Guest Users (Using built-in Icon instead of image)
  Widget _buildProfilePrompt() {
    return Container(
      color: Colors.green.withOpacity(0.2), // Main content background color
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Built-in Icon for Profile Prompt
            Icon(
              Icons.person, // Person icon
              size: 100, // Set icon size to 100
              color: Colors.black, // Icon color
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/login'); // Navigate to login screen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Button color
              ),
              child: Text(
                'Login', // Login button
                style: TextStyle(
                    color: Colors.white, // Change text color to white
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // General Login Prompt for Restricted Tabs (Riwayat, Notifikasi, Resep)
  Widget _buildMustLoginContent() {
    return Container(
      color: Colors.green
          .withOpacity(0.2), // Matching main content background color
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lock, // Lock icon for login prompt
              size: 100, // Set icon size to 100
              color: Colors.black, // Icon color
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/login'); // Navigate to login screen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Button color
              ),
              child: Text(
                'Silakan Login', // Prompt user to login
                style: TextStyle(
                    color: Colors.white, // Change text color to white
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Cart and Agenda Prompt for Guest Users
  void _showCartOrAgendaPrompt() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image for Cart or Agenda Prompt (replace with your asset)
                Icon(
                  Icons.lock, // Using shopping cart icon for the prompt
                  size: 100, // Set icon size to 100
                  color: Colors.black, // Icon color
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/login'); // Navigate to login screen
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Button color
                  ),
                  child: Text(
                    'Silakan Login', // Login button
                    style: TextStyle(
                        color: Colors.white, // Change text color to white
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Product Card Method (used in Home Tab)
  Widget _productCard({
    required String imageUrl,
    required String title,
    required String type,
    required String price,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(imageUrl, width: 60, height: 60),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(type),
                  Text(price, style: TextStyle(color: Colors.green)),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/login'); // Redirect guest to login to purchase
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: Text(
                'Silakan Login', // Prompt user to login before purchase
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
