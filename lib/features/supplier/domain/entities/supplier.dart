import 'package:equatable/equatable.dart';

class Supplier extends Equatable {
  final String id;
  final String ownerId;
  final String name;
  final String? contact;
  final String? address;

  const Supplier({
    required this.id,
    required this.ownerId,
    required this.name,
    this.contact,
    this.address,
  });

  @override
  List<Object?> get props => [id, ownerId, name, contact, address];
}
