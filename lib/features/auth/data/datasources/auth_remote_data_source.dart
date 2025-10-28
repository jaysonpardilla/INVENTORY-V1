import '../models/app_user_model.dart';

abstract class AuthRemoteDataSource {
  Future<AppUserModel> signUp(String email, String password, String username);
  Future<AppUserModel> signIn(String email, String password);
  Future<void> signOut();
  Stream<AppUserModel?> getUserStream();
}
