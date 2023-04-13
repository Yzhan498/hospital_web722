class RecordModel {
int? recordId;
int ? patientId;
String ? heartBeat;
String ? oxygenLevel;
String ? respireRate;
String  bloodPressure='56';

  RecordModel({this.recordId,this.patientId,this.heartBeat,this.oxygenLevel,this.respireRate,required this.bloodPressure});

Map<String, dynamic> toMap() {
  var map = < String,dynamic >{};
  map["recordId"] = recordId;
  map["patientId"]=patientId;
  map["heartBeat"] = heartBeat;
  map["oxygenLevel"] = oxygenLevel;
  map["respireRate"] = respireRate;
  map["bloodPressure"] = bloodPressure;
  return map;
}


RecordModel.fromMap(Map<dynamic, dynamic> map) {
  recordId = map['recordId'];
  patientId=map['patientId'];
  heartBeat = map['heartBeat'];
  oxygenLevel = map['oxygenLevel'];
  respireRate = map['respireRate'];
  bloodPressure=map['bloodPressure'];
}
}