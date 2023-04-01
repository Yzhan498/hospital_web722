class PatientModel {
  int ? patientId;
  String ? name;
  String ? email;
  String ? number;
  String ? bloodType;
  String ? age;
  String ? address;
  String ? doctorId;

  PatientModel({this.patientId,this.name,this.email,this.number,this.bloodType,this.age,this.address,this.doctorId});

  Map<String, dynamic> toMap() {
    var map = < String,dynamic >{};
    map["id"] = patientId;
    map["name"] = name;
    map["email"] = email;
    map["number"] = number;
    map["bloodType"]=bloodType;
    map["age"]=age;
    map["address"]=address;
    map["doctorId"]=doctorId;
    return map;
  }

  PatientModel.fromMap(Map<dynamic, dynamic> map) {
    patientId = map['id'];
    name = map['name'];
    email = map['email'];
    number = map['number'];
    bloodType=map['bloodType'];
    age=map['age'];
    address=map['address'];
    doctorId=map['doctorId'];
  }
}