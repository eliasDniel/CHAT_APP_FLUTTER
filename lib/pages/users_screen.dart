import 'package:app_chat_socket/models/user.dart';
import 'package:flutter/material.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final List<User> usuarios = [
    User(online: true, email: 'user1@example.com', name: 'User 1', uid: '1'),
    User(online: false, email: 'user2@example.com', name: 'User 2', uid: '2'),
    User(online: true, email: 'user3@example.com', name: 'User 3', uid: '3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Mi nombre',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        elevation: 3,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.exit_to_app, color: Colors.black87),
          onPressed: () {},
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Icon(Icons.check_circle, color: Colors.blue[400]),
          ),
        ],
      ),
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final usuario = usuarios[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue[100],
              child: Text(usuario.name.substring(0, 2)),
            ),
            title: Text(usuario.name),
            subtitle: Text(usuario.email),
            trailing: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: usuario.online ? Colors.green[300] : Colors.red,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          );
        },
        separatorBuilder: (_, index) => Divider(),
        itemCount: usuarios.length,
      ),
    );
  }
}
