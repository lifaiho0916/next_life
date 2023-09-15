// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mime/mime.dart';

class Converters {

  static String convertDateTimeToDateString(DateTime? dateTime) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return dateTime != null
        ? formatter.format(dateTime)
        : formatter.format(DateTime.now());
  }

  static DateTime convertDateStringToDateTime(String? dateString) {
    if (dateString! != '') {
      RegExp dateTimePattern = RegExp(r'^\d{4}\-\d{2}\-\d{2}$');
      if (dateTimePattern.hasMatch(dateString)) {
        return DateTime.parse(dateString);
      } else {
        return DateTime.now();
      }
    } else {
      return DateTime.now();
    }
  }

  static bool isVideo(String filePath) {
    String? mimeType = lookupMimeType(filePath);

    if (mimeType != null && mimeType.startsWith('video/')) {
      return true;
    } else {
      return false;
    }
  }
}

Future<void> changePassword(String currentPassword, String newPassword) async {
  try {
    await Amplify.Auth.updatePassword(
      oldPassword: currentPassword,
      newPassword: newPassword,
    );
  } on AuthException catch (e) {
    // Handle password change failure
    safePrint('Error changing password: ${e.message}');
  }
}

class UserData {
  static UserData instance = UserData();

  String userName = '';
  int age = 0;
  String day_of_birth = '01/01/2000';
  String gender = '';
  String location = '';
  String survey ='';
  String email = '';
  String password = '';
  List<String> answer= List<String>.filled(7, '');

  String social_media_account = '';
  String housing = '';
  String transportation = '';
  String dependents = '';
  String pets = '';
  String highest_degree_diploma_earned = 'highest_degree_diploma_earned';
  String graduation_year = 'graduation_year';
  String highest_level_of_education = 'highest_level_of_education';
  String current_employer = 'current_employer';
  String current_job_title = 'current_job_title';
  String monthly_expenses = 'monthly_expenses';
  String monthly_income = 'monthly_income';
  String debts = 'debts';
  String do_you_want_to_own_or_rent_your_home_in_5_years = 'do_you_want_to_own_or_rent_your_home_in_5_years';
  String what_do_you_want_your_primary_mode_of_transportation_to_be_in_5_years = 'what_do_you_want_your_primary_mode_of_transportation_to_be_in_5_years';
  String how_many_dependents_will_you_have_in_5_years = 'how_many_dependents_will_you_have_in_5_years';
  String how_many_pets_will_you_have_in_5_years = 'how_many_pets_will_you_have_in_5_years';
  String do_you_want_to_attend_college_or_certification_classes = 'do_you_want_to_attend_college_or_certification_classes';

  Future<void> setCurrentData(Map<String, dynamic> data) async {
    userName = data["name"]!;
    age = data["age"] as int;
    location = data["location"]!;
    gender = data["gender"]!;
    day_of_birth = data["day_of_birth"]!;
    survey = data["survey"];
    email = data["email"];


    social_media_account = data["social_media_account"];
    housing = data["housing"];
    transportation = data["transportation"];
    dependents = data["dependents"];
    pets = data["pets"];
    highest_degree_diploma_earned = data["highest_degree_diploma_earned"];
    graduation_year = data["graduation_year"];
    highest_level_of_education = data["highest_level_of_education"];
    current_employer = data["current_employer"];
    current_job_title = data["current_job_title"];
    monthly_expenses = data["monthly_expenses"];
    monthly_income = data["monthly_income"];
    debts = data["debts"];
    do_you_want_to_own_or_rent_your_home_in_5_years = data["do_you_want_to_own_or_rent_your_home_in_5_years"];
    what_do_you_want_your_primary_mode_of_transportation_to_be_in_5_years = data["what_do_you_want_your_primary_mode_of_transportation_to_be_in_5_years"];
    how_many_dependents_will_you_have_in_5_years = data["how_many_dependents_will_you_have_in_5_years"];
    how_many_pets_will_you_have_in_5_years = data["how_many_pets_will_you_have_in_5_years"];
    do_you_want_to_attend_college_or_certification_classes = data["do_you_want_to_attend_college_or_certification_classes"];
  }
}

var sendData = UserData.instance;
var userId = '';
