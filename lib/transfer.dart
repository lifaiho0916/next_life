// ignore_for_file: depend_on_referenced_packages, unused_local_variable

import 'dart:convert';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:next_life/data/init_data.dart';

Future<bool> uploadUserImage() async {
  final XFile imageFile = XFile(sendData.curAvatarImage);
  List<int> imageBytes = await imageFile.readAsBytes();
  String base64Image = base64Encode(imageBytes);

  Map<String, dynamic> combinedData={
    'filename': imageFile.name,
    'body': base64Image
  };
  safePrint('--------${jsonEncode(combinedData)}-------');
  const apiUrl = "https://18it0wny1k.execute-api.us-east-1.amazonaws.com/default/uploadimage";
  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {'content-type': 'image/jpeg'},
    body: jsonEncode(combinedData)
  );

  if (response.statusCode == 200) {
    safePrint('Data sent successfully');
    return true;
  } else {
    safePrint('Error occurred. ${response.body}');
    return false;
  }
}

Future<bool> sendUserInfoToAWS() async {
  var combinedData = {
    'TableName': 'user_basic_infos',
    'userId': userId,
    'name': sendData.userName,
    'age': sendData.age,
    'location': sendData.location,
    'dob': sendData.day_of_birth.toString(),
    'gender': sendData.gender,
    'avatar': sendData.curAvatarImage,
    'theme': sendData.theme
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
    safePrint('sendUserInfoToAWS --- error occured. ${response.body}');
    return false;
  }
}

Future<bool> sendUserScheduleToAWS() async {
  const apiUrl = "https://fqct3iwkbc.execute-api.us-east-1.amazonaws.com/default/setSchedule";
  var combinedData = {
    'TableName': 'user_basic_infos',
    'userId': userId,
    'schedule': sendData.schedule,
  };
  final headers = {'Content-Type': 'application/json'};
  final response = await http.post(Uri.parse(apiUrl),
      headers: headers, body: jsonEncode(combinedData));

  if (response.statusCode == 200) {
    safePrint('Schedule Data sent successfully');
    return true;
  } else {
    safePrint(' --- sendUserSechduleToAWS error occured. ${response.body}');
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
    'survey' : sendData.survey,
    'answer' : sendData.answer,
    'address' : sendData.address,
    'internetSpeed' : sendData.internetSpeed,
    'hobbies' : sendData.hobbies,
    'sleepSchedule' : sendData.sleepSchedule,
    'housingType' : sendData.housingType,
    'transportationType' : sendData.transportationType,
    'zipCode' : sendData.zipCode,
    'cityCode' : sendData.cityCode,
    'stateCode' : sendData.stateCode,
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
    safePrint('--- sendUserProfileInfoToAWS error occured. ${response.body}');
    return false;
  }
}


Future<bool> getTableDataFromAWS(int id) async {
  List<String> tableNames = ['user_basic_infos', 'user_profile_extra_inputs'];
  var data = {
    'tableName': tableNames[id],
    'key': userId,
  };
  const apiUrl =
      "https://2ww9rdzswj.execute-api.us-east-1.amazonaws.com/default/getUserTableData";
  final headers = {'Content-Type': 'application/json'};
  final response = await http.post(Uri.parse(apiUrl),
      headers: headers, body: jsonEncode(data));

  if (response.statusCode == 200) {
    safePrint('Received Data successfully');
    if(response.body == '') return false;
    Map<String, dynamic> receivedData = jsonDecode(response.body);
    switch(id) {
      case 0: sendData.setUserBasicData(receivedData); break;
      case 1: sendData.setOtherProfileData(receivedData); break;
    }
    return true;
  } else {
    safePrint('--- GetTableDataFromAWS error occured. ${response.body}');
    return false;
  }
}

Future<bool> getDataScheduleFromAWS() async {
  var data = {
    "prompt":sendData.current_job_title,
    "age":sendData.age,
    "questionsAreAnsrwered":false,
    "answersToQuestions":"",
    "generateLifePlan":true,
    "lifePlanDataRequest":""
  };
  const apiUrl =
      "https://e5120pdd9j.execute-api.us-east-1.amazonaws.com/default/ynlAIControler";
  final headers = {'Content-Type': 'application/json'};
  final response = await http.post(Uri.parse(apiUrl),
      headers: headers, body: jsonEncode(data));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    String scheduleResponse = data['response'];
    sendData.schedule = scheduleResponse;
    return true;
  } else {
    safePrint('--- getDataScheduleFromAWS error occured. ${response.body}');
    return false;
  }
}

Future<bool> getDataWhatTheyLikeFromAWS() async {
  var data = {
    "prompt":"",
    "age":sendData.age,
    "questionsAreAnsrwered":false,
    "answersToQuestions":"",
    "generateLifePlan":false,
    "lifePlanDataRequest":""
  };
  const apiUrl =
      "https://e5120pdd9j.execute-api.us-east-1.amazonaws.com/default/ynlAIControler";
  final headers = {'Content-Type': 'application/json'};
  final response = await http.post(Uri.parse(apiUrl),
      headers: headers, body: jsonEncode(data));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    sendData.hintText = data['response'];
    return true;
  } else {
      safePrint('--- getDataWhatTheyLikeFromAWS error occured. ${response.body}');
      return false;
  }
}