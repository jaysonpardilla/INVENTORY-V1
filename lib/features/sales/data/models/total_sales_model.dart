import '../../domain/entities/sales_summary.dart';

class TotalSalesModel extends TotalSales {
  const TotalSalesModel({
    required super.id,
    super.productId,
    required super.salesPerItem,
    required super.totalSales,
    required super.ownerId,
  });

  factory TotalSalesModel.fromMap(Map<String, dynamic> map, String id) {
    return TotalSalesModel(
      id: id,
      productId: map['productId'],
      salesPerItem: (map['salesPerItem'] ?? 0).toDouble(),
      totalSales: (map['totalSales'] ?? 0).toDouble(),
      ownerId: map['ownerId'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'salesPerItem': salesPerItem,
      'totalSales': totalSales,
      'ownerId': ownerId,
    };
  }
}
