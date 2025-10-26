import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../entities/app_user.dart';
import '../repositories/auth_repository.dart';

class RegisterUser {
  final AuthRepository repository;
  RegisterUser(this.repository);

  Future<Either<Failure, AppUser>> call(String username, String email, String password) async {
    return await repository.register(username, email, password);
  }
}
