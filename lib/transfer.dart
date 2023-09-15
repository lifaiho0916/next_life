// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:next_life/data/init_data.dart';

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
    safePrint('error occured. ${response.body}');
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
    safePrint('error occured. ${response.body}');
    return false;
  }
}

Future<bool> sendUserProfileInfoToAWS() async {
  var userProfileData = {
    'TableName': 'user_profile_extra_inputs',
    'userId': userId,
    'social_media_account': sendData.social_media_account,
    'housing': sendData.housing,
    'transportation': sendData.transportation,
    'dependents' : sendData.dependents,
    'pets' : sendData.pets,
    'highest_degree_diploma_earned' : sendData.highest_degree_diploma_earned,
    'highest_level_of_education' : sendData.highest_level_of_education,
    'current_employer' : sendData.current_employer,
    'monthly_expenses' : sendData.monthly_expenses,
    'debts' : sendData.debts,
    'do_you_want_to_own_or_rent_your_home_in_5_years' : sendData.do_you_want_to_own_or_rent_your_home_in_5_years,
    'how_many_dependents_will_you_have_in_5_years' : sendData.how_many_dependents_will_you_have_in_5_years,
    'do_you_want_to_attend_college_or_certification_classes' : sendData.do_you_want_to_attend_college_or_certification_classes,
  };
  const apiUrl =
      "https://mby4tp0e0a.execute-api.us-east-1.amazonaws.com/default/ynlUserProfileAICont";
  final headers = {'Content-Type': 'application/json'};
  final response = await http.post(Uri.parse(apiUrl),
      headers: headers, body: jsonEncode(userProfileData));

  if (response.statusCode == 200) {
    safePrint('Data sent successfully');
    return true;
  } else {
    safePrint('error occured. ${response.body}');
    return false;
  }
}



