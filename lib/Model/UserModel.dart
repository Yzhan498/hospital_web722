class UserModel {
  int ? id ;
  String ? name;
  String ? email;
  String ? password;

  UserModel({this.id, this.name, this.email,this.password});

  Map<String,dynamic> toMap() {
    var map = < String,dynamic >{};
    map["id"] = id;
    map["name"] = name;
    map["email"] = email;
    map["password"] = password;
    return map;
  }

  UserModel.fromMap(Map<dynamic, dynamic> map) {
    id = map['id'];
    name = map['name'];
    email = map['email'];
    password = map['password'];
  }
}