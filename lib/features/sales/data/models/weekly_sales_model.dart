import '../../domain/entities/sales_summary.dart';

class WeeklySalesModel extends WeeklySales {
  const WeeklySalesModel({
    required super.id,
    required super.year,
    required super.weekNumber,
    required super.salesAmount,
    required super.ownerId,
  });

  factory WeeklySalesModel.fromMap(Map<String, dynamic> map, String id) {
    return WeeklySalesModel(
      id: id,
      year: map['year'] ?? 0,
      weekNumber: map['weekNumber'] ?? 0,
      salesAmount: (map['salesAmount'] ?? 0).toDouble(),
      ownerId: map['ownerId'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'year': year,
      'weekNumber': weekNumber,
      'salesAmount': salesAmount,
      'ownerId': ownerId,
    };
  }
}
