import 'package:flutter/material.dart';
import 'user_data.dart';
import 'user_detail_page.dart';
import 'splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User List App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splashscreen(),
    );
  }
}

class UserListPage extends StatefulWidget {
  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  late List<dynamic> users = [];
  late List<dynamic> filteredUsers = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() {
    UserData.fetchUsers().then((value) {
      setState(() {
        users = value;
        filteredUsers = List.from(users);
      });
    }).catchError((error) {
      print('Error fetching users: $error');
    });
  }

  void filterUsers(String query) {
    setState(() {
      if (query.isNotEmpty) {
        filteredUsers = users
            .where((user) =>
                user['name'].toLowerCase().contains(query.toLowerCase()))
            .toList();
      } else {
        filteredUsers = List.from(users);
      }
    });
  }

  void navigateToUserDetailPage(
      BuildContext context, Map<String, dynamic> user) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UserDetailPage(user: user)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[900],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "U S E R D A T A",
          style: TextStyle(color: Colors.blue[100]),
        ),
        backgroundColor: Colors.deepPurple[900],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Search for a Data",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(color: Colors.white),
                onChanged: filterUsers,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.deepPurple[800],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  prefixIconColor: Colors.purple[100],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredUsers.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      filteredUsers[index]['name'],
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      filteredUsers[index]['email'],
                      style: TextStyle(color: Colors.blue[100]),
                    ),
                    onTap: () {
                      navigateToUserDetailPage(context, filteredUsers[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
