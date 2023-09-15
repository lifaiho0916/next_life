import 'package:next_life/domain/entities/user.dart';

abstract class UserRepository {
  Future<User> getCurrentWeather();
}
