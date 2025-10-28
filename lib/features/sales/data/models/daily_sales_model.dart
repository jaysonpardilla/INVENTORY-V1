import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/sales_summary.dart';

class DailySalesModel extends DailySales {
  const DailySalesModel({
    required super.id,
    required super.date,
    required super.salesAmount,
    required super.ownerId,
  });

  factory DailySalesModel.fromMap(Map<String, dynamic> map, String id) {
    return DailySalesModel(
      id: id,
      date: (map['date'] as Timestamp).toDate(),
      salesAmount: (map['salesAmount'] ?? 0).toDouble(),
      ownerId: map['ownerId'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'salesAmount': salesAmount,
      'ownerId': ownerId,
    };
  }
}
