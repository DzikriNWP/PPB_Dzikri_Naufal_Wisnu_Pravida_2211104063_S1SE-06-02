import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Navigation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  // Controllers for Home page
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  // Controllers for Wisata page
  final TextEditingController _destinationController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  // Controllers for Profile page
  final TextEditingController _profileNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  // Method to show snackbar
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  // Home page form
  Widget _buildHomeForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Nama',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_nameController.text.isEmpty ||
                  _emailController.text.isEmpty) {
                _showSnackBar('Mohon isi semua field');
              } else {
                _showSnackBar('Form berhasil disubmit!');
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  // Wisata page form
  Widget _buildWisataForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _destinationController,
            decoration: const InputDecoration(
              labelText: 'Nama Destinasi Wisata',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _dateController,
            decoration: const InputDecoration(
              labelText: 'Tanggal Kunjungan',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_destinationController.text.isEmpty ||
                  _dateController.text.isEmpty) {
                _showSnackBar('Mohon isi semua field');
              } else {
                _showSnackBar('Destinasi wisata berhasil ditambahkan!');
              }
            },
            child: const Text('Tambah Destinasi'),
          ),
        ],
      ),
    );
  }

  // Profile page form
  Widget _buildProfileForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _profileNameController,
            decoration: const InputDecoration(
              labelText: 'Nama Lengkap',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _phoneController,
            decoration: const InputDecoration(
              labelText: 'Nomor Telepon',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _addressController,
            maxLines: 3,
            decoration: const InputDecoration(
              labelText: 'Alamat',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_profileNameController.text.isEmpty ||
                  _phoneController.text.isEmpty ||
                  _addressController.text.isEmpty) {
                _showSnackBar('Mohon isi semua field');
              } else {
                _showSnackBar('Profil berhasil diupdate!');
              }
            },
            child: const Text('Update Profil'),
          ),
        ],
      ),
    );
  }

  late final List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      _buildHomeForm(),
      _buildWisataForm(),
      _buildProfileForm(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    // Dispose all controllers
    _nameController.dispose();
    _emailController.dispose();
    _destinationController.dispose();
    _dateController.dispose();
    _profileNameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Navigation Demo'),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.landscape),
            label: 'Wisata',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
