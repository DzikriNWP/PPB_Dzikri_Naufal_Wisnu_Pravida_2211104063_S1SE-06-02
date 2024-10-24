import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyPackage extends StatefulWidget {
  const MyPackage({super.key});

  @override
  State<MyPackage> createState() => _MyPackageState();
}

class _MyPackageState extends State<MyPackage> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Belajar Package",
          style: GoogleFonts.sriracha(),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
          child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(),
            child: TextFormField(
              maxLength: 25,
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                labelText: 'Name',
                labelStyle: TextStyle(
                  color: Colors.blueGrey,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              onChanged: (value) {},
            ),
          ),
          TextField(
            obscureText: true,
            obscuringCharacter: "*",
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                labelText: "Password",
                border: OutlineInputBorder()),
          ),
          SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "ini adalah Elevated Button",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
            ),
          ),
          SizedBox(height: 15),
          TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.amberAccent),
            onPressed: () {},
            child: Text(
              "Ini adalah Text Button",
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(height: 15),
          DropdownButton<String>(
              hint: Text("Pilih Opsi"),
              value: selectedValue,
              items: <String>['Opsi1', 'Opsi 2', 'Opsi 3']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedValue = newValue;
                });
              }),
        ],
      )
          // Text(
          //   "Google Font",
          //   style: TextStyle(fontSize: 25),
          // ),
          ),
    );
  }
}
