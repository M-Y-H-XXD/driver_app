import 'dart:convert';

import 'package:driver/static_classes/new_request_data.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';

class NewRequest {
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

  Future<void> Requestes() async {
    var url = Uri.parse('http://10.0.2.2:8000/api/show_my_curent_transfers');
    try {
      String? token = await getSecureValue('token');
      var response = await get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 201 || response.statusCode == 202) {
        var data = jsonDecode(response.body);
        NewRequestData.requests = data;
        print('New Request done successfully \n body=${response.body}');
      } else {
        print(
          'New Request failed \n statusCode=${response.statusCode} \n body=${response.body}',
        );
      }
    } catch (e) {
      print('e=$e');
    }
  }
}
