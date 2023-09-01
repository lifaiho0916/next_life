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
    print('Error changing password: ${e.message}');
  }
}

class UserData {
  static UserData instance = UserData();

  String userName = '';
  int age = 0;
  String day_of_birth = '';
  String gender = '';
  String location = '';

  Future<void> setCurrentData(Map<String, dynamic> data) async {
    userName = data["name"]!;
    age = data["age"] as int;
    location = data["location"]!;
    gender = data["gender"]!;
    day_of_birth = data["day_of_birth"]!;
  }
}

var sendData = UserData.instance;
var userId = '';
