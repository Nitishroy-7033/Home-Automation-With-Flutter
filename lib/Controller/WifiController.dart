import 'package:get/get.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:http/http.dart' as http;

class WifiController extends GetxController {
  final info = NetworkInfo();

  void getWifiInfo() async {}

  Future<void> sendCommand(String command) async {
    final uri = Uri.parse("http://198.168.23:33454/$command");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      print("Command '$command' sent successfully");
    } else {
      print("Error sending command: ${response.statusCode}");
    }
  }
}
