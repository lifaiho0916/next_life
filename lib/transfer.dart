import 'dart:convert';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:mylife/data/init_data.dart';

Future<bool> sendUserInfoToAWS() async {
  var combinedData = {
    'TableName': 'user_basic_infos',
    'userId': userId,
    'name': sendData.userName,
    'age': sendData.age,
    'location': sendData.location,
    'dob': sendData.day_of_birth.toString(),
    'gender': sendData.gender,
  };
  const apiUrl =
      "https://ecuw80ugj2.execute-api.us-east-1.amazonaws.com/default/ynlAICont";
  final headers = {'Content-Type': 'application/json'};
  final response = await http.post(Uri.parse(apiUrl),
      headers: headers, body: jsonEncode(combinedData));

  if (response.statusCode == 200) {
    safePrint('Data sent successfully');
    return true;
  } else {
    safePrint(response.body);
    return false;
  }
}

Future<bool> getTableDataFromAWS() async {
  var data = {
    'tableName': 'user_basic_infos',
    'key': userId,
  };
  const apiUrl =
      "https://2ww9rdzswj.execute-api.us-east-1.amazonaws.com/default/getUserTableData";
  final headers = {'Content-Type': 'application/json'};
  final response = await http.post(Uri.parse(apiUrl),
      headers: headers, body: jsonEncode(data));

  if (response.statusCode == 200) {
    safePrint('Received Data successfully');
    Map<String, dynamic> receivedData = jsonDecode(response.body);
    sendData.setCurrentData(receivedData);

    return true;
  } else {
    safePrint(response.body);
    return false;
  }
}
