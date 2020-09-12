enum UserType{ PARTICULAR, PROFESSIONAL}

class User{

  User({this.id, this.name, this.email, this.phone, this.password, this.type = UserType.PARTICULAR, this.createdAt});

  String id;
  String name;
  String email;
  String phone;
  String password;
  DateTime createdAt;
  UserType type;

  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email, phone: $phone, password: $password, createdAt: $createdAt, type: $type}';
  }
}