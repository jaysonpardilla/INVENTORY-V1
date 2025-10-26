import '../entities/app_user.dart';
import '../repositories/auth_repository.dart';

class GetUserStream {
  final AuthRepository repository;
  GetUserStream(this.repository);

  Stream<AppUser?> call() {
    return repository.userStream;
  }
}
