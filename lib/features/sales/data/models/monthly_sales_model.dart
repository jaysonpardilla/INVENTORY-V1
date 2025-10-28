import '../../domain/entities/sales_summary.dart';

class MonthlySalesModel extends MonthlySales {
  const MonthlySalesModel({
    required super.id,
    required super.year,
    required super.month,
    required super.salesAmount,
    required super.ownerId,
  });

  factory MonthlySalesModel.fromMap(Map<String, dynamic> map, String id) {
    return MonthlySalesModel(
      id: id,
      year: map['year'] ?? 0,
      month: map['month'] ?? 0,
      salesAmount: (map['salesAmount'] ?? 0).toDouble(),
      ownerId: map['ownerId'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'year': year,
      'month': month,
      'salesAmount': salesAmount,
      'ownerId': ownerId,
    };
  }
}
