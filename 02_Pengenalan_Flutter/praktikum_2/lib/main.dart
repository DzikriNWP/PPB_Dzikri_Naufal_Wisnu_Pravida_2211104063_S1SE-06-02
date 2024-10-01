import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.teal, Colors.teal.shade200],
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                          'https://avatars.githubusercontent.com/u/162244734?s=400&u=491a1f05e8da3c579830c6c4372839abdbac7004&v=4'),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Dzikri Naufal Wisnu Pravida',
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      'Telkom University Purwokerto | Software Engineering',
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle('About Me'),
                  _buildAboutMe(),
                  SizedBox(height: 20),
                  _buildSectionTitle('Skills'),
                  _buildSkills(),
                  SizedBox(height: 20),
                  _buildSectionTitle('Education'),
                  _buildEducation(),
                  SizedBox(height: 20),
                  _buildSectionTitle('Contact'),
                  _buildContact(),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add action here
        },
        child: Icon(Icons.email),
        tooltip: 'Contact Me',
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 22, fontWeight: FontWeight.bold, color: Colors.teal),
      ),
    );
  }

  Widget _buildAboutMe() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'My name is Dzikri Naufal Wisnu Pravida, and I am a 5th-semester student in Software Engineering at Institut Teknologi Telkom Purwokerto. I have a strong interest in Web Programming and Android Development. In addition to my academic pursuits, I actively participate in various committees and volunteer activities both on and off campus. These experiences have helped me develop strong leadership, teamwork, and organizational skills.',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildSkills() {
    final skills = ['Java', 'HTML & CSS', 'PHP', 'Python'];
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: skills
          .map((skill) => Chip(
                label: Text(skill),
                backgroundColor: Colors.teal.shade100,
              ))
          .toList(),
    );
  }

  Widget _buildProjectItem(String title, String description) {
    return Card(
      elevation: 2,
      child: ListTile(
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }

  Widget _buildEducation() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Telkom University Purwokerto',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Bachelor of Software Engineering'),
            Text('2022 - Now'),
          ],
        ),
      ),
    );
  }

  Widget _buildContact() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          icon: Icon(Icons.email),
          onPressed: () {},
          color: Colors.teal,
        ),
        IconButton(
          icon: Icon(Icons.phone),
          onPressed: () {},
          color: Colors.teal,
        ),
        IconButton(
          icon: Icon(Icons.link), // Using link icon for flexibility
          onPressed: () {
            // Add action to open your Instagram profile
          },
          color: Colors.teal,
        ),
        IconButton(
          icon: Icon(Icons.facebook),
          onPressed: () {
            // Add action to open your Facebook profile
          },
          color: Colors.teal,
        ),
      ],
    );
  }
}
