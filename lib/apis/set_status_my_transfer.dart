import 'dart:convert';

import 'package:driver/static_classes/set_status_my_transfer_data.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';

class SetStatusMyTransfer {
  final storage = const FlutterSecureStorage();
  Future<String?> getSecureValue(String key) async {
    try {
      String? value = await storage.read(key: key);
      return value;
    } catch (e) {
      print("Error reading from secure storage: $e");
      return null;
    }
  }

  Future<void> refreshTheStatus() async {
    var url = Uri.parse('http://10.0.2.2:8000/api/set_status_my_transfer');
    try {
      String? token = await getSecureValue('token');
      var response = await get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      var data = jsonDecode(response.body);
      if (response.statusCode == 201 || response.statusCode == 202) {
        SetStatusMyTransferData.status = data;
        print('SetStatusMyTransfer done successfully \n body=${response.body}');
      } else {
        SetStatusMyTransferData.status = data;
        print(
          'SetStatusMyTransfer failed \n statusCode=${response.statusCode} \n body=${response.body}',
        );
      }
    } catch (e) {
      print('e=$e');
    }
  }
}
