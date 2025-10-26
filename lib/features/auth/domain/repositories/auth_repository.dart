import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../entities/app_user.dart';

abstract class AuthRepository {
  Stream<AppUser?> get userStream;
  Future<Either<Failure, AppUser>> register(String username, String email, String password);
  Future<Either<Failure, AppUser>> signIn(String email, String password);
  Future<Either<Failure, void>> signOut();
  AppUser? get currentUser;
}
