import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String ownerId;
  final String name;
  final String categoryId;
  final String? supplierId;
  final double price;
  final int quantityInStock;
  final int quantityBuyPerItem;
  final String? imageUrl;

  const Product({
    required this.id,
    required this.ownerId,
    required this.name,
    required this.categoryId,
    this.supplierId,
    required this.price,
    required this.quantityInStock,
    required this.quantityBuyPerItem,
    this.imageUrl,
  });

  @override
  List<Object?> get props => [
        id,
        ownerId,
        name,
        categoryId,
        supplierId,
        price,
        quantityInStock,
        quantityBuyPerItem,
        imageUrl,
      ];
}
