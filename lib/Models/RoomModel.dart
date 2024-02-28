import 'package:smart_home/Models/DeviceData.dart';
import 'package:smart_home/Models/DeviceModel.dart';

class RoomModel {
  String? id;
  String? createdAt;
  String? roomName;
  String? icon;
  String? status;
  List<DeviceModel>? devices;
  String? timeUsage;
  String? energyUsage;
  String? energyRate;
  String? temperature;
  String? humidity;
  String? battery;
  List<DeviceData>? statics;

  RoomModel(
      {this.id,
      this.createdAt,
      this.roomName,
      this.icon,
      this.status,
      this.devices,
      this.timeUsage,
      this.energyUsage,
      this.energyRate,
      this.temperature,
      this.humidity,
      this.battery,
      this.statics});

  RoomModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    createdAt = json["createdAt"];
    roomName = json["roomName"];
    icon = json["icon"];
    status = json["status"];
    devices = json["devices"] == null
        ? null
        : (json["devices"] as List)
            .map((e) => DeviceModel.fromJson(e))
            .toList();
    timeUsage = json["timeUsage"];
    energyUsage = json["energyUsage"];
    energyRate = json["energyRate"];
    temperature = json["temperature"];
    humidity = json["humidity"];
    battery = json["battery"];
    statics = json["statics"] ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["createdAt"] = createdAt;
    _data["roomName"] = roomName;
    _data["icon"] = icon;
    _data["status"] = status;
    if (devices != null) {
      _data["devices"] = devices?.map((e) => e.toJson()).toList();
    }
    _data["timeUsage"] = timeUsage;
    _data["energyUsage"] = energyUsage;
    _data["energyRate"] = energyRate;
    _data["temperature"] = temperature;
    _data["humidity"] = humidity;
    _data["battery"] = battery;
    if (statics != null) {
      _data["statics"] = statics;
    }
    return _data;
  }
}
