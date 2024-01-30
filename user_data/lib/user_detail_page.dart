// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class UserDetailPage extends StatelessWidget {
  final Map<String, dynamic> user;

  const UserDetailPage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[900],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple[900],
        elevation: 0,
        title: Text(
          'U S E R I N F O',
          style: TextStyle(color: Colors.blue[100]),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${user['name']}',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              'Email: ${user['email']}',
              style: TextStyle(color: Colors.blue[100]),
            ),
            SizedBox(height: 8),
            Text('Phone: ${user['phone']}',
                style: TextStyle(color: Colors.blue[100])),
            SizedBox(height: 8),
            Text('Website: ${user['website']}',
                style: TextStyle(color: Colors.blue[100])),
            SizedBox(height: 10),
            Text('Address:', style: TextStyle(color: Colors.white)),
            Text('Street: ${user['address']['street']}',
                style: TextStyle(color: Colors.blue[100])),
            Text('Suite: ${user['address']['suite']}',
                style: TextStyle(color: Colors.blue[100])),
            Text('City: ${user['address']['city']}',
                style: TextStyle(color: Colors.blue[100])),
            Text('Zipcode: ${user['address']['zipcode']}',
                style: TextStyle(color: Colors.blue[100])),
            SizedBox(height: 10),
            Text('Company:', style: TextStyle(color: Colors.white)),
            Text('Name: ${user['company']['name']}',
                style: TextStyle(color: Colors.blue[100])),
            Text('Catch Phrase: ${user['company']['catchPhrase']}',
                style: TextStyle(color: Colors.blue[100])),
            Text('Business: ${user['company']['bs']}',
                style: TextStyle(color: Colors.blue[100])),
          ],
        ),
      ),
    );
  }
}
