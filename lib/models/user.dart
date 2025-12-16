class User {
  bool online;
  String email;
  String name;
  String uid;
  User({
    required this.online,
    required this.email,
    required this.name,
    required this.uid,
  });
  factory User.fromJson(Map<String, dynamic> json) => User(
    online: json['online'],
    email: json['email'],
    name: json['name'],
    uid: json['uid'],
  );
  Map<String, dynamic> toJson() => {
    'online': online,
    'email': email,
    'name': name,
    'uid': uid,
  };
}
