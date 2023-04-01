class RecordModel {
int? recordId;
String ? heartBeat;
String ? oxygenLevel;
String ? respireRate;
String ? bloodPressure;

  RecordModel({this.recordId,required this.heartBeat,required this.oxygenLevel,
    required this.respireRate,required this.bloodPressure});

Map<String, dynamic> toMap() {
  var map = < String,dynamic >{};
  map["id"] = recordId;
  map["heartBeat"] = heartBeat;
  map["oxygenLevel"] = oxygenLevel;
  map["respireRate"] = respireRate;
  map["bloodPressure"] = bloodPressure;
  return map;
}


RecordModel.fromMap(Map<dynamic, dynamic> map) {
  recordId = map['id'];
  heartBeat = map['heartBeat'];
  oxygenLevel = map['oxygenLevel'];
  respireRate = map['respireRate'];
  bloodPressure=map['bloodPressure'];
}
}