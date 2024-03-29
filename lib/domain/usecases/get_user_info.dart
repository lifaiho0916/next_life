import 'package:next_life/domain/entities/user.dart';
import 'package:next_life/domain/repositories/user_repository.dart';

class GetCurrentUser {
  late UserRepository repository;

  Future<User> execute(String cityName) {
    return repository.getCurrentWeather();
  }
}
