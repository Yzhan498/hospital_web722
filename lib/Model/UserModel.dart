class UserModel {
  final int? id;
  final String name;
final String email;
final String password;

  UserModel({this.id,required this.name,required this.email,required this.password});

  Map<String,dynamic> toMap() {
    var map=<String,dynamic>
    {
      'id':id,
      'name':name,
      'email':email,
      'password':password,
    };
    return map;
  }
  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
    id: json['id'],
    name: json['name'],
    email: json['email'],
    password: json['password'],
  );
}