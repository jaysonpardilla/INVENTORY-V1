import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/app_user_model.dart';
import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  AuthRemoteDataSourceImpl({
    required this.firebaseAuth,
    required this.firestore,
  });

  @override
  Future<AppUserModel> signUp(
      String email, String password, String username) async {
    final credential = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = AppUserModel(
      id: credential.user!.uid,
      email: email,
      username: username,
    );

    await firestore.collection('users').doc(user.id).set(user.toMap());

    return user;
  }

  @override
  Future<AppUserModel> signIn(String email, String password) async {
    final credential = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final snapshot =
        await firestore.collection('users').doc(credential.user!.uid).get();

    return AppUserModel.fromFirestore(snapshot.data()!, snapshot.id);
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  @override
  Stream<AppUserModel?> getUserStream() {
    return firebaseAuth.authStateChanges().asyncMap((user) async {
      if (user == null) return null;
      final snapshot = await firestore.collection('users').doc(user.uid).get();
      return AppUserModel.fromFirestore(snapshot.data()!, snapshot.id);
    });
  }
}
