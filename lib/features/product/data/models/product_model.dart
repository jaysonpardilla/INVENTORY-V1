import '../../domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.ownerId,
    required super.name,
    required super.categoryId,
    super.supplierId,
    required super.price,
    required super.quantityInStock,
    required super.quantityBuyPerItem,
    super.imageUrl,
  });

  factory ProductModel.fromFirestore(
      Map<String, dynamic> data, String documentId) {
    return ProductModel(
      id: documentId,
      ownerId: data['ownerId'] ?? '',
      name: data['name'] ?? '',
      categoryId: data['categoryId'] ?? '',
      supplierId: data['supplierId'],
      price: (data['price'] ?? 0).toDouble(),
      quantityInStock: (data['quantityInStock'] ?? 0).toInt(),
      quantityBuyPerItem: (data['quantityBuyPerItem'] ?? 1).toInt(),
      imageUrl: data['imageUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'ownerId': ownerId,
      'name': name,
      'categoryId': categoryId,
      'supplierId': supplierId,
      'price': price,
      'quantityInStock': quantityInStock,
      'quantityBuyPerItem': quantityBuyPerItem,
      'imageUrl': imageUrl,
    };
  }
}
