import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:table_calendar/table_calendar.dart';

class HomeLoggedInView extends StatefulWidget {
  @override
  _HomeLoggedInViewState createState() => _HomeLoggedInViewState();
}

class _HomeLoggedInViewState extends State<HomeLoggedInView> {
  int _selectedIndex = 0; // Track selected tab index
  File? _profileImage; // To store the profile image
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _nameController =
      TextEditingController(text: "User");
  final TextEditingController _emailController =
      TextEditingController(text: "user@gmail.com");
  final TextEditingController _phoneController =
      TextEditingController(text: "081234567890");
  final TextEditingController _genderController =
      TextEditingController(text: "Laki-laki");

  // Method to pick image from camera or gallery
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  // Method to remove the profile image
  void _removeImage() {
    setState(() {
      _profileImage = null;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hi, User"),
        backgroundColor: Colors.green, // Header color
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () {
              // Navigate to agenda page
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => _buildAgendaContent()));
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to cart page
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => _buildCartContent()));
            },
          ),
        ],
      ),
      body: _getSelectedContent(),
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
        onTap: _onItemTapped,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
      ),
    );
  }

  Widget _getSelectedContent() {
    switch (_selectedIndex) {
      case 0:
        return _buildHomeContent();
      case 1:
        return _buildRiwayatContent();
      case 2:
        return _buildNotifikasiContent();
      case 3:
        return _buildResepContent();
      case 4:
        return _buildProfilContent();
      default:
        return _buildHomeContent();
    }
  }

  // Home Tab Content
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
            stock: 20,
          ),
          SizedBox(height: 10),
          _productCard(
            imageUrl: 'assets/bodrex.png',
            title: 'Bodrex',
            type: 'Tablet',
            price: 'Rp10.000',
            stock: 15,
          ),
          SizedBox(height: 10),
          _productCard(
            imageUrl: 'assets/cerini.png',
            title: 'Cerini',
            type: 'Sirup',
            price: 'Rp30.000',
            stock: 10,
          ),
        ],
      ),
    );
  }

  Widget _productCard({
    required String imageUrl,
    required String title,
    required String type,
    required String price,
    required int stock,
  }) {
    return Card(
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
                  Text(title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(type),
                  Text(price, style: TextStyle(color: Colors.green)),
                ],
              ),
            ),
            SizedBox(width: 10),
            IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                // Add to cart action
              },
            ),
            ElevatedButton(
              onPressed: () {
                _showProductDialog(
                    context, imageUrl, title, type, price, stock);
              },
              child: Text('Beli', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showProductDialog(BuildContext context, String imageUrl, String title,
      String type, String price, int stock) {
    int quantity = 1;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset(imageUrl, width: 60, height: 60),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(title,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            Text(type),
                            Text(price, style: TextStyle(color: Colors.green)),
                            Text("Stok: $stock"),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text("Jumlah"),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            if (quantity > 1) {
                              setState(() {
                                quantity--;
                              });
                            }
                          },
                        ),
                        Text(quantity.toString()),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            if (quantity < stock) {
                              setState(() {
                                quantity++;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                        child: Text('Beli Sekarang',
                            style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  // Riwayat Tab Content
  Widget _buildRiwayatContent() {
    return Container(
      color: Colors.green.withOpacity(0.2), // Main content background color
      padding: EdgeInsets.all(16.0),
      child: ListView(
        children: [
          _orderCard(
            orderId: 'PSN01',
            products: [
              {'name': 'Paracetamol', 'image': 'assets/paracetamol.png'},
              {'name': 'Cerini', 'image': 'assets/cerini.png'},
            ],
            total: 'Rp50.000',
            address: 'Jl. Yang Lurus No.12',
          ),
        ],
      ),
    );
  }

  Widget _orderCard({
    required String orderId,
    required List<Map<String, String>> products,
    required String total,
    required String address,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(orderId,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ...products.map((product) {
              return Row(
                children: [
                  Image.asset(product['image']!, width: 60, height: 60),
                  SizedBox(width: 10),
                  Text(product['name']!),
                ],
              );
            }).toList(),
            Text('Total: $total'),
            Text('Alamat: $address'),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.green),
                  onPressed: () {
                    // Edit order action
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    // Delete order action
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Notifikasi Tab Content
  Widget _buildNotifikasiContent() {
    return Container(
      color: Colors.green.withOpacity(0.2), // Main content background color
      padding: EdgeInsets.all(16.0),
      child: ListView(
        children: [
          _notifikasiCard(
            title: 'Alert',
            description: 'Pesanan sudah tiba',
          ),
        ],
      ),
    );
  }

  Widget _notifikasiCard({required String title, required String description}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(description),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    // Delete notification action
                  },
                ),
                IconButton(
                  icon: Icon(Icons.reply, color: Colors.black),
                  onPressed: () {
                    // Reply to notification action
                  },
                ),
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.green),
                  onPressed: () {
                    // Edit notification action
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Resep Tab Content
  Widget _buildResepContent() {
    return Container(
      color: Colors.green.withOpacity(0.2), // Main content background color
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Resep Obat",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text("Bodrex"),
                  Text("Paramex"),
                  SizedBox(height: 10),
                  Text("dr.Indra",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          // Delete prescription action
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.green),
                        onPressed: () {
                          // Edit prescription action
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Add new prescription action
              },
              child:
                  Text('Tambah Resep', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Profil Tab Content
  Widget _buildProfilContent() {
    return Container(
      color: Colors.green.withOpacity(0.2), // Main content background color
      padding: EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey,
                  backgroundImage:
                      _profileImage != null ? FileImage(_profileImage!) : null,
                  child: _profileImage == null
                      ? Icon(Icons.person, size: 50, color: Colors.black)
                      : null,
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    _showImagePickerOptions(context);
                  },
                  child: Text("Ubah Foto Profil",
                      style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                if (_profileImage != null) ...[
                  TextButton(
                    onPressed: _removeImage,
                    child:
                        Text("Hapus Foto", style: TextStyle(color: Colors.red)),
                  )
                ],
              ],
            ),
          ),
          SizedBox(height: 20),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _editableProfileItem("Nama", _nameController),
                  _editableProfileItem("Email", _emailController),
                  _editableProfileItem("No.Telp", _phoneController),
                  _editableProfileItem("Gender", _genderController),
                  SizedBox(height: 10),
                  IconButton(
                    icon: Icon(Icons.exit_to_app, color: Colors.red),
                    onPressed: () {
                      // Logout action
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _editableProfileItem(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$label:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Row(
            children: [
              Text(controller.text), // Display current value
              IconButton(
                icon: Icon(Icons.edit, color: Colors.green),
                onPressed: () {
                  _showEditDialog(label, controller);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showEditDialog(String label, TextEditingController controller) {
    TextEditingController editController =
        TextEditingController(text: controller.text);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit $label"),
          content: TextField(
            controller: editController,
            decoration: InputDecoration(
              labelText: "Masukkan $label baru",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Batal"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  controller.text = editController.text;
                });
                Navigator.of(context).pop();
              },
              child: Text("Simpan"),
            ),
          ],
        );
      },
    );
  }

  void _showImagePickerOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Ambil dari Galeri'),
                onTap: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text('Ambil dari Kamera'),
                onTap: () {
                  _pickImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Agenda Tab Content
  Widget _buildAgendaContent() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agenda"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        color: Colors.green.withOpacity(0.2), // Main content background color
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2020, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
              calendarFormat: CalendarFormat.month,
              startingDayOfWeek: StartingDayOfWeek.monday,
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
            ),
            SizedBox(height: 20),
            _agendaItem("Lorem Ipsum", "15.10.2024"),
            SizedBox(height: 10),
            _agendaItem("Lorem Ipsum", "16.10.2024"),
          ],
        ),
      ),
    );
  }

  Widget _agendaItem(String title, String date) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text("dolor sit alhert"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                // Delete agenda action
              },
            ),
            IconButton(
              icon: Icon(Icons.edit, color: Colors.green),
              onPressed: () {
                // Edit agenda action
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartContent() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Keranjang"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        color: Colors.green.withOpacity(0.2),
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _cartItem(
              imageUrl: 'assets/paracetamol.png',
              title: 'Paracetamol',
              type: 'Tablet',
              price: 'Rp20.000',
              quantity: 2,
              isSelected: true,
            ),
            SizedBox(height: 10),
            _cartItem(
              imageUrl: 'assets/cerini.png',
              title: 'Cerini',
              type: 'Sirup',
              price: 'Rp30.000',
              quantity: 1,
              isSelected: true,
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add new item action
                },
                child: Text('Tambah Barang',
                    style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  Text('Total Barang',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('Rp50.000',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green)),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Payment action
                    },
                    child: Text('Pembayaran',
                        style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cartItem({
    required String imageUrl,
    required String title,
    required String type,
    required String price,
    required int quantity,
    required bool isSelected,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imageUrl, width: 60, height: 60),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(type),
                  Text(price, style: TextStyle(color: Colors.green)),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          // Decrease quantity
                        },
                      ),
                      Text(quantity.toString()),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          // Increase quantity
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Checkbox(
              value: isSelected,
              onChanged: (bool? value) {
                setState(() {
                  // Handle checkbox selection
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
