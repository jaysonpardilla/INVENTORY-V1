import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../repositories/auth_repository.dart';

class SignOutUser {
  final AuthRepository repository;
  SignOutUser(this.repository);

  Future<Either<Failure, void>> call() async {
    return await repository.signOut();
  }
}
