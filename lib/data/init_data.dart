// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'dart:core';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:mime/mime.dart';

class WorkSchedule {
  final String time;
  final String workContent;

  WorkSchedule(this.time, this.workContent);
}

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
    Fluttertoast.showToast(
      msg: 'Error occured. ${e.message}',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }
  Fluttertoast.showToast(
    msg: 'Passwprd changed successfully.',
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.green,
    textColor: Colors.white,
  );
}

class UserData {
  static UserData instance = UserData();

  //user_basic_info
  String userName = '';
  int age = 0;
  String day_of_birth = '01/01/2000';
  String gender = '';
  String location = '';
  String curAvatarImage =''; //'assets/meta/avatar.jpg';
  int theme = 0;

  //user_profile_extra_inputs
  String any_other_employers = '';
  String assets = ''; 
  String current_employer = ''; 
  String current_job_title = ''; 
  String dependents = ''; 
  String debts = ''; 
  String do_you_want_to_attend_college_or_certification_classes = '';
  String do_you_want_to_own_or_rent_your_home_in_5_years = '';
  String graduation_year = '';
  String highest_degree_diploma_earned = '';
  String highest_level_of_education = '';
  String housing = '';
  String how_many_dependents_will_you_have_in_5_years = '';
  String how_many_pets_will_you_have_in_5_years = '';
  String length_of_time_to_get_to_your_next_life = '';
  String monthly_expenses = '';
  String monthly_income = '';
  String other_job_titles = '';
  String pets = '';
  String short_term_vs_long_term_make_money_now_or_later = '';
  String social_media_account = '';
  String transportation = '';
  String what_career_would_you_like_to_be_in_5_years = '';
  String what_do_you_want_your_primary_mode_of_transportation_to_be_in_5_years = '';
  String what_is_your_desired_monthly_income_in_5_years = '';
  String what_job_title_would_you_like_to_have_in_5_years = '';
  String when_would_you_like_to_be_in_the_desired_position = '';
  String where_do_you_want_to_live_in_5_years = '';
  String address = '';
  String internetSpeed = '';
  String hobbies = '';
  String sleepSchedule = '';
  String housingType = '';
  String transportationType = '';
  String zipCode = '';
  String cityCode = '';
  String stateCode = '';

  String survey = '';
  String schedule = '';
  String hintText = '';

  List<String> answer= List<String>.filled(7, '');

  void init()
  {
    userName = '';
    age = 0;
    day_of_birth = '01/01/2000';
    gender = '';
    location = '';
    curAvatarImage =''; //'assets/meta/avatar.jpg';
    theme = 0;

    //user_profile_extra_inputs
    any_other_employers = '';
    assets = ''; 
    current_employer = ''; 
    current_job_title = ''; 
    dependents = ''; 
    debts = ''; 
    do_you_want_to_attend_college_or_certification_classes = '';
    do_you_want_to_own_or_rent_your_home_in_5_years = '';
    graduation_year = '';
    highest_degree_diploma_earned = '';
    highest_level_of_education = '';
    housing = '';
    how_many_dependents_will_you_have_in_5_years = '';
    how_many_pets_will_you_have_in_5_years = '';
    length_of_time_to_get_to_your_next_life = '';
    monthly_expenses = '';
    monthly_income = '';
    other_job_titles = '';
    pets = '';
    short_term_vs_long_term_make_money_now_or_later = '';
    social_media_account = '';
    transportation = '';
    what_career_would_you_like_to_be_in_5_years = '';
    what_do_you_want_your_primary_mode_of_transportation_to_be_in_5_years = '';
    what_is_your_desired_monthly_income_in_5_years = '';
    what_job_title_would_you_like_to_have_in_5_years = '';
    when_would_you_like_to_be_in_the_desired_position = '';
    where_do_you_want_to_live_in_5_years = '';
    address = '';
    internetSpeed = '';
    hobbies = '';
    sleepSchedule = '';
    housingType = '';
    transportationType = '';
    zipCode = '';
    cityCode = '';
    stateCode = '';

    survey = '';
    schedule = '';
    hintText = '';

    answer= List<String>.filled(7, '');

  }

  Future<void> setUserBasicData(Map<String, dynamic> data) async {
    userName = data["name"]!;
    age = data["age"] as int;
    location = data["location"]!;
    gender = data["gender"]!;
    day_of_birth = data["day_of_birth"]!;
    curAvatarImage = data["avatar"];
    schedule = data["schedule"];
    theme = data["theme"] as int;
  }
  Future<void> setOtherProfileData(Map<String, dynamic> data) async {
    
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
    survey = data["survey"];
    answer = data["answer"];
    address = data["address"];
    internetSpeed = data["internetSpeed"];
    hobbies = data["hobbies"];
    sleepSchedule = data["sleepSchedule"];
    housingType = data["housingType"];
    transportationType = data["transportationType"];
    zipCode = data["zipCode"];
    cityCode = data["cityCode"];
    stateCode = data["stateCode"];
  }
}

var sendData = UserData.instance;
var userId = '';
var acess_key = "AKIA6GMIPGW7VO7RY5OS";
var security_access_key = "8nyFB30BtPr6MbFvKHjWla3O/UgHlZ8XmsF4ifVK";
var init_flag = false;