// {
//   "id":"",
//   "createdAt":"",
//   "updatedAt":"",
//   "createdBy":"",
//   "roomId":"",
//   "deviceName":"",
//   "icon":"",
//   "type":"",
//   "status":"",
//   "isOn":true,
//   "deviceColor":"",
//   "deviceSpeed":"",
//   "deviceVolume":"",
//   "isTimerSet":true,
//   "onTime":"",
//   "offTime":"",
//   "brightness":"",
//   "temperature":"",
//   "humidity":"",
//   "battery":"",
//   "mode":"",
//   "timeUsage":"",
//   "energyUsage":"",
//   "energyRate":"",
//   "statics":[]

// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_home/Models/DeviceData.dart';

final auth = FirebaseAuth.instance;

class DeviceModel {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? createdBy ;
  String? roomId;
  String? deviceName;
  String? icon;
  String? type;
  String? status;
  bool? isOn;
  String? deviceColor;
  int? selectedColorIndex;
  String? deviceSpeed;
  String? deviceVolume;
  bool? isTimerSet;
  String? onTime;
  String? offTime;
  String? brightness;
  String? temperature;
  String? humidity;
  String? battery;
  String? mode;
  String? timeUsage;
  String? energyUsage;
  String? energyRate;
  List<DeviceData>? statics;

  DeviceModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.roomId,
    this.deviceName,
    this.icon,
    this.type,
    this.status,
    this.isOn,
    this.deviceColor,
    this.selectedColorIndex,
    this.deviceSpeed,
    this.deviceVolume,
    this.isTimerSet,
    this.onTime,
    this.offTime,
    this.brightness,
    this.temperature,
    this.humidity,
    this.battery,
    this.mode,
    this.timeUsage,
    this.energyUsage,
    this.energyRate,
    this.statics,
  });

  DeviceModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    createdBy = json["createdBy"];
    roomId = json["roomId"];
    deviceName = json["deviceName"];
    icon = json["icon"];
    type = json["type"];
    status = json["status"];
    isOn = json["isOn"];
    deviceColor = json["deviceColor"];
    selectedColorIndex = json["selectedColorIndex"];
    deviceSpeed = json["deviceSpeed"];
    deviceVolume = json["deviceVolume"];
    isTimerSet = json["isTimerSet"];
    onTime = json["onTime"];
    onTime = json["onTime"];
    offTime = json["offTime"];
    brightness = json["brightness"];
    temperature = json["temperature"];
    humidity = json["humidity"];
    battery = json["battery"];
    mode = json["mode"];
    timeUsage = json["timeUsage"];
    energyUsage = json["energyUsage"];
    energyRate = json["energyRate"];
    statics = json["statics"] ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["createdBy"] = createdBy;
    _data["roomId"] = roomId;
    _data["deviceName"] = deviceName;
    _data["icon"] = icon;
    _data["type"] = type;
    _data["status"] = status;
    _data["isOn"] = isOn;
    _data["deviceColor"] = deviceColor;
    _data["selectedColorIndex"] = selectedColorIndex;
    _data["deviceSpeed"] = deviceSpeed;
    _data["deviceVolume"] = deviceVolume;
    _data["isTimerSet"] = isTimerSet;
    _data["onTime"] = onTime;
    _data["offTime"] = offTime;
    _data["brightness"] = brightness;
    _data["temperature"] = temperature;
    _data["humidity"] = humidity;
    _data["battery"] = battery;
    _data["mode"] = mode;
    _data["timeUsage"] = timeUsage;
    _data["energyUsage"] = energyUsage;
    _data["energyRate"] = energyRate;
    if (statics != null) {
      _data["statics"] = statics;
    }
    return _data;
  }
}
