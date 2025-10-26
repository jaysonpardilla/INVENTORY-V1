import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../entities/app_user.dart';
import '../repositories/auth_repository.dart';

class SignInUser {
  final AuthRepository repository;
  SignInUser(this.repository);

  Future<Either<Failure, AppUser>> call(String email, String password) async {
    return await repository.signIn(email, password);
  }
}
