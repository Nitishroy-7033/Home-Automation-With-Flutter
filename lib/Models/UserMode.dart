
class UserModel {
  String? id;
  String? name;
  String? email;
  String? password;
  String? role;
  String? phoneNumber;

  UserModel({this.id, this.name, this.email, this.password, this.role, this.phoneNumber});

  UserModel.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["email"] is String) {
      email = json["email"];
    }
    if(json["password"] is String) {
      password = json["password"];
    }
    if(json["role"] is String) {
      role = json["role"];
    }
    if(json["phoneNumber"] is String) {
      phoneNumber = json["phoneNumber"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["email"] = email;
    _data["password"] = password;
    _data["role"] = role;
    _data["phoneNumber"] = phoneNumber;
    return _data;
  }
}