import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/entities/app_user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../../../../core/error/failure.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/app_user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final FirebaseAuth firebaseAuth;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.firebaseAuth,
  });

  @override
  Stream<AppUser?> get userStream => remoteDataSource.getUserStream();

  @override
  AppUser? get currentUser {
    final user = firebaseAuth.currentUser;
    if (user == null) return null;
    return AppUserModel(
      id: user.uid,
      email: user.email ?? '',
      username: user.displayName ?? '',
    );
  }

  @override
  Future<Either<Failure, AppUser>> register(
      String username, String email, String password) async {
    try {
      final user = await remoteDataSource.signUp(email, password, username);
      return Right(user);
    } catch (e) {
      return Left(ServerFailure('Register failed: $e'));
    }
  }

  @override
  Future<Either<Failure, AppUser>> signIn(
      String email, String password) async {
    try {
      final user = await remoteDataSource.signIn(email, password);
      return Right(user);
    } catch (e) {
      return Left(ServerFailure('Sign in failed: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await remoteDataSource.signOut();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Sign out failed: $e'));
    }
  }
}
