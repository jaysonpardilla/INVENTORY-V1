import '../../domain/entities/app_user.dart';

class AppUserModel extends AppUser {
  const AppUserModel({
    required super.id,
    required super.email,
    required super.username,
  });

  factory AppUserModel.fromMap(Map<String, dynamic> map) {
    return AppUserModel(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      username: map['username'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'username': username,
    };
  }

  factory AppUserModel.fromFirestore(
    Map<String, dynamic> data,
    String documentId,
  ) {
    return AppUserModel(
      id: documentId,
      email: data['email'] ?? '',
      username: data['username'] ?? '',
    );
  }
}
